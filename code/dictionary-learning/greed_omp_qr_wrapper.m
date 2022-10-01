function coef_vals = greed_omp_qr_wrapper(dictionary_n, x_im, opts)

% coef_vals = l1ls_wrapper(dictionary_n, x_im, opts)
% 
% Wrapper for the QR implementation of Orthogonal Matching Pursuit
% 
% Last Modified 6/10/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run l1ls on the desired parameters

[coef_vals, ~, ~] = greed_omp_qr(x_im, dictionary_n, opts.n_elem);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%