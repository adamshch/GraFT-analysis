function S = reCalcCoefWithLS(data, D, S, nonneg)

% S = recalcCoefWithLS(data, D, S)
%
%
%
% 202 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

S_on = abs(S)>10*eps;  % Compute the support of all pixels
classS = class(S);
if ndims(S)==3
    nPix  = size(S,1)*size(S,2); % get number of pixels
    nCoef = size(S,3);
    for ll = 1:nPix
	[iX,iY] = ind2sub([size(S,1),size(S,2)],ll);
	idxCoef = squeeze(S_on(iX,iY,:))'==1;

        TMP = cast(zeros(nCoef,1),classS);
        %S(iX,iY,idxCoef) = cast(lsqnonneg(double(D(:,idxCoef)),...
        TMP(idxCoef) = cast(lsqnonneg(double(D(:,idxCoef)),...
                                  double(squeeze(data(iX,iY,:))).'),class(S)); % Compute the least-squares solution for the coefficient
        %S(iX,iY,~idxCoef) = cast(0,class(S));
        S(iX,iY,:) = TMP;
    end
elseif ndims(S)==2
    nPix  = size(S,1);
    nCoef = size(S,2);
    parfor ll = 1:nPix
	idxCoef = squeeze(S_on(ll,:))'==1;
        TMP = cast(zeros(nCoef,1),classS);
        %S(ll,idxCoef) = cast(lsqnonneg(double(D(:,idxCoef)),...
        TMP(idxCoef) = cast(lsqnonneg(double(D(:,idxCoef)),...
	                            double(squeeze(data(ll,:))).'),classS); % Compute the least-squares solution for the coefficient
        %S(ll,~idxCoef) = cast(0,classS);
        S(ll,:) = TMP;
    end
else
    error('Bad format for coefficient array')
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


