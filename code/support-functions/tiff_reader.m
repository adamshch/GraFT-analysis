function Y = tiff_reader(name,T)

% Y = tiff_reader(name,T)
%
% read tiff stack. Optional truncate to first T timesteps 
%
% The inputs to this function are
%     name:      String pointing to the tif file to load
%     T:         Number of frames to extract
% 
% The output to this function is
%     Y:         3D array of the tif frames

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parse inputs and set variables

info = imfinfo(name);                                                      % Get TIFF info

if (nargin == 1)||(isempty(T))
   T = numel(info);
end
    
d1 = info(1).Height;                                                      % Find height and width
d2 = info(1).Width;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read in image

Y = zeros(d1,d2,T);                                                        % Pre-allocate data
for t = 1:T                                     
    Y(:,:,t) = imread(name, t, 'Info',info);                               % Read in TIFF one frame at a time
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
