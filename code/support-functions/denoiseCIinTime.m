function mov = denoiseCIinTime(mov, varargin)

% denoiseTracesWavelet(fuObj, varargin)
% 
% Function to denoise calcium imaging data in time using wavelet
% denoising. To avoid the missing data problem, error frames from burst
% errors are filled in using cubic spline interpolation.
% 
% 2020 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

p = inputParser;                                                           % Set up an object to parse all of the various inputs
p.addParameter('smoothLvl'       , 4         );                            % Select at what wavelet level to smooth at
p.addParameter('DenoisingMethod' , 'BlockJS' );                            % For the situation that 'prctile' is chosen, which percentile should the baseline image be calculated using
p.addParameter('wDenoiseFun'     , 'wdenoise');                            % Select which pixels to select: either an array or 'vary' or 'rand'
p.addParameter('Wavelet'         , 'sym4'    );                            % Select hoe many traces to select

parse(p,varargin{:});
p = p.Results;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Some initializations    

movSize = [size(mov,1), size(mov,2), size(mov,3)];                         % Get size of movie
matSize = [movSize(1)*movSize(2),movSize(3)];                              % Get size of reshaped matrix (pix X frames)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Function to denoise time traces

fprintf('Smoothing...')
if p.smoothLvl == 0                                                        % No smoothing, nothing to do
elseif p.smoothLvl > 0
    switch lower(p.wDenoiseFun)
        case 'wdenoise'                                                    % Choise to use 'wdenoise' for denoising
            fprintf('starting denoising\n')
            mov = wdenoise(...
                    double(reshape(mov,matSize)'),...
                                    p.smoothLvl,'DenoisingMethod',...
                                    p.DenoisingMethod,'Wavelet',p.Wavelet);% Run the wavelet denoising
            fprintf('reshaping\n')
            mov = single(reshape(mov', movSize));                          % Reshape to a movie
        case 'wdenoiseram'                                                 % Choise to use 'wdenoise' for denoising
            fprintf('starting denoising\n')
            mov = reshape(mov,matSize)';
            parfor ll = 1:(movSize(1)*movSize(2))
                mov(:,ll) = wdenoise(double(mov(:,ll)), p.smoothLvl,'DenoisingMethod',...
                                    p.DenoisingMethod,'Wavelet',p.Wavelet);% Run the wavelet denoising
            end
            fprintf('reshaping\n')
            mov = single(reshape(mov', movSize));                          % Reshape to a movie
        case 'cmddenoise'                                                  % Choise to use 'wdenoise' for denoising
            for ll = 1:(movSize(1)*movSize(2))
                [i1,i2] = ind2sub([movSize(1),movSize(2)],ll);             % Pull out one pixel at a time
                mov(i1,i2,:) = cmddenoise(mov(i1,i2,:), ...
                                                    p.Wavelet, smoothLvl); % Denoise that time trace (future work should parallelize this with parfor)
            end
        otherwise
            warning('No valid denoising function chosen! Skipping denoising step.\n')
    end
else
    warning('Bad value for smoothLvl: defaulting to NOT smoothing time traces')
end
fprintf('done.\n')

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
