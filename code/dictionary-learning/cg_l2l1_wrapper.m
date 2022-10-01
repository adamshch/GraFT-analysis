function coef_vals = cg_l2l1_wrapper(dictionary_n, x_im, opts)

% coef_vals = l1ls_wrapper(dictionary_n, x_im, opts)
% 
% Wrapper for the l2l1 conjugate gradient minimization function
% 
% Last Modified 6/10/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run l1ls on the desired parameters

coef_vals = cg_l2l1(dictionary_n, opts.tol, x_im, opts.lambda);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%