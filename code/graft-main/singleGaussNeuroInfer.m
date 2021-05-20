function S = singleGaussNeuroInfer(tau_vec, mov_vec, D, lambda_val, TOL, nonneg, S)

% S = singleGaussNeuroInfer(tau_vec, mov_vec, D, lambda_val, TOL)
% 
% Use quadprog  to solve the weighted LASSO problem for a single vector
% 
% 2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

% if isempty(TOL)
%     TOL = 1e-3;
% end
% 
% if nargin > 5
%     nonneg = varargin{1};
% else
%     nonneg = false;
% end

if size(D,2)~=numel(tau_vec)
    error('Dimension mismatch!')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up problem

% Basic size/dimension re-org
mov_vec = vec(squeeze(mov_vec));                                           % Make sure time-trace is a column vector
tau_vec = vec(tau_vec);                                                    % Make sure weight vector is a column vector
N2      = numel(tau_vec);                                                  % Get the numner of dictionary atoms

% TFOCS options set-up
% opts.tol        = TOL;                                                     % Set TFOCS tolerance
% opts.printEvery = 0;                                                       % Suppress TFOCS output
% if nonneg
%     opts.nonneg = true;
% else
%     opts.nonneg = false;
% end


% Set up linear operator
% Af = @(x) D*(x./tau_vec);                                                  % Set up the forward operator
% Ab = @(x) (D.'*x)./tau_vec;                                                % Set up the backwards (transpose) operator
% A  = linop_handles([numel(mov_vec), N2], Af, Ab, 'R2R');                   % Create a TFOCS linear operator object

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run the weighted LASSO to get the coefficients

qp_opts.Display = 'off';

if norm(mov_vec) == 0
    S = zeros(N2, 1);                                                        % This is the trivial solution to generate all zeros linearly.
else
    if nonneg
        if all(S==0)
            S = quadprog(double(2*(D.'*D)), ...
                double(-2*D.'*mov_vec+lambda_val.*tau_vec), [], ...
                [], [], [], zeros(N2,1), Inf*ones(N2,1), [], qp_opts);        % Use quadratic programming to solve the non-negative LASSO
        else
            S = quadprog(double(2*(D.'*D)), ...
                double(-2*D.'*mov_vec+lambda_val.*tau_vec), [], ...
                [], [], [], zeros(N2,1), Inf*ones(N2,1), S, qp_opts);         % Use quadratic programming to solve the non-negative LASSO
        end
    else
       opts.nonneg = false;
       S = solver_L1RLS(A, mov_vec, lambda_val, zeros(N2, 1), opts );         % Solve the weighted LASSO using TFOCS and a modified linear operator
       S = S./tau_vec;                                                        % Re-normalize to get weighted LASSO values
   end
end

S(S(:)<0.1*max(S(:))) = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
