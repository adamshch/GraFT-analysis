function a = groupLCA(y, A, lambda, group_cell, varargin)

% a = solve_grouplasso_lca(y, A, lambda, group_cell, tol)
% 
% Block l1 minimization (group lasso) function. Uses LCA to optimize.
% 
% y          - vector to infer decomposition
% A          - sparsity matrix (generative mode: y = A*a)
% lambda     - regularization trade-off parameter
% group cell - cell of groups (each cell has indices for one group)
% tol        - algorithm tolerance. runs until ||u_t - u_{t-1}||_2^2 < tol
%
%
% Last Modified 1/28/2015 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run l1ls on the desired parameters

if nargin < 4
    error('Too few inputs to solve_grouplasso_lca!')
elseif nargin == 4
    tol = 1e-3;
    DeltaT = 0.1;
elseif nargin == 5
    tol = varargin{1};
    DeltaT = 0.1;
elseif nargin == 6
    tol = varargin{1};
    DeltaT = 0.1;
else
    error('Too many inputs to solve_grouplasso_lca!')
end

u = zeros(size(A, 1), 1);
a = zeros(size(A, 1), 1);


deta_u = 1;
while delta_u > tol

    % update u
    u2 = DeltaT*(Aty - u2- AtA*a)+u2 ;
    % threshold for a
    for kk = 1:numel(group_cell)
        u_tmp = u(group_cell{kk});
	if sqrt(sum(u_tmp.^2)) < lambda
            a(group_cell{kk}) = zeros(size(u_tmp));
	elseif sqrt(sum(u_tmp.^2)) >= lambda
            a(group_cell{kk}) = u_tmp*(1-lambda./sqrt(sum(u_tmp.^2)));
        else
        end
    end

    delta_u = sum((u2 - u).^2);
    u = u2;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
