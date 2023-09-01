function [dict_out, varargout] = GraFT(data_obj, dict_init, corr_kern, params)

% [dict_out, {Sout, extras, n_iter, corr_kern}] = learn_spatially_filtered_dictionary(data_obj, dict_init, corr_kern, params)
%
% Function to learn a dictioanry for spatially ordered/ graph-based data using a
% re-weighted l1 spatial / graph filtering model.
%
% 2018 - Adam Charles, Gal Mishne

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

params      = checkAllParameters(params);                                  % Check the input parameters valitidy
[M1,M2,T,N] = getProblemSizes(data_obj,dict_init,params);                  % Get some basic problem parameters (data size etc.)
if T > 1                                                                   % If the array is given as an MxNxT array...
    data_obj     = reshape(data_obj,M1*M2,T);                              %   Reshape the data to be a matrix
    params.nRows = M1;                                                     %   Save number of rows...
    params.nCols = M2;                                                     %      ...and columns
else                                                                       % Otherwise relabel the index sizes appropriately...
    T = M2;                                                                %   i.e. the data size
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Determine access to the MPC toolbox

if license('test','MPC_Toolbox');    solveUse = 'mpc';
else;                                solveUse = 'quadprog';
end
%solveUse = 'quadprog';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check spatial smoothing kernel

