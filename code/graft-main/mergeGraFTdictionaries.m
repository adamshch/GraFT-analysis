function [D,S] = mergeGraFTdictionaries(D,S,options,normalizeSpatial)

% function [D,S] = mergeGraFTdictionaries(D,S,options,normalizeSpatial)
%
%
%
% 2020 - Gal Mishne & Adam Charles
% 2022 - Alex Estrada - getSpatialWeights Update

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialization and input parsing

D = D';                                                                    % Transpose the time-courses for easier processing
if nargin < 3; options = []; end                                           % Make sure there is an options variable
[thr, mx]  = parseMergeParameters(options);                                % parse out the merging parameters (max & threshold)
[d, T, nr] = getProblemDims(S, D);                                         % Get dimensions of the problem
if nr == 0                                                                 % If there are no components, nothing to merge and so return an empty matrix
    merged_ROIs = [];                                                      % No components, so nothing to merge: return an empty array
    return                                                                 % Nothing else to do here
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 

if nargin < 5
    tic
    [S_corr, FF2]     = getSpatialOverlapGraph(S, nr);                     % Find graph of overlapping spatial components (positive inner products)
    fprintf('Computed spatial overlaps in %f s.\n',toc);tic
    D_corr            = getTemporalCorrelations(D, S_corr, nr);            % Calculate the temporal correlations betwwen overlapping spatial componnets
    fprintf('Computed temporal overlaps in %f s.\n',toc);tic
    MC                = getMergeIndices(D_corr, FF2, thr);                 % Find if any componentes are strongly connected and to who
    fprintf('Computed merged indices in %f s.\n',toc);tic
    cor               = sumMergeComponentCorrelations(MC, D_corr);         % Add up all the correlations for the graph of indices to potentially merge
    fprintf('Computed merged component correlations in %f s.\n',toc);tic
    [nm, merged_ROIs] = organizeIndicesToMerge(cor, MC, mx);               % Create an array where each element is a set of components to merge into a single component
    fprintf('Computed indices to merge in %f s.\n',toc)
else                                                                       % If merged_ROIs is provided, use those (allows for custom merging criteria)
    nm = length(merged_ROIs);                                              %  - In this case only the number of merges is needed
end

S_merged = zeros(d,nm);                                                    % Initialize the merged spatial profiles
D_merged = zeros(nm,T);                                                    % Initialize the merged temporal profiles

for i = 1:nm
    tic
    MASK = createMergingMask(S, merged_ROIs, i);                           % Create a mask over the spatial area of the profiles to merge
    nC   = calculatePatchNormalizations(D, merged_ROIs, i);                % 

    %%%% CHANGE FROM HERE DOWN %%%%
    [S_merged(:,i), D_merged(i,:)] = calculateMergedROIs(D, S, MASK, ...
                                    nC, merged_ROIs, i, normalizeSpatial); % Merge all ther ROIs
    fprintf('Merged component %d in %f s.\n',i,toc)
end

tic
[S, D, nr] = replaceMergedComponents(S, D, merged_ROIs, nr, nm, ...
                                                      S_merged, D_merged); % Replace the merged components with the new combination

fprintf('Replaced merged componentsin %f s.\n',toc)
D = D';                                                                    % Transpose the time-courses for back to how they were
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Extra functions 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 

function [thr, mx] = parseMergeParameters(options)

if ~isfield(options, 'merge_thr') || isempty(options.merge_thr)            % merging threshold 
    thr = 0.75; 
else
    thr = options.merge_thr;
end     
if ~isfield(options,'max_merg')                                            % maximum merging operations
    mx = Inf; 
else 
    mx = options.max_merg; 
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function [d, T, nr] = getProblemDims(S, D)

d  = size(S,1);                                                            % Get number of pixels
T  = size(D,2);                                                            % Get number of time steps
nr = size(S,2);                                                            % Get the total number of components

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function C_corr = getTemporalCorrelations(C, A_corr, nr)

