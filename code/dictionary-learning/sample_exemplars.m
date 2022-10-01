function x_im = sample_exemplars(data_obj, opts)

% function x_im = sample_exemplars(data_obj, opts)
%
% Function to sample exemplars. Takes in a data object and a struct of
% algorithmic parameters and returns either a uniform sampling of the data
% or a sampling based on finding a sample set with low correlations between
% the samples. 
%
% 2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

if ~isfield(opts, 'div_samp')
    opts.div_samp = 0; % Default to not having negativity constraints
end

if ~isfield(opts, 'div_thresh')
    opts.div_thresh = 0.85; % Default to not having negativity constraints
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Get Training Data. 
% Some parts can be run in parallel with appropriate slicing.

ix      = ones(opts.in_iter,1);                                            % Initialize the sample indexing to all
k_start = 2;                                                               % Initialize the index start to check for correlated samples
div_thr = opts.div_thresh;                                                 % Initialize the diversity threshold for resampling correlated samples
x_im    = [];                                                              % Initialize the exemplar sample array

if strcmp(opts.data_type, 'vector')

    while sum(ix)~=0
        data_use_ind = ceil(size(data_obj, 2)*rand(1, sum(ix)));           % Select a sampling of the data blindly
        % Possible normalization
        if opts.ssim_flag == 1
            V_norms = (sqrt(sum(data_obj(:, data_use_ind).^2)));           % Calculate the norms for all the vectors
            V_zeros = V_norms == 0;                                        % Locate the zero vectors to avoid NaNs
            V_norms(V_zeros) = 1;
            x_im = cat(2, x_im, data_obj(:, data_use_ind)*diag(1./V_norms)); % Add the normalized chosen samples to the sample array
        else
            x_im = cat(2,x_im,data_obj(:, data_use_ind));                  % Add the chosen samples to the sample array
        end
        if opts.div_samp == 0
            ix = ix*0;                                                     % If no diversity required, just keep everything
        else
            ix      = test_seq(x_im, k_start, div_thr);                    % Test the chosen exemplars for enough diversity 
            x_im    = x_im(:,~ix);                                         % Keep only the sufficiently different vectors
            div_thr = div_thr + 0.05;                                      % Increase threshold so that this does not go on forever
            k_start = size(x_im,2)+1;                                      % Update the counter start to check for correlations
        end
    end
elseif strcmp(opts.data_type, 'square')                                    % Can't slice the main image cube, so extract data serially   
    num_im    = size(data_obj, 3);                                         % Get data cube info: Number of images
    height_im = size(data_obj, 1) - opts.bl_size(1) + 1;                   % Get heights and widths for allowable starting indices for subimages
    width_im  = size(data_obj, 2) - opts.bl_size(2) + 1;                   %  ---------------
    while sum(ix)~=0
        start_ind = ceil(rand(sum(ix), 3).*[height_im, width_im, num_im]); % Pick random starting points
        end_ind   = bsxfun(@plus, start_ind, ...
                               [opts.bl_size(1), opts.bl_size(1), 1]) - 1; % Calculate ending points
        for index_in = 1:sum(ix)
            x_im = cat(2, x_im, reshape(data_obj(start_ind(index_in,1):end_ind(index_in,1),...
                 start_ind(index_in,2):end_ind(index_in,2), start_ind(index_in,3)), [], 1)); % Pick out subimage and reshape it to a vector
        end
        if opts.ssim_flag == 1
            % Can use parfor here since the x_im is appropriately 'sliced'
            parfor index_in = 1:(size(x_im,2)-sum(ix)+1)
                if std(x_im(:,index_in)) > std_min_vec
                    x_im(:,index_in) = x_im(:,index_in) - mean(x_im(:,index_in));
                    x_im(:,index_in) = x_im(:,index_in)/std(x_im(:,index_in));
                end
            end
        end
        if opts.div_samp == 0
            ix = ix*0;                                                     % If no diversity required, just keep everything
        else
            ix      = test_seq(x_im, k_start, div_thr);                    % Test the chosen exemplars for enough diversity 
            x_im    = x_im(:,~ix);                                         % Keep only the sufficiently different vectors
            div_thr = div_thr + 0.05;                                      % Increase threshold so that this does not go on forever
            k_start = size(x_im,2)+1;                                      % Update the counter start to check for correlations
        end
    end
elseif strcmp(opts.data_type, 'cube')
    num_im    = length(data_obj);                                          % Get sizes of the data blocks (color images or video)
    height_im = size(data_obj{1}, 1) - opts.bl_size(1) + 1;                % Get heights and widths for allowable starting indices for subimages
    width_im  = size(data_obj{1}, 2) - opts.bl_size(2) + 1;                % -------------------
    depth_im  = size(data_obj{1}, 3) - opts.bl_size(3) + 1;                % -------------------
    
    start_ind = ceil(rand(sum(ix), 4).*[height_im, width_im, depth_im, num_im]); % Pick random starting points
    for index_in = 1:opts.in_iter
        x_im = cat(2,x_im,reshape(data_obj{start_ind(4)}(...
            start_ind(1):start_ind(1)+opts.bl_size(1)-1,...
            start_ind(2):start_ind(2)+opts.bl_size(2)-1, ...
            start_ind(3):start_ind(3)+opts.bl_size(3)-1), [], 1));         % Pick out subimage and reshape it to a vector
    end
else
    error('Unknown Data Type!! Choose ''vector'', ''square'' or ''cube''...')
end



end

function ix = test_seq(X, k_start, thresh)
    if isempty(k_start)          % Check if a starting point to check is given
        k_start = 2;
    end
    ix = zeros(size(X,2),1);
    if norm(X(:,1)) == 0
        ix(1) = 1;                % If the first vector is zeros, add it to the remove list
    end
    x_norms = sqrt(sum(X.^2,1));
    for kk = k_start:size(X,2)
        if norm(X(:,kk)) == 0
            ix(kk) = 1;
        else
            ips = X(:,1:(kk-1)).'*X(:,kk)./(x_norms(1:(kk-1))*x_norms(kk));
            ips(x_norms(1:(kk-1))==0) = 0;
            if max(ips) > thresh
                ix(kk) = 1;    % If spectral angle is too high, add the vector to the remove list
            else
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
