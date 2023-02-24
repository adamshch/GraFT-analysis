function [S, iA] = singleGaussNeuroInfer(tau_vec, mov_vec, D, lambda_val, TOL, nonneg, S, varargin)
%function S = singleGaussNeuroInfer(tau_vec, mov_vec, D, lambda_val, TOL, nonneg, S, varargin)

% S = singleGaussNeuroInfer(tau_vec, mov_vec, D, lambda_val, TOL)
% 
% Use MPC to solve the weighted LASSO problem for a single vector
% 
% 2018 - Adam Charles
% 2022 - Alex Estrada - MPC Update

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

% if license('test','MPC_Toolbox');    useMPC = true;
% else;                                useMPC = false;
% end

if nargin > 7;   solveUse = varargin{1};
else;            solveUse = 'quadprog';  % QUADPROG, TFOCS, FISTA 
end

if iscell(D)
    if numel(D) == 1
        D   = D{1};
        DTD = double(2*(D.'*D));
    elseif numel(D) == 2
        DTD = D{2};
        D   = D{1};
    else
        error('Bad values for dictionary D input')
    end
end

if isempty(TOL);  TOL = 1e-3;  end
if size(D,2)~=numel(tau_vec);   error('Dimension mismatch!'); end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up problem (Basic size/dimension re-org)

mov_vec = vec(squeeze(mov_vec));                                           % Make sure time-trace is a column vector
tau_vec = vec(tau_vec);                                                    % Make sure weight vector is a column vector
N2      = numel(tau_vec);                                                  % Get the numner of dictionary atoms

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run the weighted LASSO to get the coefficients


qp_opts.Display = 'off';

if norm(mov_vec) == 0
    S = zeros(N2, 1);                                                      % This is the trivial solution to generate all zeros linearly.
else
    if nonneg
        switch lower(solveUse)
            case 'mpc'
                mpc_opts        = mpcActiveSetOptions;
                if ~exist('iA', 'var'); iA = false(0,1);  
                else; iA = false(size(zeros(0,1)));   end
                [S, ~, iA, ~] = mpcActiveSetSolver(DTD,...                     % Hessian matrix
                     double(-2*D.'*mov_vec+lambda_val.*tau_vec),...        % Multiplier of the objective linear function
                     zeros(0,n),...                                        % Linear inequality constraint coefs
                     zeros(0,1),...                                        % Right-hand side of inequality constraints
                     zeros(0,n),...                                        % Linear eq constraint coefs
                     zeros(0,1),...                                        % Right-hand side of eq. constraints
                     iA,...                           % Initial active inequalities
                     mpc_opts);                                                % Using MPC to solve the non-negative weighted LASSO
            case 'quadprog'                      
                S = quadprog(double(2*(DTD)), ...
                    double(-2*D.'*mov_vec+lambda_val.*tau_vec), [], ...
                    [], [], [], zeros(N2,1), Inf*ones(N2,1), S(:), qp_opts);        % Use quadratic programming to solve the non-negative LASSO
            case 'tfocs' 
                opts.nonneg     = true;
                opts.tol        = TOL;                                                     % Set TFOCS tolerance
                opts.printEvery = 0;     
                S = solver_L1RLS(D, mov_vec, lambda_val.*tau_vec, S(:), opts);         % Solve the weighted LASSO using TFOCS and a modified linear operator
            case 'fista'
                par_spams.mode   = 2;
                par_spams.pos    = true;
                par_spams.lambda = max(mean(tau_vec),1e-3);
                S = mexLassoWeighted(double(mov_vec), D, ...
                          double(tau_vec)./par_spams.lambda, par_spams);  
            otherwise
        end
    else
       opts.nonneg = false;
       S = solver_L1RLS(D, mov_vec, lambda_val.*tau_vec, [], opts);        % Solve the weighted LASSO using TFOCS and a modified linear operator
%        S = S./tau_vec;                                                        % Re-normalize to get weighted LASSO values
   end
%     if nonneg
%         if all(S==0)
%             S = quadprog(double(2*(DTD)), ...
%                 double(-2*D.'*mov_vec+lambda_val.*tau_vec), [], ...
%                 [], [], [], zeros(N2,1), Inf*ones(N2,1), [], qp_opts);        % Use quadratic programming to solve the non-negative LASSO
%         else
%             S = quadprog(double(2*(DTD)), ...
%                 double(-2*D.'*mov_vec+lambda_val.*tau_vec), [], ...
%                 [], [], [], zeros(N2,1), Inf*ones(N2,1), S, qp_opts);         % Use quadratic programming to solve the non-negative LASSO
%         end
%     else
%        opts.nonneg = false;
%        S = solver_L1RLS(D, mov_vec, lambda_val, zeros(N2, 1), opts );         % Solve the weighted LASSO using TFOCS and a modified linear operator
%        S = S./tau_vec;                                                        % Re-normalize to get weighted LASSO values
%    end
end

S(S(:)<0.1*max(S(:))) = 0; % Sparsifying step to remove small values

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
