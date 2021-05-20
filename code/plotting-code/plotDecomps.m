function plotDecomps(SN, DN, varargin)

% plotDecomps(SN, DN, {mask})
% 
% Plot the outputs of decomposition of calcium imaging data. 
% 
% 2019 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parse inputs

if nargin > 2
    mask = varargin{1};
else
    mask = 1;
end

if isempty(mask)
    mask = 1;
end

if nargin > 3
    figno = varargin{2};
else
    figno = 101;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up plots

figure(figno);
SN        = bsxfun(@times, SN, ~isnan(mask));
S2        = SN;
% S2(SN==0) = mean(SN(SN~=0));
% S2        = S2 - mean(SN(SN~=0));

% subplot(3,2,[3,6]), imagesc(basis2img2(reshape(S2,[],size(S,3)),size(S(:,:,1)), ceil(sqrt(size(S,3)))*[1,1]),[0.8,1])
subplot(1,2,1), imagesc(basis2img2(reshape(S2,[],size(SN,3)), size(SN(:,:,1)), [5,6], true),[0,1])
axis image; axis off;
set(gcf, 'color', [1,1,1])

subplot(1,2,2), plot(1:(size(DN,1)), bsxfun(@plus,bsxfun(@times, DN, 1*vec(max(max(SN,[],1),[],2)).'),0:(size(DN,2)-1)))
set(gca, 'XLim',[0, (size(DN,1)-1)],'YLim',[1,1.1*(size(DN,2))])
box off

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%