function mov = denoiseCIinSpace(mov, varargin)

% denoiseCIinSpace(fuObj, varargin)
% 
% Function to denoise calcium imaging data in space using wavelet
% denoising. To avoid the missing data problem, error frames from burst
% errors are filled in using cubic spline interpolation.
% 
% 2020 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

p = inputParser;                                                           % Set up an object to parse all of the various inputs
p.addParameter('smoothLvl'       , 4          );                           % Select at what wavelet level to smooth at
p.addParameter('DenoisingMethod' , 'Bayes'    );                           % For the situation that 'prctile' is chosen, which percentile should the baseline image be calculated using
p.addParameter('wDenoiseFun'     , 'wdenoise2');                           % Select which pixels to select: either an array or 'vary' or 'rand'
p.addParameter('Wavelet'         , 'sym4'     );                           % Select hoe many traces to select

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
    switch p.wDenoiseFun 
        case 'wdenoise2'                                                   % Choise to use 'wdenoise' for denoising
            wdMeth = p.DenoisingMethod;
            wdSmth = p.smoothLvl;
            wdWave = p.Wavelet;
            fprintf('starting denoising\n')
            parfor ll = 1:movSize(3)
                mov(:,:,ll) = cast(wdenoise2(double(mov(:,:,ll)),...
                        wdSmth,'DenoisingMethod',wdMeth,...
                                       'Wavelet', wdWave), 'like', mov(:,:,ll));% Run the wavelet denoising
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
