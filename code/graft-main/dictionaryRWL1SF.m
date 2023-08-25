function [S, tau_mat] = dictionaryRWL1SF(mov, D, corr_kern, params, S, varargin)

% [S,tau_mat] = dictionaryRWL1SF(mov, D, corr_kern, params, S)
% 
% This function performs a mixture of 3-D Stochastic filtering that can
% take out Poisson or Gaussian noise.
% 
% 2015 - Adam Charles, Gal Mishne

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parse inputs

if iscell(D)
    if numel(D) == 1
        Phi = 1;
        D   = D{1};
        DTD = double(2*(D.'*D));
    elseif numel(D) == 2
        Phi = 1;
        DTD = D{2};
        D   = D{1};
    elseif numel(D) == 3
        Phi = D{3};
        DTD = D{2};
        D   = D{1};
    else
        error('Bad values for dictionary D input')
    end
else
    DTD = double(2*(D.'*D));
end
D2 = Phi*D;

[params, lambda, beta, maxiter, tolerance, nonneg, verbose, ...
                                likely_form] = paramCheckAll(params, mov); % Parse the params struct to extract all the needed parameters

if nargin > 5; Phi = varargin{1};
else;          Phi = 1;
end

if nargin > 6; solveUse = varargin{2};
else;          solveUse = 'quadprog';
end
% solveUse
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Initializations
if size(mov,3)>1
    [params.nRows,params.nCols,~] = size(mov);                             % 
    mov = reshape(mov,[],size(mov,3));                                     % Reshape the movie to an appropriate size
end
[n_pts,~,nd] = getDataSizes(mov,D);                                        % Get movie height, width, time-length and dictionary size
corr_kern     = checkCorrKern(mov, corr_kern, verbose);                    % Check spatial smoothing kernel

if nargin < 5 || isempty(S)
    S = zeros([n_pts, nd], 'single');                                      % Initialize event data
end
if numel(params.tau) == 1                                                  % Initialize trade-off parameter value/matrix
    tau_mat = single(params.tau)*ones(n_pts, nd, 'single');                % If only one value is given then all coefficients at all locations have the same values
elseif numel(params.tau) == nd 
    params.tau = reshape(params.tau,[1,nd]);
    tau_mat    = single(bsxfun(@times, params.tau, ones(n_pts,1)));        % Otherwise replicate tau variables along the first and second dimension
else
    tau_mat = single(bsxfun(@times, params.tau, ones(1,nd)));              % Otherwise replicate tau variables along the 3rd dimension (dictioanry coefficients) and make values singles for better memeory 
end 
switch likely_form
    case 'poisson'
        mov = single(max(mov,0));                                          % Make movie data a single array and remove zero values from movie data if Poisson
    case 'gaussian'
        mov = single(mov);                                                 % Make movie data a single array
    otherwise
        error('Unknown likelihood form')
end

%mov = single(reshape(mov, im_x*im_y, nt));                                 % Reshape the movie to columns for easier processing (each pixel over time is a column)

DTD = D.'*D; % Precompute the Hessian
% D2  = Phi*D;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run loop

for kk = 1:params.numreps
    % Step 1: Update spike weights: S =  tau/(beta + |S| + |W*S|)
    S = double(S);
    if kk > 1
        verbPrint(params.verbose, 2, 'Evaluating E-step (coefficient weights).')% Optional verbose output (level 2)
        tau_mat = updateTauMat(S, corr_kern, beta, params, n_pts, nd);% Update the matrix of weights
        verbPrint(params.verbose, 2, sprintf('Iteration %d weight update finished.\n',kk))% Optional verbose output (level 2)
    end
    verbPrint(verbose, 2, sprintf('Starting iteration %d inference.',kk))  % Some outputs
    % Run SPIRAL-TAP or LASSO on each vector:
    %for ll = 1:n_pts
    parfor ll = 1:n_pts                                                    % Loop through all the pixels
        switch likely_form                                                 % Find which noise function is selected
            case 'poisson'                                                 % Poisson noise --> use SPIRAL-TAP
                S(ll,:) = singlePoiNeuroInfer(tau_mat(ll,:), mov(ll,:),...
                                          D, maxiter, tolerance, verbose); % Perform column-wise Poisson de-mixing - currently calls SPIRAL-TAP
            case 'gaussian'                                                % Gaussian noise --> use a weighted LASSO
                S(ll,:) = singleGaussNeuroInfer(tau_mat(ll,:), ...
                                 (mov(ll,:).'), {D,DTD}, lambda, ...
                                          1e-4, nonneg, S(ll,:),solveUse); % Perform column-wise Gaussian de-mixing - calls a LASSO solver that can be non-negative
            otherwise
                error('Unknown likelihood form')
        end
    end
    verbPrint(verbose, 2, sprintf('Iteration %d inference finished.',kk))  % Some outputs
end

if params.normalizeSpatial
    for i = 1:nd
        if max(S(:,i)) ~= 0
            S(:,i) = S(:,i) / (max(S(:,i)) + eps);
        end
    end
    S(S(:)<2^(-5))=0;
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Extra functions

function [n_pts,nt,nd] = getDataSizes(mov,D)

n_pts = size(mov,1);                                                       % Get movie height
nt    = size(mov,2);                                                       % Get number of time-steps
nd    = size(D,2);                                                         % Get number of dictionary elements

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Update the tau matrix 

function tau_mat = updateTauMat(S, corr_kern, beta, params, n_pts, nd)

if params.updateEmbed                                                      % If required, recalculate the graph based on the current estimate of coefficients
    P = mkDataEmbedding(S', []);                                           % This line actually runs that re-calculation of the graph
end

if numel(params.tau) == 1                                                  % If the numerator of the weight updates is constant...
    if params.updateEmbed                                                  %  - If the numerator of the weight updates is the size of the dictionary (i.e., one tau per dictioary element)...
        tau_mat = params.tau./(beta + S + P*S);                            %    - Calculate the wright updates tau/(beta + |s_i| + [P*S]_i)
    elseif ~params.updateEmbed                                             %  - If the graph was not updated, use the original graph (in corr_kern)
        if size(corr_kern,1) == n_pts                                      %    - If the weight projection matrix has the same number of rows as pixels, update based on a matrix multiplication                     
            tau_mat = params.tau./(beta + S + corr_kern*S);                %      - Calculate the wright updates tau/(beta + |s_i| + [P*S]_i)
        else
            CF = zeros(size(S));
            for i =1:size(S,2)
                if isempty(params.mask)
                    CF(:,i) = vec(conv2(reshape(S(:,i),params.nRows,params.nCols), corr_kern,'same'));
                else
                    temp = zeros(params.nRows,params.nCols);
                    temp(params.mask(:)) = S(:,i);
                    temp = conv2(temp ,corr_kern,'same');
                    CF(:,i) = temp(params.mask(:));
                end
            end
            tau_mat = params.tau./(beta + S + CF);  %      - Calculate the wright updates tau/(beta + |s_i| + [P*S]_i)
        end
    end
elseif numel(params.tau) == nd                                             % If the numerator of the weight updates is the size of the dictionary (i.e., one tau per dictioary element)...
    if params.updateEmbed                                                  %  - If the graph was updated, use the new graph (i.e., P)
        tau_mat = bsxfun(@times, params.tau, 1./(beta + S + P*S));         %    - Calculate the wright updates tau/(beta + |s_i| + [P*S]_i)
    elseif ~params.updateEmbed                                             %  - If the graph was not updated, use the original graph (in corr_kern)
        if size(corr_kern,1) == n_pts                                      %    - If the weight projection matrix has the same number of rows as pixels, update based on a matrix multiplication
            tau_mat = bsxfun(@times, params.tau, ...
                                             1./(beta + S + corr_kern*S)); %    - Calculate the wright updates tau/(beta + |s_i| + [P*S]_i)
        else                                                               %  - Otherwise, the graph was updated; use the original graph (in corr_kern)
        %%%% I'm not sure what option is supposed to go here
            tau_mat = reshape(convn(reshape(S, [im_x, im_y, nd]),...
                                          corr_kern,'same'), im_x*im_y,1); %    - Get base weights
            tau_mat = bsxfun(@times, params.tau, 1./(beta + S + tau_mat)); %    - Calculate the wright updates tau/(beta + |s_i| + [P*S]_i) 
        end
    end
else
    % If the numerator of the weight updates is the size of the image
    CF = zeros(size(S));
    for i =1:size(S,2)
        if isempty(params.mask)
            CF(:,i) = vec(conv2(reshape(S(:,i),params.nRows,params.nCols)  ,corr_kern,'same'));
        else
            temp = zeros(params.nRows,params.nCols);
            temp(params.mask(:)) = S(:,i);
            CF(:,i) = vec(conv2(temp ,corr_kern,'same'));
        end
    end
    tau_mat = bsxfun(@times, params.tau, ones(1,1,nd))./(beta+S+CF);  %  - Calculate the wright updates tau/(beta + |s_i| + [P*S]_i)
end

tau_mat = single(tau_mat);                                                 % Make sure that the output is a single (for memory considerations)

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Function to parse the input struct "params"

function [params, lambda, beta, maxiter, tolerance, nonneg, verbose, ...
                                   likely_form] = paramCheckAll(params, mov)

       dParams.tau           = 2*sqrt(mean(mov,3));                        % Default tau values to be spatially varying
       dParams.lambda        = 0.6;                                        % Default lambda parameter to 0.6
       dParams.beta          = 0.09;                                       % Default beta parameter to 0.09
       dParams.maxiter       = 0.01;                                       % Default the maximum iteration 
       dParams.numreps       = 2;
       dParams.tolerance     = 1e-8;
       dParams.nonneg        = true;
       dParams.verbose       = 10;
       dParams.updateEmbed   = false;
       dParams.likely_form   = 'gaussian';
       dParams.mask          = [];
       params                = setParams(dParams, params);
       
       lambda                = params.lambda;
       beta                  = params.beta;
       maxiter               = params.maxiter;
       tolerance             = params.tolerance;
       nonneg                = params.nonneg;
       verbose               = params.verbose;
       likely_form           = params.likely_form;

end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
