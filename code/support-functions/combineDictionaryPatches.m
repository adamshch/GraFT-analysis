function [D, S, graphK] = combineDictionaryPatches(RESULTS, n_patches, patches, sizY, K)

fprintf('Combining results from different patches... \n');
cnt  = 0;
d    = prod(sizY(1:end-1));
S    = sparse(d,n_patches*K);
MASK = zeros(sizY(1:end-1));

for i = 1:n_patches
    patch_lin_idx = patch_to_linear(patches{i}, sizY);
    for k = 1:K
        if k > size(RESULTS(i).S,2)
            break;
        end
        cnt = cnt + 1;
        S(patch_lin_idx,cnt) = reshape(RESULTS(i).S(:,:,k),[],1);
    end
    MASK(patch_lin_idx) = MASK(patch_lin_idx) + 1;
end
%%
S(:,cnt+1:end) = [];
D              = cell2mat({RESULTS(:).D});
ff             = find(sum(S,1)==0);

D(:,ff) = [];                                                              % Initialize the full dictionary
S(:,ff) = [];                                                              % Initialize the full presence maps

graphK = sparse(size(S,1),size(S,1));
for i = 1:n_patches
    patch_lin_idx = patch_to_linear(patches{i}, sizY);
    graphK(patch_lin_idx,patch_lin_idx) = graphK(patch_lin_idx,patch_lin_idx) + RESULTS(i).K;
end
%% normalize graph
deg = sum(graphK,2)+eps;
one_over_D = spdiags(1./deg,0,size(graphK,1),size(graphK,2));
graphK = one_over_D*graphK;

%%%%%%%%%
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function idx = patch_to_linear(patch, sizY)
    % helper function to build linear indices from patch start/stop indices
    slice_idx = patch_to_indices(patch);
    subs_idx = cell(1, numel(slice_idx));
    [subs_idx{:}] = ndgrid(slice_idx{:});
    subs_idx = cellfun(@(x) x(:), subs_idx, 'un', false);
    idx = sub2ind(sizY(1:end-1), subs_idx{:});
end

function idx = patch_to_indices(patch)
    % helper function to build indices vector from patch start/stop indices
    idx = arrayfun(@(x,y) x:y, patch(1:2:end), patch(2:2:end), 'un', false);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%