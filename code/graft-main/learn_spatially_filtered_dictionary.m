function [dict_out, varargout] = learn_spatially_filtered_dictionary(data_obj, dict_init, corr_kern, params)

% [dict_out, varargout] = learn_spatially_filtered_dictionary(data_obj, dict_init, corr_kern, params)
%
% Function to learn a dictioanry for spatially ordered/ graph-based data using a
% re-weighted l1 spatial / graph filtering model.
%
% 2018 - Adam Charles, Gal Mishne

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

params      = checkAllParameters(params,data_obj);                         % Check the input parameters valitidy
[M1,M2,T,N] = getProblemSizes(data_obj,dict_init,params);                  % Get some basic problem parameters (data size etc.)
if T > 1                                                                   % If the array is given as an MxNxT array...
    data_obj     = reshape(data_obj,M1*M2,T);                              %   Reshape the data to be a matrix
    M            = M1*M2;                                                  %   Get number of pixels to operate on
    params.nRows = M1;                                                     %   Save number of rows...
    params.nCols = M2;                                                     %      ...and columns
else                                                                       % Otherwise relabel the index sizes appropriately...
    M = M1;                                                                %   including the number of pixles
    T = M2;                                                                %   and the data size
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check spatial smoothing kernel

verbPrint(params.verbose, 2, 'Checking the spatial/embedding kernel...')   % Optional verbose output (level 2)
corr_kern = checkCorrKern(data_obj, corr_kern, params.verbose);            % Check spatial smoothing kernel
verbPrint(params.verbose, 2, 'Correlation kernel OK.')                     % Optional verbose output (level 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initializations

verbPrint(params.verbose, 2, 'Initializing dictionary learning algorithm.') % Optional verbose output (level 2)

if nargout > 2
    extras         = struct;
    extras.dictEvo = [];                                                   % Initialize storage of dicationay evolution
    extras.presMap = [];                                                   % Initialize storage of presence maps
    extras.wghtMap = [];                                                   % Initialize storage of weight maps
end

dict_out = dictInitialize(dict_init, T, N);                                % Make sure dictionary is initialized correctly
step_s   = params.step_s;                                                  % Initialiae the step count
n_iter   = 1;                                                              % Initialize the iteration count
dDict    = Inf;                                                            % Initialize the dictionary change

verbPrint(params.verbose, 2, 'Finished initialization.')                   % Optional verbose output (level 2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run dictionary learning

if params.plot                                                             % In the case that intermediary results are plotted... 
    h1 = figure(100);                                                      % ---
    h2 = figure(200);                                                      %  |-- Initialize the figures
    h3 = figure(300);                                                      % ---
end

while (n_iter <= params.max_learn)&&(dDict > params.learn_eps)             % While the ending conditions are not yet met...
    
    if n_iter == 1                                                         % On the first iteration, initialize the...
        S = [];                                                            %   ... coefficient array
        W = [];                                                            %   ... weight array
    end
    
    [S, W] = dictionaryRWL1SF(data_obj, dict_out, corr_kern, params, S);   % Infer coefficients given the data and dictionary
    
    if params.plot 
        figure(h1)
        clf
        imagesc(basis2img2(S, [params.nRows, params.nCols], [4,4], true, params.mask)); %[1,size(S,3)], true)) ;%ceil(sqrt(size(S,3) ) ) *[1,1]))
        axis image
        axis off
        colormap gray
        title(sprintf('Iter %d',n_iter))
        drawnow
        figure(h2)
        imagesc(basis2img2(log(W),[params.nRows, params.nCols],[4,4], true, params.mask)) ;%ceil(sqrt(size(S,3) ) ) *[1,1]))
        axis image
        axis off
        colormap gray
        title(sprintf('Iter %d',n_iter))
        figure(h3)
        % plot(0:(size(dict_out,1)-1), bsxfun(@plus,bsxfun(@times, dict_out, 1./max(dict_out,[],1)),0:(size(dict_out,2)-1)))
        plot(0:(size(dict_out,1)-1), bsxfun(@plus,bsxfun(@times, dict_out, 1*vec(max(max(S,[],1),[],2)).'),0:(size(dict_out,2)-1)))
        set(gca, 'XLim',[0, (size(dict_out,1)-1)])
        box off
        drawnow
    end
    dict_old = dict_out;                                                   % Save the old dictionary for metric calculations
    dict_out = dictionary_update(data_obj.',dict_out, S.',step_s,params);  % Take a gradient step with respect to the dictionary
    step_s   = step_s*params.step_decay;                                   % Update the step size
    dDict    = norm(vec(dict_out - dict_old).^2)./norm(vec(dict_old));     % Calculate the difference in dictionary coefficients
    verbPrint(params.verbose, 2, ...
       sprintf('Iteration %d: delta dictionary is %f.\n', n_iter, dDict)); % Some outputs
    params.lambda3 = params.lambda3_stp*params.lambda3;                    % Continuation parameter decay
    n_iter   = n_iter + 1;                                                 % Count the iterations
    if nargout > 2
        extras.dictEvo = cat(3,extras.dictEvo,dict_old);                   % Save current dictionary
        extras.presMap = cat(4,extras.presMap, S);                         % Save current presence maps
        extras.wghtMap = cat(4,extras.wghtMap, W);                         % Save current weight maps
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Ouput parsing

if nargout > 1
    varargout{1} = reshape(S,M1,M2,N);
end
if nargout > 2
    extras.var_exp = sum(sum((data_obj - S*dict_out.').^2));
    varargout{2} = extras;
    varargout{3} = n_iter;
    varargout{4} = corr_kern;
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Extra functions


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

function dict_out = dictInitialize(dict_init, T, N)

if isempty(dict_init)                                                      % If no dictionary is provided:
    dict_out = rand(T,N);                                                  %  - Initialize dictionary randomly
    dict_out = dict_out*diag(1./sqrt(sum(dict_out.^2,1)));                 %  - Normlize each vector in the dictionary
else                                                                       % Otherwise:
    dict_out = dict_init;                                                  %  - Use given initial dicitonary
    dict_out = dict_out*diag(1./sqrt(sum(dict_out.^2,1)));                 %  - Normlize each vector in the dictionary
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function params = checkAllParameters(params,data_obj)

    dParams.tau = 1;                                                        % Default tau values to be spatially varying
    dParams.lambda = 0.6;                                                   % Default lambda parameter to 0.6
    dParams.lambda2 = 0;                                                    % Default lambda parameter to 0.6
    dParams.lambda3 = 0;                                                    % Default lambda parameter to 0.6
    dParams.lambda3_stp = 1;                                                % Default lambda parameter to 0.6
    dParams.beta = 0.09;                                                    % Default beta parameter to 0.09
    dParams.maxiter = 0.01;                                                 % Default the maximum iteration
    dParams.numreps = 2;
    dParams.tolerance = 1e-8;
    dParams.verbose = 10;
    dParams.likely_form = 'gaussian';
    dParams.step_s = 1;
    dParams.step_decay = 0.995;
    dParams.max_learn = 1e3;
    dParams.learn_eps = 1e-3;
    dParams.n_dict = 0.5*size(data_obj,3);
    dParams.verb = 1;                                                       % Default to no verbose output
    dParams.grad_type = 'norm';
    dParams.GD_iters = 1;                                                   % Default to one GD step per iteration
    dParams.bshow = 0;                                                      % Default to no plotting
    dParams.nneg_dict = 0;                                                  % Default to not having negativity constraints
    dParams.nonneg = false;                                                 % Default to not having negativity constraints on the coefficients
    dParams.plot = false;                                                   % Default to not plot spatial components during the learning
    dParams.updateEmbed = false;
    dParams.mask = [];                                                      % for masked images (widefield data)
    
    params = setParams(dParams, params);
    
    if ~isempty(params.mask)
        [params.nRows, params.nCols] = size(params.mask);
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
