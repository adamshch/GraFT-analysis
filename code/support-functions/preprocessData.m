function X = preprocessData(X, varargin)

% X = preprocessData(X, varargin)
%
% Function to pre-process calcium imaging data. Current order of
% operations:
%    - Filtering
%    - Averaging (temporal)
%    - Centering
%    - Normalization
%
% 2019 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input/option parsing

p = inputParser;                                                           % Initialize the input parser
p.addParameter('center',          true     );                              % true/false
p.addParameter('normalize',       true     );                              % true/false
p.addParameter('filtering',       false    );                              % true/false
p.addParameter('averaging',       false    );                              % true/false
p.addParameter('pixel_center',    false    );                              % true/false
p.addParameter('norm_baseline',   'median' );                              % 'median', 'mean', or 'max'
p.addParameter('center_baseline', 'min'    );                              % 'median', 'mean', or 'min'
p.addParameter('pixel_norm',      false    );                              % true/false
p.addParameter('filter_type',     'median' );                              % 'median'
p.addParameter('average_type',    'mean'   );                              % 'mean'
p.addParameter('avg_win',         3        );                              % 'mean'
p.addParameter('filter_size',     [3,3,1]  );                              % 2- or 3- vector

parse(p,varargin{:});                                                      % Parse the inputs. results get saved to p.Results
pars = p.Results;                                                          % Change p.Results to pars for easier reference in the code
clear p                                                                    % Don't need p anymore

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Filtering

if pars.filtering                                                          % Check if filtering is required
    fprintf('Performing fitering...')
    switch pars.filter_type
        case 'median'
            X = medfilt3(X, pars.filter_size);                             % Median filtering over patches of size "pars.filter_size"
        otherwise                                                          % No filtering
            warning('Improper filtering paramters; skipping filtering...')
    end
    fprintf('done.\n')
else
    fprintf('Skipping fitering.\n')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Temporal averaging

if pars.averaging                                                          % Check if filtering is required
    fprintf('Performing averaging...')
    switch pars.average_type
        case 'mean'
            X = movmean(X, pars.avg_win, 3);                               % Median filtering over patches of size "pars.filter_size"
        otherwise                                                          % No filtering
            warning('Improper filtering paramters; skipping filtering...')
    end
    fprintf('done.\n')
else
    fprintf('Skipping averaging.\n')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Centering

if pars.center                                                             % Check if centering is required
    fprintf('Centering data...')
    if pars.pixel_center                                                   % Check if centering should be pixelwise or global
        switch pars.center_baseline                                        % Check what the data should be centered to
            case 'median'
                Fcent = median(X,3);
            case 'mean'
                Fcent = mean(X,3);
            case 'min'
                Fcent = min(X,[],3);
            otherwise
                Fcent = 1;
        end
        X = bsxfun(@plus, X, -Fcent);                                      % Center the data on a per-pixel basis
    else
        switch pars.center_baseline
            case 'median'
                Fcent = median(X(:));
            case 'mean'
                Fcent = mean(X(:));
            case 'min'
                Fcent = min(X(:));
            otherwise
                Fcent = 1;
        end
        X = X - Fcent;                                                     % Center the data on a global basis
    end
    fprintf('done.\n')
else
    fprintf('Skipping centering.\n')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Normalization

if pars.normalize                                                          % Check if normalization is required
    fprintf('Normalizing data...')
    if pars.pixel_norm                                                     % Check if normalization should be pixelwise or global
        switch pars.norm_baseline                                          % Check what the data should be normalized to
            case 'median'
                Fnorm = median(X,3);
            case 'mean'
                Fnorm = mean(X,3);
            case 'max'
                Fnorm = max(X,[],3);
            otherwise
                Fnorm = 1;
        end
        Fnorm(Fnorm==0) = 1;
        X = bsxfun(@times,X,1./Fnorm);                                     % Normalize the data on a per-pixel basis
    else
        switch pars.norm_baseline
            case 'median'
                Fnorm = median(X(:));
            case 'mean'
                Fnorm = mean(X(:));
            case 'max'
                Fnorm = max(X(:));
            otherwise
                Fnorm = 1;
        end
        Fnorm(Fnorm==0) = 1;
        X = X./Fnorm;                                                       % Normalize the data on a global basis
    end
    fprintf('done.\n')
else
    fprintf('Skipping normalization.\n')
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Remove NaNs

fprintf('%d NaNs found. Setting to zero...', sum(isnan(X(:))))
X(isnan(X)) = 0;                                                           % Set all NaNs to zero
fprintf('done.\n')

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%