function S = cg_l2l1(A,tol,X,lambda)

[L,batch_size] = size(X);
[L,M] = size(A);

normA = sum(A.*A)';

% if some of the basis functions have length zero
% (this can happen when all coefficients in frame 0 have value zero)
% ..then initialized the coefficients to zero, instead of the projection
% (this prevents the coefficients from being initialized to NaN)
if (min(normA) == 0)
    S0 = zeros(M,batch_size);
else
    S0 = A'*X;
    for i=1:batch_size
        S0(:,i) = S0(:,i) ./ normA;
    end
end

[S1,fX,ri] = mintotol(S0(:),'objfun_l2l1',100,tol,A,X,lambda);

S=reshape(S1,M,batch_size);

