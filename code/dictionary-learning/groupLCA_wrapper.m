function coef_vals = groupLCA_wrapper(dictionary_n, x_im, opts)

% coef_vals = l1ls_wrapper(dictionary_n, x_im, opts)
% 
% Wrapper for the block l1 minimization function
% 
% Last Modified 1/28/2015 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run l1ls on the desired parameters

coef_vals = groupLCA(x_im, dictionary_n, opts.lambda, opts.groups, opts.tol);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