%C_corr = corr(full(C(1:nr,:)'));

C_corr = zeros(nr);
for i = 1:nr                                                               % Loop over correlations since many time-traces don't overlap, so there's no reason to compute those correlations at all
    overlap_idx = find(A_corr(i,:));                                       % Get the set of pixels that overlap
    if ~isempty(overlap_idx)                                               % If there are actually overlapping indices...
        corr_values = corr(C(i,:)',C(overlap_idx,:)');                     % ...Calculate the correlation between then 
        C_corr(i,overlap_idx) = corr_values;                               % ...Save the correlation value in the matrix
        C_corr(overlap_idx,i) = corr_values;                               % ...And make sure everything is symmetric
    end
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function [A_corr, FF2] = getSpatialOverlapGraph(A, nr)

A_corr              = triu(A'*A);                                          % Calculate all inner products between spatial components
A_corr(1:nr+1:nr^2) = 0;                                                   % Set diagonal to zero
FF2                 = A_corr > 0;                                          % Find graph of overlapping spatial components (positive inner products)
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function MC = getMergeIndices(C_corr, FF2, thr)
FF1    = triu(C_corr)>= thr;                                               % find graph of strongly correlated temporal components
FF3    = and(FF1,FF2);                                                     % intersect the two graphs
[l, c] = graph_connected_comp(sparse(FF3+FF3'));                           % extract connected components
MC     = [];                                                               % Start with no components to merge

for i = 1:c                                                                % Loop through all connections
    if length(find(l==i))>1                                                % Find if any componentes are strongly connected and to who
%             MC = [MC,(l==i)'];
        MC = cat(2,MC,(l==i)');                                            % If there are strong connections, add that merge to the list of components to merge
    end
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function cor = sumMergeComponentCorrelations(MC, C_corr)

cor = zeros(size(MC,2),1);
for i = 1:length(cor)
    fm = find(MC(:,i));
    for j1 = 1:length(fm)
        for j2 = j1+1:length(fm)
            cor(i) = cor(i) + C_corr(fm(j1),fm(j2));
        end
    end
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function [nm, merged_ROIs] = organizeIndicesToMerge(cor, MC, mx)

[~,ind]     = sort(cor,'descend');
nm          = min(length(ind),mx);                                         % number of merging operations
merged_ROIs = cell(nm,1);

for i = 1:nm
    merged_ROIs{i} = find(MC(:,ind(i)));
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function MASK = createMergingMask(A, merged_ROIs, i)

MASK             = sum(A(:,merged_ROIs{i})>0,2);
MASK(MASK(:)==0) = 1;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function nC = calculatePatchNormalizations(C, merged_ROIs, i)

nC = sqrt(sum(C(merged_ROIs{i},:).^2,2));  % Should this be the product of norm C & norm A?
nC = nC / max(nC);

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function D = mergeDictWeightedAvg(D, S, MASK, nC, merged_ROIs, i, normalizeSpatial)

% This function computes a weighted average of 
%

S_subset = S(:,merged_ROIs{i});                                            % Extract subset of spatial profiles to merge
D_subset = D(merged_ROIs{i},:);                                            % Extract subset of temporal dictionary elements to merge
w = sum(S_subset,1);                                                       % Compute weights based on relative strength of dictionary in the patch
w = w./sum(w);                                                             % Normalize the weights to sum to one

D = (w(:).')*D_subset;                                                     % Return the weighted average
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
function [aa, cc] = calculateMergedROIs(C, A, MASK, nC, merged_ROIs, i, normalizeSpatial)

% Trying to find aa & cc such that aa*cc ~ A_subset*C_subset via
%    argmin_{aa,cc} ||aa*cc - A_subset*C_subset||_F^2
% Alternating approach: pseudoinverse over aa, cc
% 

A_subset = A(:,merged_ROIs{i});
C_subset = C(merged_ROIs{i},:);

aRatio  = getSpatialWeights(A_subset, C_subset);                           
[aa,nA] = mergeSingleSpatial(A_subset,aRatio,MASK);
cc      = mergeSingleTempotal(C_subset,nA);


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function [A, C, nr] = replaceMergedComponents(A, C, merged_ROIs, nr, nm, A_merged, C_merged)

neur_id = unique(cell2mat(merged_ROIs));

A = [A(:,1:nr),A_merged,A(:,nr+1:end)];
C = [C(1:nr,:);C_merged;C(nr+1:end,:)];
A(:,neur_id) = [];
C(neur_id,:) = [];
nr = nr - length(neur_id) + nm;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function aRatio = getCrossDictWeights(D,S)

if ndims(S)==3
    S = reshape(S,[],size(S,3));
end
if (size(D,1)==size(S,2))&&(size(D,2)~=size(S,2))
    D = D';
end
% ols = getOverlaps(S)

aRatio = diag(ones(1,size(S,2)));
combs  = combnk(1:size(S,2),2);
numOL  = diag(sum(S>0,1));
for ll = 1:size(combs,1)
    TMP = sum((S(:,combs(ll,1))>0)&(S(:,combs(ll,2))>0));
    numOL(combs(ll,1),combs(ll,2)) = TMP;
    numOL(combs(ll,2),combs(ll,1)) = TMP;
    if TMP ==0
        aRatio(combs(ll,1),combs(ll,2)) = NaN;
        aRatio(combs(ll,2),combs(ll,1)) = NaN;
    else
        idx   = (S(:,combs(ll,1))>0)&(S(:,combs(ll,2))>0);
        TMPv1 = D(:,combs(ll,1))*(S(idx,combs(ll,1))');
        TMPv2 = D(:,combs(ll,2))*(S(idx,combs(ll,2))');
        goodI = (TMPv1>0.1*max(TMPv1(:)))&(TMPv2>0.1*max(TMPv2(:)));
        TMPv1 = TMPv1(goodI);
        TMPv2 = TMPv2(goodI);
        aRatio(combs(ll,1),combs(ll,2)) = median(TMPv1./TMPv2);
        aRatio(combs(ll,2),combs(ll,1)) = median(TMPv2./TMPv1);
    end
end

aRatio = pickBestRatios(aRatio,numOL);

end

%%

function aRatio = getSpatialWeights(S, D)

if ndims(S)==3
    S = reshape(S,[],size(S,3));
end

aRatio = diag(ones(1,size(S,2)));                                          % Initialize the ratio matrix to be the identity
combs  = combnk(1:size(S,2),2);                                            % Get all combinations of spatial profiles
numOL  = diag(sum(S>0,1));
for ll = 1:size(combs,1)
    TMP = sum((S(:,combs(ll,1))>0)&(S(:,combs(ll,2))>0));                  % Get the number of pixels overlapping between 
    numOL(combs(ll,1),combs(ll,2)) = TMP;                                  % Store the number of overlaps
    numOL(combs(ll,2),combs(ll,1)) = TMP;                                  % Overlap count is symmetric
    if TMP ==0                                                             % If NO OVERLAP...
        aRatio(combs(ll,1),combs(ll,2)) = NaN;                             % ... save NaNs as the ratio (0/0)
        aRatio(combs(ll,2),combs(ll,1)) = NaN;                             % ... 1/(0/0) is also a NaN
    else                                                                   % If there IS OVERLAP...
        aRatio(combs(ll,2),combs(ll,1)) = nanmedian(...                   
            (D(combs(ll,1),:) - median(D(combs(ll,1),:)))./ ...
            (D(combs(ll,2),:) - median(D(combs(ll,2),:))));                % ... aRatio is the median ratio between significant pixels
        aRatio(combs(ll,1),combs(ll,2)) = nanmedian(...
            (D(combs(ll,2),:) - median(D(combs(ll,2),:)))./ ...
            (D(combs(ll,1),:) - median(D(combs(ll,1),:))));  
    end
end

aRatio = pickBestRatios(aRatio,numOL);                                     % Pick the best ratios

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function ratioOut = pickBestRatios(aRatio,numOL)

ratioOut = zeros(size(numOL,1),1);                                         % Initialize outputs to a zeros vector
numOL(1:(size(numOL,1)+1):end) = 0;                                        % Remove the diagonal for convenience
numOL(isnan(numOL)) = 0;                                                   % Just in case NaNs exist... those should be zero

meanOLs   = nanmean(numOL,1);                                              % Find out all the average overlaps
baseIdx   = find(meanOLs==max(meanOLs(:)),1);                              % The base index has the most overlap pixels with other profiles
ratioOut(baseIdx) = 1;                                                     % The base index is not scaled

idxPassed = baseIdx;                                                       % Initialize the passed nodes with the base index

while numel(idxPassed) < size(numOL,1)                                     % Conutnue until no nodes are left to cycle through
    neighborIdx = setdiff(find(sum(numOL(idxPassed,:),1) > 0),idxPassed);  % Find all the profiles that overlap with 
    numOL(neighborIdx,neighborIdx) = 0;                                    % Zero out connections between neighbors
    for ll = 1:numel(neighborIdx)
        allConnect  = numOL(neighborIdx(ll),:);                            % Get the connectivity of each node in sequence
        backConnect = allConnect(idxPassed);                               % Pull out the connections up the tree only
        maxBackConn = find(backConnect==max(backConnect),1);               % Find the max connection up the tree
        idxMaxBC    = idxPassed(maxBackConn);                              % Pull out the relevent index
        numOL(neighborIdx(ll),setdiff(idxPassed, idxMaxBC)) = 0;           % Remove the other back projections
        numOL(setdiff(idxPassed, idxMaxBC),neighborIdx(ll)) = 0;           % Remove the other back projections (keeping things symmetric
        ratioOut(neighborIdx(ll)) = ratioOut(idxMaxBC)*aRatio(idxMaxBC,...
                                                         neighborIdx(ll)); % Store the correct ratio value
    end
    idxPassed = union(idxPassed,neighborIdx);                              % Add the neightborhood into the set of passed neurons 
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function [aa,nA] = mergeSingleSpatial(A_subset,aRatio,MASK)

MASK(MASK~=0) = 1./MASK(MASK~=0);                                          % Set mask to be averaging weights
aa            = MASK.*(sum(A_subset*diag(aRatio),2));                      % Average using the MASK weights
nA            = vec(sum(A_subset>0,1)./sum(sum(A_subset>0)));              % AXE THIS???

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function cc = mergeSingleTempotal(C_subset,aRatio)

medVals = median(C_subset,2);
minMed  = min(medVals);
% cc      = vec(sum(diag(nA)*bsxfun(@minus,C_subset,medVals)));
% cc      = cc+ minMed;
cc      = vec(mean(diag(1./aRatio)*bsxfun(@minus,C_subset,medVals)));
cc      = cc+ minMed;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

