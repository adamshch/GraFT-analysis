function S = singlePoiNeuroInfer(tau_vec, mov_vec, D, maxiter, tolerance, verbose)

% S = singlePoiNeuroInfer(tau_vec, mov_vec, D, maxiter, tolerance, verbose)
% 
% Use SpiralTAP for a single vector
% 
% 2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up problem

% Set up the linear operator for use in SPIRALtap
A   = @(x) D*x;
AT  = @(x) D.'*x;

mov_vec = max(vec(round(squeeze(mov_vec))),0);                             % Make sure the time trace is a positive vector
tau_vec = vec(tau_vec);                                                    % Make sure the weight vector is a vector

finit = (sum(sum(mov_vec)).*numel(AT(mov_vec)))...
    ./(sum(sum(AT(mov_vec))) .*sum(sum((AT(ones(size(mov_vec)))))))...
                                                         .*AT(mov_vec);    % Calculate a good initial point (adapted from SPIRALtap

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run SPIRAL TAP to get the coefficients

[S, ~, ~, ~] = SPIRALTAP(mov_vec, A, tau_vec, 'maxiter', maxiter,...
    'Initialization', finit, 'AT', AT, 'miniter', 5, 'stopcriterion', 3,...
    'tolerance', tolerance, 'alphainit', 1, 'alphamin', 1e-30, ...
    'alphamax', 1e30, 'alphaaccept', 1e30, 'logepsilon', 1e-10, ...
    'saveobjective', 1, 'savereconerror', 0, 'savecputime', 1,...
    'savesolutionpath', 0, 'truth', false, 'verbose', verbose);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%