verbPrint(params.verbose, 2, 'Checking the spatial/embedding kernel...')   % Optional verbose output (level 2)
corr_kern = checkCorrKern(data_obj, corr_kern, params.verbose);            % Check spatial smoothing kernel
verbPrint(params.verbose, 2, 'Correlation kernel OK.')                     % Optional verbose output (level 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initializations

verbPrint(params.verbose, 2, 'Initializing dictionary learning algorithm.')% Optional verbose output (level 2)

if nargout > 2
    extras         = struct;                                               % Initialize the extras struct
    extras.dictEvo = [];                                                   % Initialize storage of dicationay evolution
    extras.presMap = [];                                                   % Initialize storage of presence maps
    extras.wghtMap = [];                                                   % Initialize storage of weight maps
end

dict_out = dictInitialize(dict_init, T, N);                                % Make sure dictionary is initialized correctly
step_s   = params.step_s;                                                  % Initialiae the step count
n_iter   = 1;                                                              % Initialize the iteration count
dDict    = Inf;                                                            % Initialize the dictionary change

verbPrint(params.verbose, 2, 'Finished initialization.')                   % Optional verbose output (level 2)

if params.plot; h1 = figure(100); end                                      % In the case that intermediary results are plotted initialize the figure 

S = [];                                                                    % Initialize the coefficient array

% Phi = randn(10*size(dict_out,2),size(dict_out,1));
% Phi = diag(1./sqrt(sum(abs(Phi.^2),2)))*Phi;
Phi = 1;

% Phi = randn(3*size(dict_out,2),size(dict_out,1));
% Phi = diag(1./sqrt(sum(abs(Phi.^2),2)))*Phi;
Phi = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pre-process time compression
if params.time_compression < 1
  [time_data_obj, time_mat] = time_compress(data_obj, ceil((size(data_obj, 2) * params.time_compression)));
  time_dict_out = (time_mat * dict_out);
end

Smat = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% Run dictionary learning - Main loop
while (n_iter <= params.max_learn)&&(dDict > params.learn_eps)             % While the ending conditions are not yet met...
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% First step is to compute the presence coefficients from the dictionary:
    tic;
    if (params.time_compression < 1)
      if (n_iter <= 1)
       DTD = time_dict_out.'*time_dict_out; % Precompute the Hessian   
       end
       [S, W] = dictionaryRWL1SF(time_data_obj,{time_dict_out,DTD,Phi},corr_kern,params,S);   
    else
	DTD = dict_out.'*dict_out; % Precompute the Hessian   
	[S, W] = dictionaryRWL1SF(data_obj,{dict_out,DTD,Phi},corr_kern,params,S);   
    end
%     D2  = Phi*dict_out;
%    [S, W] = dictionaryRWL1SF(data_obj,{dict_out,DTD,Phi},corr_kern,params,S);
    %   [S, W] = dictionaryRWL1SF(data_obj,dict_out,corr_kern,params,S);   % Infer coefficients given the data and dictionary
    %[S, W] = dictionaryRWL1SF(data_obj,dict_out,corr_kern,params,S,Phi,solveUse);   % Infer coefficients given the data and dictionary
    T1 = toc;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Temporary plotting code to show intermediary values:
    
    if params.plot 
        figure(h1); clf
        subplot(2,2,1), cla; imagesc(basis2img2(S,...
                     [params.nRows,params.nCols],[4,5],true,params.mask)); % Temporary plot of the current spatial maps
        axis image; axis off; colormap gray;                               % Set plotting style/options
        title(sprintf('Iteration %d presences',n_iter))
        subplot(2,2,2), cla; imagesc(basis2img2(log(W),[params.nRows, ...
                                  params.nCols],[4,5],true, params.mask)); % Temporary plot of the spatial weight distributions
        axis image; axis off; colormap gray;                               % Set plotting style/options
        title(sprintf('Iteration %d weights',n_iter))
        tmpD = bsxfun(@times,dict_out,vec(max(max(S,[],1),[],2)).');
        subplot(2,2,[3,4]), cla; plot(0:(T-1),bsxfun(@plus,...
                               tmpD/max(tmpD(:)),0:(size(dict_out,2)-1))); % Temporary plot of the current dictionary (time-traces
        set(gca, 'XLim',[0, (size(dict_out,1)-1)]); box off;               % Set plotting style/options
        title(sprintf('Iteration %d dictionary',n_iter))
        drawnow
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Second step is to update the dictionary:
    if (params.time_compression < 1)
      dict_old = time_dict_out;                                                   % Save the old dictionary for metric calculations
    else
      dict_old = dict_out;
    end
    % Process compression before dictionary_update
    %if (params.space_compression < 1 && n_iter == 1)
    %  [sketch_data_obj, sketch_S, Smat] = space_compress(data_obj, S, compressed_pixel);
    %elseif (params.space_compression < 1)
    %  sketch_data_obj = Smat * data_obj;
    %  sketch_S = Smat * S
    %end

    tic;
    if (params.time_compression < 1)
	 
       %time_dict_out = (time_mat * dict_out);
       time_dict_out = dictionary_update(time_data_obj.',time_dict_out, S.',step_s,params);
    else
      dict_out = dictionary_update(data_obj.',dict_out, S.',step_s,params);  % Take a gradient step with respect to the dictionary
    end
    T2 = toc;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Some prelude stuff and outputs for verification
    
    step_s   = step_s*params.step_decay;                                   % Update the step size
    if (params.time_compression < 1)
    dDict    = norm(vec(time_dict_out - dict_old))./norm(vec(dict_old));        % Calculate the difference in dictionary coefficients
    else
      dDict    = norm(vec(dict_out - dict_old))./norm(vec(dict_old));  
    end
    verbPrint(params.verbose, 1, ...
           sprintf('Iteration %d: delta dictionary is %f. (Tsp = %f, Tdu = %f)', ...
           n_iter, dDict, T1, T2))% Some outputs
    verbPrint(params.verbose, 1, sprintf('      -- max S = %f. mean D = %f',...
                                      max(max(max(S))), mean(dict_out(:))))% Some outputs   
    
    params.lamCont = params.lamContStp*params.lamCont;                     % Continuation parameter decay
    n_iter         = n_iter + 1;                                           % Count the iterations
    
    if nargout > 2
        extras.dictEvo = cat(3,extras.dictEvo,dict_old);                   % Save current dictionary
        extras.presMap = cat(4,extras.presMap, S);                         % Save current presence maps
        extras.wghtMap = cat(4,extras.wghtMap, W);                         % Save current weight maps
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Resize compression
if (params.time_compression < 1)
  [S, W] = dictionaryRWL1SF(time_data_obj,{time_dict_out,DTD,Phi},corr_kern,params,S); 
  %[S, W] = dictionaryRWL1SF(time_data_obj,time_dict_out,corr_kern,params,S,Phi,solveUse);
  inverted = pinv(time_mat);
  dict_out = dictionary_update(data_obj.', inverted * time_dict_out, S.', step_s, params);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Some post-processing
% Re-compute the presence coefficients from the dictionary:
if ~params.normalizeSpatial
    [S, ~] = dictionaryRWL1SF(data_obj,dict_out,corr_kern,params,S);       % Infer coefficients given the data and dictionary
end
Dnorms   = sqrt(sum(dict_out.^2,1));                                       % Get norms of each dictionary element
Smax     = max(S,[],1);                                                    % Get maximum value of each spatial map
actMeas  = Dnorms(:).*Smax(:);                                             % Total activity metric is the is the product of the above
[~,IX]   = sort(actMeas,'descend');                                        % Get the indices of the activity metrics in descending order
dict_out = dict_out(:,IX);                                                 % Reorder the dictionary
S        = S(:,IX);                                                        % Reorder the spatial maps

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ouput parsing

if nargout > 1
    if isfield(params,'mask') && ~isempty(params.mask)
        Sout = zeros(params.nRows*params.nCols,N);
        Sout(params.mask,:) = S;
        varargout{1} = reshape(Sout,params.nRows,params.nCols,N);
    else
        varargout{1} = reshape(S,M1,M2,N);
    end
end
if nargout > 2
    extras.var_exp = sum(sum((data_obj - S*dict_out.').^2));
    varargout{2} = extras;                                                 % If asked for, output the extras struct
    varargout{3} = n_iter;                                                 % If asked for, output the number of iterations run
    varargout{4} = corr_kern;                                              % If asked for, output the correlation kernel 
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Extra functions

function [M1,M2,T,N] = getProblemSizes(data_obj,dict_init,params)

M1 = size(data_obj,1);                                                     %
M2 = size(data_obj,2);
T  = size(data_obj,3);
if ~isempty(dict_init)
    N = size(dict_init,2);
elseif isfield(params,'n_dict')
    N = params.n_dict;
else
    N = ceil(0.5*T);
    warning('No dictionary size supplied: using N = T/2.\n')
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check all parameters and set the remainder to defaults

function params = checkAllParameters(params)
    dParams.tau         = 1;                                               % Default tau values to be spatially varying
    dParams.lambda      = 0.6;                                             % Default lambda parameter is 0.6
    dParams.lamForb     = 0;                                               % Default Forbenius norm parameter is 0 (don't use)
    dParams.lamCont     = 0;                                               % Default Dictionary continuation term parameter is 0 (don't use)
    dParams.lamContStp  = 1;                                               % Default multiplicative change to continuation parameter is 1 (no change)
    dParams.lamCorr     = 0;                                               % Default Dictionary correlation regularization parameter is 0 (don't use)
    dParams.beta        = 0.09;                                            % Default beta parameter to 0.09
    dParams.maxiter     = 0.01;                                            % Default the maximum iteration to whenever Delta(Dictionary)<0.01
    dParams.numreps     = 2;                                               % Default number of repetitions for RWL1 is 2
    dParams.tolerance   = 1e-8;                                            % Default tolerance for TFOCS calls is 1e-8
    dParams.verbose     = 10;                                              % Default to full verbosity level
    dParams.likely_form = 'gaussian';                                      % Default to a gaussian likelihood ('gaussian' or 'poisson')
    dParams.step_s      = 1;                                               % Default step to reduce the step size over time (only needed for grad_type = 'norm')
    dParams.step_decay  = 0.995;                                           % Default step size decay (only needed for grad_type = 'norm')
    dParams.max_learn   = 1e3;                                             % Maximum number of steps in learning is 1000 
    dParams.learn_eps   = 0.01;                                            % Default learning tolerance: stop when Delta(Dictionary)<0.01
%    dParams.n_dict      = selectDictSize(data_obj);                        % Default number of dictionary elements is a function of the data
    dParams.verb        = 1;                                               % Default to no verbose output
    dParams.grad_type   = 'full_ls_cor';                                   % Default to optimizing a full optimization on all dictionary elements at each iteration
    dParams.GD_iters    = 1;                                               % Default to one GD step per iteration
    dParams.bshow       = 0;                                               % Default to no plotting
    dParams.nneg_dict   = 1;                                               % Default to not having negativity constraints
    dParams.nonneg      = true;                                           % Default to not having negativity constraints on the coefficients
    dParams.plot        = false;                                           % Default to not plot spatial components during the learning
    dParams.updateEmbed = false;                                           % Default to not updateing the graph embedding based on changes to the coefficients
    dParams.mask        = [];                                              % for masked images (widefield data)
    dParams.normalizeSpatial = false;                                      % default behavior - time-traces are unit norm. when true, spatial maps normalized to max one and time-traces are not normalized
    dParams.time_compression = 1; % Specifies compression ratio of time points. Should vary between (0, 1] where 1 is equivalent to no compression
    params = setParams(dParams, params);
    
    if ~isempty(params.mask)
        [params.nRows, params.nCols] = size(params.mask);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Select the size of the dictionary to work with, if not specified

function N = selectDictSize(data_obj)
    if ~ismatrix(data_obj)
        data_obj = reshape(data_obj,[],size(data_obj,3));                  % Make sure that data_object is a matrix for the sequel
    end
    minDim   = min(size(data_obj));                                        % Get the minimum size of the data
    singVals = svds(data_obj, min(100, minDim-10));                        % Get top < 100 singular values
    minSVals = svds(data_obj, 10, 'smallest');                             % Get smallest 10 singular values
    locs2Fit = [1:numel(singVals), (minDim-9):minDim];                     % Specify the location of the points to fit a Gamma to
    vals2Fit = [singVals(:);minSVals(:)];                                  % Specify the values of the points to fit a Gamma to
    gamCost  = @(x) norm(vals2Fit - x(3)*gampdf(locs2Fit(:),x(1),x(2)))^2; % Set up cost function that will optimize a Gamma function
    Phat     = fmincon(gamCost,[2,1,1],[],[],[],[],[0,0,0],...
             minDim*[1,1,Inf],[],optimoptions('fmincon','Display','off')); % Fig a Gamma function to the singular value curve
    N = fmincon(@(x) abs(0.01 - gampdf(x,Phat(1),Phat(2))),20,[],[],[],...
                   [],0,minDim,[],optimoptions('fmincon','Display','off'));% Fit the location of the where the Gamma pdf is 0.01
    N = ceil(N);                                                           % Round the number to an integer
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [Y, S] = time_compress(X, t)
% X: 2d matrix (pixel x pixel) x time
% t: compressed time dimension size
% Y: 2d matriz (pixel x pixel) x t image
% S: sketched matrix t x time sketching matrix
Xt = X.';
dim = size(Xt);
S = randn(t, dim(1));
Y = S * Xt;
Y = Y.';
end

