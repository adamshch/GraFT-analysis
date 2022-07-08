function coef_vals = rwLCA_wrapper(dictionary_n, x_im, opts)

% coef_vals = rwLCA_wrapper(dictionary_n, x_im, opts)
% 
% Wrapper for the l1ls minimization function
% Required parameters:
%     opts.eta: 2-D vecotr of Delta/T for LCA (1 for coefficients, one
%               for weights. Typically eta(2) < eta(1)/2 
%     opts.gamma_val: Denominator bias for re-weighting. Typically 
%                     ~0.01*||a||_\infty
%     opts.tol: `tolerance' parameter used here to set maximum number
%               of LCA iterations to run. maxIters = floor(1./opts.tol)
% 
% Last Modified 2/16/2015 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run l1ls on the desired parameters

coef_vals = rwLCA(x_im, dictionary_n, 1, opts.eta, opts.gamma_val, floor(1./opts.tol), 0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
