function coef_vals = l1ls_wrapper(dictionary_n, x_im, opts)

% coef_vals = l1ls_wrapper(dictionary_n, x_im, opts)
% 
% Wrapper for the l1ls minimization function
% 
% Last Modified 6/10/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run l1ls on the desired parameters

coef_vals = l1_ls(dictionary_n, x_im, opts.lambda, opts.tol,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%