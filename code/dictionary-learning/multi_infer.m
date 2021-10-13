function coef_vals = multi_infer(dictionary_n, x_im, infer_type, opts)

% coef_vals = multi_l1ls(dictionary_n, x_im, infer_type, opts)
%
% Function to perform inference on a multitude of test vectors. The
% inference algorithm given by infer_type is run on each column of x_im
% with repect to dictionary_n. 
%
% Inputs: 
%       dictionary_n    - The dictionary to decompose the data into
%       x_im            - A matrix with the columns as data to decompose
%       infer_type      - The type of inference algorithm to use. Can be:
%                               - 'l1ls', 'l1ls_nneg', 'cg_l2l1',
%                               'sparsenet', 'MP', 'OMP', 'OOMP', 'OMP_qr',
%                               or 'StOMP'
%                         To use 'MP', 'OOMP', ot 'StOMP', the SparseLab100
%                         library is needed (available at
%                         http://sparselab.stanford.edu). To use OMP_qr,
%                         the sparsify (v4 or later) library available at
%                         http://www.personal.soton.ac.uk/tb1m08/sparsify/sparsify.html
%       opts            - A struct of options needed for the optimization
%                         program selected. 
%
% Outputs: 
%       coef_vals       - optimized coefficients
% 
% Last Modified 6/3/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initializations

% Initialize coefficients
coef_vals = zeros(size(dictionary_n, 2), opts.in_iter);

% Get necessary parameters
if strcmp(infer_type, 'l1ls') || strcmp(infer_type, 'cg_l2l1') || ...
        strcmp(infer_type, 'l1ls_nneg')
    lambda_val = opts.lambda;
    tol = opts.tol;
end

if strcmp(infer_type, 'sparsenet')
    lambda_val = opts.lambda;
end

if strcmp(infer_type, 'OOMP')
    tol = opts.tol;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Perform the L1-regulized optimization on the data

if strcmp(infer_type, 'l1ls')
    parfor index_in = 1:opts.in_iter
        [coef_vals(:, index_in)] = l1_ls(dictionary_n, x_im(:,index_in),...
            lambda_val, tol,1);
    end
elseif strcmp(infer_type, 'cg_l2l1')
    parfor index_in = 1:opts.in_iter
        coef_vals(:, index_in) = cg_l2l1(dictionary_n, tol,...
            x_im(:,index_in), lambda_val);
    end
elseif strcmp(infer_type, 'l1ls_nneg')
    parfor index_in = 1:opts.in_iter
        [coef_vals(:, index_in)] = l1_ls_nonneg(dictionary_n, x_im(:,index_in),...
            lambda_val, tol,1);
    end
elseif strcmp(infer_type, 'sparsenet')
    % sparsenet version
    coef_vals = sparsenet_sparsify(x_im, dictionary_n,...
        opts.lambda, 'soft', 0);
    fprintf('used sparsenet...\n')
elseif strcmp(infer_type, 'MP')
    for index_in = 1:opts.in_iter
       % Find the optimal coefficients for the given basis for each 
       % hyperspectral image vector. This option uses hard-sparse 
       % minimization via Matching pursuit 
       [coef_vals(:, index_in)] = SolveMP(dictionary_n, x_im(:,index_in),...
           size(dictionary_n, 2));
    end
elseif strcmp(infer_type, 'OMP')
    options.tol = opts.tol;
    parfor index_in = 1:opts.in_iter
        coef_vals(:, index_in) = perform_omp(dictionary_n, x_im(:,index_in), options);
    end
elseif strcmp(infer_type, 'OOMP')
    parfor index_in = 1:opts.in_iter
        [coef_vals(:, index_in)] = SolveOOMP(dictionary_n, x_im(:,index_in),...
           tol, Inf, tol);
    end
elseif strcmp(infer_type, 'StOMP')
    for index_in = 1:opts.in_iter
        [coef_vals(:, index_in), ~] = SolveStOMP(dictionary_n, x_im(:,index_in),...
           opts.h_sparse);
    end
elseif strcmp(infer_type, 'OMP_qr')
    parfor index_in = 1:opts.in_iter
        [coef_vals(:, index_in), ~, ~] = greed_omp_qr(x_im(:,index_in), ...
            dictionary_n,size(dictionary_n, 2));
    end
else
    error('Unknown Sparsification function!!')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%