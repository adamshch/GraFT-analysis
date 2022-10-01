function D = sparseDeconvDictEst(D, Y, A, h, opts)

% This function should return the solution to the optimiation
%
% S = argmin[||Y - (h*S)A||_F^2 + ]
%
% D_i = h*S_i


Dfun = @(Z) bilin_fun(Z, Y, A, h, D, opts);
Hfun = @(x, lambda, Z) bilin_Hessfun(x, lambda, Z, Y, A, h, opts);

% minopts = optimset();
minopts = optimoptions(@fmincon,'Algorithm','interior-point','Display','off'); % interior-point
minopts = optimoptions(minopts,'SpecifyObjectiveGradient',true,'CheckGradients',false);
minopts = optimoptions(minopts, 'SubproblemAlgorithm', 'cg', 'HessianMultiplyFcn', Hfun, 'HessianFcn', []);
D = fmincon(Dfun, vec(D), [], [], [], [], zeros(numel(D),1), [], [], minopts);

D = convn(reshape(D,[size(Y,1),size(A,1)]), h, 'same');

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
