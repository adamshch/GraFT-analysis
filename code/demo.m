%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%% Demo file for using GraFT %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This demo focuses on running GraFT on standard 2P data, using NeuroFinder 
% data as a simulated data
%
% This file shows how to call GraFT on calcium imaging data. GraFT is a
% data-driven method for learning the fluorescence activity traces
% underlying a given calcium imaging video. GraFT embeds the pixel-wise
% time traces in a similarity-based graph which better reflects the
% underlying structure of the data. This graph makes using correlations
% between time-trces easier when isolating canonical time-traces in a
% filtered dictionary learning setting. 
% 
% Code by Adam Charles and Gal Mishne
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This first block sets up the basic parameters 

saveDir  = '.';                                                            % Set the path where the output should be saved to
usePatch = true;                                                           % Select if patchGraFT or regular GraFT should be used. For bigger field-of-views (>150 pix X 150 pix), patchGraFT is recommended

params.lambda    = 0.7;                                                   % Sparsity parameter
params.lamForb   = 0.2;                                                    % parameter to control how much to weigh extra time-traces
params.lamCorr   = 0.1;                                                    % Parameter to prevent overly correlated dictionary elements 
params.n_dict    = 15;                                                     % Choose how many components (per patch) will be initialized. Note: the final number of coefficients may be less than this due to lack of data variance and merging of components.
params.patchSize = 50;                                                     % Choose the size of the patches to break up the image into (squares with patchSize pixels on each side)

Xsel = 151:350;                                                            % Can sub-select a portion of the full FOV to test on a small section before running on the full dataset
Ysel = 101:300;                                                            % ...
params.motion_correct = false;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set up paths & misc startups

addpath(genpath('.'))                                                      % Add all the files in the repo
ncores       = feature('numcores');                                        % Sets number of cores
core_percent = 1;                                                          % Sets the percent of cores to use
if isempty(gcp('nocreate')); 
    parpool(ceil(core_percent*ncores),'IdleTimeout',5000);                 % If no parpool, make one
end          
warning(sprintf('Using %d cores for parpool. Change var core_percent above if necessary',ceil(core_percent*ncores)));
RandStream.setGlobalStream(RandStream('mt19937ar'));                       % Set the random stream


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Download and load NeuroFinder data

fprintf('Loading Neurofinder data...\n')
data.nam = 'neurofinder.02.00';                                            % Create the name of the data to check for
if ~exist(data.nam,'file')                                                 % download file if it doesn't exist in the directory
    fprintf('Neurofinder data not detected, downloading data now...\n')
    url         = 'https://s3.amazonaws.com/neuro.datasets/challenges/neurofinder/neurofinder.02.00.zip';
    filename    = 'neurofinder.02.00.zip';
    outfilename = websave(filename,url);
    unzip(filename);
    clear url filename                                                     % Clear un-needed variables
end
 
data.dirname = fullfile(data.nam, 'images');                               % Get the directory name
data.files   = dir(fullfile(data.dirname,'*.tiff'));                       % Get all of  the filenames (look for tiff files)
data.fname   = fullfile(data.dirname, data.files(1).name);                 % Create a full-file name to point to the first file (used to get movie sizes)
data.Fsim    = imread(data.fname);                                         % Read in the first file
data.Fsim    = zeros(size(data.Fsim,1),size(data.Fsim,2),...
                                                    length(data.files));   % Initialize the data array
 
for ll = 1:length(data.files)
    fname = fullfile(data.dirname, data.files(ll).name);
    data.Fsim(:,:,ll) = imread(fname);
end
 
data.Fsim = im2double(data.Fsim);
clear ll fname                                                             % Clear intermediary variables
fprintf('...done\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Motion correction: may be required if not already run

if params.motion_correct  % use normcorre
    try
        %%
        options_rigid = NoRMCorreSetParms('d1',size(data.Fsim,1),'d2',size(data.Fsim,2), ...
            'bin_width',50,'max_shift',10,'us_fac',2,'iter',5,'init_batch',200);
        [data.Fsim,shifts,template,options,col_shift] = normcorre(data.Fsim,options_rigid);
        %%
    catch me
        error('motion correction: normcorre not found. Download from https://github.com/flatironinstitute/NoRMCorre and add to path')

    end
end
data.Fsim = data.Fsim/median(data.Fsim(:));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Optional: crop part of FOV

if isempty(Xsel); Xsel = 1:size(data.Fsim,1); end
if isempty(Ysel); Ysel = 1:size(data.Fsim,2); end

data.Fsim = data.Fsim(Xsel, Ysel, :);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Denoise the data using simple time-trace wavelet denoising

fprintf('Denoising data...')
data.Fsim = denoiseCIinTime(data.Fsim);
fprintf('done\n.')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set algorithm parameters
% A full set of parameters and defaults is specified in the bottom of the
% GraFT main function (subfunction checkAllParameters()). These are some 
% example parameters, however we find that 

fprintf('Setting up parameters...')
params.lamCont       = 0.1;                                                % parameter to control how much to weigh the previous estimate (continuity term)
params.grad_type     = 'full_ls_cor';                                      % type of dictionary update
params.lamContStp    = 0.9;                                                % Decay rate of the continuation parameter
params.plot          = true;                                              % Set whether to plot intermediary variables
params.create_memmap = false;                                              % 
params.verbose       = 10;                                                  % Level of verbose output 
params.normalizeSpatial = true;
params.nonneg           = true;

corr_kern.w_time     = 0;                                                  % Initialize the correlation kernel struct
corr_kern.reduce_dim = true;
corr_kern.corrType   = 'embedding';                                        % Set the correlation type to "graph embedding"
fprintf('done.\n')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Actually run GraFT
% This is how to run the main function. The commented line is how to call
% GraFT if you don't want to run the above lines independently

% corr_kern = checkCorrKern(data_obj, corr_kern, params.verbose);  

fprintf('Running with parameters lambda = %f, lamforb = %f, lamcont = %f, lamCorr = %f.\n', ...
           params.lambda, params.lamForb, params.lamCont, params.lamCorr);
if usePatch
    [S, D] = patchGraFT(data.Fsim,params.n_dict,[],corr_kern,params);      % Learn the dictionary using patch-based code 
else
    [D, S] = GraFT(data.Fsim, [], corr_kern, params);                      % Learn the dictionary (no patching - will be much more memory intensive and slower)
end

fprintf('Finished running GraFT.\n')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Save the results

if params.normalizeSpatial
    normType = 'spatial';
else
    normType = 'temporal';
end
saveName = sprintf('nfRun_%d_%d_%d_%d_%s.mat', ...
                round(100*params.lambda), round(100*params.lamForb),...
                round(100*params.lamCorr), round(100*params.lamCont),...
                                                                normType); % Set the save name to store results in
fprintf('Saving results to %s...\n', saveName)
save(fullfile(saveDir,saveName),'S','D','params','-v7.3')                  % Save the results

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot the results

Sthresh = S;
for ll = 1:size(Sthresh,3)
    Sthresh(:,:,ll) = Sthresh(:,:,ll).*(Sthresh(:,:,ll) > 0.05*max(max(Sthresh(:,:,ll),[],1), [], 2));
end
MovieSlider(Sthresh);

clear ll 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

for kk = 1:min(25,size(S,3))
    subplot(5,5,kk), imagesc(S)
    axis image; axis off; colormap gray;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
