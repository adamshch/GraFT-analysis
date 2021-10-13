function [a, varargout] = rwLCA(x, phi, thrtype, eta, gamma_val, maxIters, group_cell, varargin)


% test for number of required parametres
if (nargin-length(varargin)) ~= 7
    error('Wrong number of required parameters');
end
% set the defaults for the optional parameters
compute_mse = 0;
% read the optional parameters
a_initialize = 0;
if (rem(length(varargin), 2)==1)
    error('Optional parameters shoudl always go by pairs');
else
    for i=1:2:(length(varargin)-1)
        switch upper(varargin{i})
        case 'TRUE_A'
            compute_mse = 1;
            % set the default outputs that may not be computed
            Evals = zeros(maxIters, 1);
            rMSEs = zeros(maxIters, 1);
            true_a = varargin{i+1};
        case 'INIT_A'
            a_initialize = varargin{i+1};
        end
    end
end

% compute feedforward activations
b = phi'*x;
% initialize lambda to the max value of b
curlambda = max(0.02*abs(b))*ones(numel(group_cell), 1);
curlambda2 = max(0.02*abs(b))*ones(size(phi, 2), 1);
lambda_mean = 0.02*abs(max(b));

lambda_thresh = max(abs(b));
% compute Gramm matrix
G = phi'*phi;
C = G - diag(diag(G));
% initialize a and u
m = size(phi, 2);
a = a_initialize.*ones(m, 1);
u = a_initialize.*ones(m, 1);
% initialize dual objective function
dobj = -Inf;

for it=1:maxIters
    
    if compute_mse
        rMSEs(it) = sum((a(:) - true_a(:)).^2 / sum(true_a(:).^2));
        Evals(it) = sum((x - phi*a(:)).^2 + sum(curlambda.*abs(a(:))));
    end
    
%     % compute duality gap
%     z = phi*(a) - x;
%     nu = 2*z;
%     maxPhinu = norm((phi'*nu)./curlambda, inf);
%     if (maxPhinu > 2)
%         nu = nu*2/maxPhinu;
%     end
%     pobj = z'*z + 2*norm(curlambda.*a, 1);
%     dobj = max(-0.25*(nu')*nu-nu'*x,dobj);
%     gap = pobj - dobj;
%     if (gap/dobj < relTol)
%         disp(['duality gap below threshold after iteration ' num2str(it)]);
%         rMSEs = rMSEs(1:it);
%         Evals = Evals(1:it);
%         return;
%     end
%     gap = 0;
%     dobj = 1;
%    
%     if (mod(it, 100) == 0)
%         disp(['rwLCA iteration ' num2str(it) ' :: dgap = ' num2str(gap/dobj)])
%     end
    
    % update the internal state variables
    u = eta(1)*(b - C*a) + (1-eta(1))*u;
    % update the LCA thresholding parameters
    for kk = 1:numel(group_cell)
        curlambda(kk) = curlambda(kk) + eta(2)*(1./curlambda(kk) - sqrt(sum(a(group_cell{kk}).^2)) - gamma_val);
	curlambda2(group_cell{kk}) = curlambda(kk);
    end
    lambda_use = lambda_mean*curlambda2;
    lambda_use(curlambda <= lambda_thresh) = lambda_thresh;
    
    lambda_thresh = lambda_thresh*0.9;
    
    if thrtype == 1
        % soft threshold
        a = (u - lambda_use.*sign(u)) .* (abs(u) > lambda_use);
    else
        % hard threshold 
        a = u .* (abs(u) > lambda_use);
    end
    
end

%% Output parsing

if nargout > 1
    if compute_mse
        varargout{1} = Evals;
	if nargout > 2
            varargout{2} = rMSEs;
	else
	end
    else
        for kk = 2:nargout
            varargout{kk-1} = [];
	end
    end
else
end

end
