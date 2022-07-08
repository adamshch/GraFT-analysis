function [fun,varargout] = bilin_fun(S, Y, A, h, D, opt)

% function [fun,varargout] = bilin_fun(S, Y, A, h, D, opt)
% 
% Function to calculate function value and gradient
%
% 2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S = reshape(S(:),[size(Y,1), size(A,1)]);                                  % Make sure that S is a matrix of  the correct size

h  = vec(h);                                                               % ensure that h is a vector


% H = h;
D2 = applyH(S,h,1);                                                        % Calculate current dictionary
% D2 = H*S;                                                        % Calculate current dictionary
Y2 = D2*A;
C  = D2.'*D2;
C(1:size(C,1)+1:end) = 0;

fun = sum(vec(Y-Y2).^2) + opt.lambdaS*sum(S(:)) + opt.lambda2*sum(D2(:).^2) ...
            + opt.lambda3*sum(vec(D-D2).^2) + opt.lambda4*sum(abs(C(:)));
fun = double(fun);

if nargout > 1
    % calculate deriative
    % First term   dS||Y-H*S*A||_F^2          = 2*H^T(H*S*A - Y)A^T
    % Second term  dS||H*S||_F^2              = 2*H^T*H*S
    % Third term   dS||D-H*S||_F^2            = 2*H^T*(H*S - D)
    % Fourth term  dS||(H*S)^T*H*S||_{od-sav} = 2*H^T*H*S*W; W = 1-I
    W = ones(size(D2,2));
    W(1:size(W,1)+1:end) = 0;

    varargout{1} = opt.lambdaS*ones(size(S)) + 2*applyH((Y2-Y)*(A') +...
                opt.lambda2*D2 + opt.lambda3*D2-D + opt.lambda4*D2*W,h,2); % Calculate the gradient
    
%     varargout{1} = opt.lambdaS*ones(size(S)) + 2*applyH(((Y2-Y)*A' + ...
%                opt.lambda2*D2 + opt.lambda3*(D2-D) + opt.lambda4*D2*W),h,2); % Calculate the gradient
    varargout{1} = double(reshape(varargout{1},[],1));     
end

% if nargout > 2 % Too large to implement currently
%     % calculate Hessians
%     % First term   dS 2*vec((H^T*H)*S*(A*A^T)) = 2*kron((A*A^T),(H^T*H))
%     % Second term  dS 2*H^T*H*S                = 2*kron(I,(H^T*H))
%     % Third term   dS 2*(H^T*H)*S              = 2*kron(I,(H^T*H))
%     % Fourth term  dS 2*H^T*H*S*W              = 2*kron(W,(H^T*H)); W = 1-I
%     
%     H = hankel(flipud([h;zeros(size(S,1),1)]));
%     H = flipud(H(ceil(size(h,1)/2) +(1:size(S,1)),1:size(S,1)));
%     varargout{2} = 2*kron(A*A' + 2*eye(size(A,1)) + W, H'*H);
%     varargout{2} = double(varargout{2});
% end
              
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Auxiliary function to apply H and H^T

function Y = applyH(X,h,T)

% Function to apply the linear operator H and it's transpose H^T using
% convolutional operators. H is defined as:
% H = hankel(flipud([h;zeros(size(X,1),1)]));
% H = flipud(H(ceil(size(h,1)/2) +(1:size(X,1)),1:size(X,1)));

if T == 1
    Y = convn(X, h, 'same');                                               % y = flipud(H*x);
elseif T == 2
    Y = convn(X, flipud([h;0]),'same');                                    % z1 = H.'*y1;
else
    error('T invalid: options for T are T=1 for H(X) and T=2 for H^T(X)!')
end

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
