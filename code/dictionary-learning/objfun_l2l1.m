function [f,g] = objfun_l2l1(x0,A,I,lambda);

[L M]=size(A);
batch_size = size(I,2);
a = reshape(x0,M,batch_size);

Ihat = A*a;

e = I - Ihat;

f = 0.5*sum(e(:).^2) + lambda*sum(abs(a(:)));

df = -(A'*e) + lambda*sign(a);
g = df(:);

