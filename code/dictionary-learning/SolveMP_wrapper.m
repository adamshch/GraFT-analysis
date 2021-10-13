function coef_vals = SolveMP_wrapper(dictionary_n, x_im, opts)

% coef_vals = l1ls_wrapper(dictionary_n, x_im, opts)
% 
% Wrapper for Matching Pursuit
% 
% Last Modified 6/10/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run l1ls on the desired parameters

coef_vals = SolveMP(dictionary_n, x_im, opts.n_elem);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%