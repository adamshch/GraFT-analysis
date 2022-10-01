function Happ = bilin_Hessfun(x, lambda, S, Y, A, h, opt)

% function [fun,varargout] = bilin_Hessfun(S, Y, A, h, D, opt)
% 
% Function to calculate hessian multiplication function 
% for 'HessianMultiplyFcn'
%
%
% calculate Hessians
% First term   dS 2*vec((H^T*H)*S*(A*A^T)) = 2*kron((A*A^T),(H^T*H))
% Second term  dS 2*H^T*H*S                = 2*kron(I,(H^T*H))
% Third term   dS 2*(H^T*H)*S              = 2*kron(I,(H^T*H))
% Fourth term  dS 2*H^T*H*S*W              = 2*kron(W,(H^T*H)); W = 1-I
%
% 2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h = vec(h);

S = reshape(S(:),[size(Y,1), size(A,1)]);                                  % Make sure that S is a matrix of  the correct size

W = ones(size(A,1));
W(1:size(W,1)+1:end) = 0;

HHS = 2*applyH(applyH(S,h,1),h,2);

% H = hankel(flipud([h;zeros(size(S,1),1)]));
% H = flipud(H(ceil(size(h,1)/2) +(1:size(S,1)),1:size(S,1)));
% varargout{2} = 2*kron(A*A' + (opt.lambda2+opt.lambda3)*eye(size(A,1)) + opt.lambda3*W, H'*H);
% varargout{2} = double(varargout{2});
    
Happ = vec(HHS*(double(A*A') + (opt.lambda2+opt.lambda3)*eye(size(A,1)) + opt.lambda3*W)); 
    
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