function corr_kern = mkDataEmbedding(data_obj, configParams)

% corr_kern = mkDataEmbedding(configParams)
% 
% Make an embedding matrix (rename eventually to "mkDataGraph"
% 
% 2019 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

if nargin < 2 || isempty(configParams)                                     % Make sure that configParams is a struct
    clear configParams
    configParams = struct;
end

dParams.self_tune  = 7;                                                    % self-tuning adaptive scale (Zelnik-Manor & Perona)
dParams.dist_type  = 'euclidean';                                          % distance type for kNN calculation ('euclidean' will use RANN)
dParams.kNN        = 49;                                                   % kNN
dParams.reduce_dim =  false;                                               % apply PCA dim reduction to make knn search faster
configParams       = setParams(dParams, configParams);                     % Set the parameters


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create the embedding

% reduce the time dimension with pca to make knn search faster
if configParams.reduce_dim
    if size(data_obj,3)>1                                                  % If the data is in a 3D array (instead of 2D)...
        data_obj = reshape(data_obj,[],size(data_obj,3));                  % ... Then reshape the array to do PCA
    end
    [U,S,~]  = pcafast(data_obj,15);                                       % Run a fast version of OCA
    data_obj = U;                                                          % Save the principle components as the data to embed
end

if size(data_obj,3) > 1
    [K, ~] = calcAffinityMat(double(reshape(data_obj, [], ...
                                      size(data_obj,3)))', configParams);  % Calculate the affinity matrix (reshaped from a 3D array)
else
    [K, ~] = calcAffinityMat(double(data_obj'), configParams);             % Calculate the affinity matrix (if matrix is given directly)
end
K(1:(size(K,1)+1):end) = 0;                                                % Set the diagonal elements to zero
corr_kern = bsxfun(@rdivide,K,(sum(K,2)+eps));                             % Normalize the rows to make the graph matrix

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
