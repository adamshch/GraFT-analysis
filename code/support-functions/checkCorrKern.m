function [corr_kern, varargout] = checkCorrKern(data_obj, corr_kern, varargin)

% corr_kern = checkCorrKern(data_obj,corr_kern)
% 
% Check the correlational kernel and make sure that everythign is correct.
% 
% 2019 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input Parsing

if nargin > 2;    pVerbose = varargin{1};                                  % If provided set the verbose level
else;             pVerbose = 0;                                            % Otherwise don't set outputs
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check the correlation kernel and create the kernel or embedding

embed_flag = false;                                                        % Unless otherwise noted, set the flag for using the graph embedding to false
if isempty(corr_kern)                                                      % Check if a spatial kernel is NOT provided
    verbPrint(pVerbose, 2, 'Empty kernel, creating kernel with default params.') % Optional verbose output (level 2)
    corr_kern  = mkCorrKern([]);                                           % If an empty array, make the kernel using the default parameters    
elseif isstruct(corr_kern)
    verbPrint(pVerbose, 2, 'Struct provided, creating kernel with provided params.') % Optional verbose output (level 2)
    if ~isfield(corr_kern,'corrType')
        corr_kern.corrType = 'convolution';                                % The default correlation type is a convolutional kernel
    end
    if isequal(corr_kern.corrType,'convolution')
        corr_kern  = mkCorrKern(corr_kern);                                % If it is a struct then parameters were provided: make the kernel using those parameters
    elseif isequal(corr_kern.corrType,'embedding')
        corr_kern  = mkDataEmbedding(data_obj, corr_kern);                 % Create an embedding
        embed_flag = true;                                                 % Set the flag for using the graph embedding to false
    else
        corr_kern  = mkCorrKern(corr_kern);                                % If it is a struct then parameters were provided: make the kernel using those parameters
    end
elseif ischar(corr_kern)&&isequal(corr_kern,'embed-timetrace')
    verbPrint(pVerbose, 2, 'Static timetrace-based embedding selected. Creating default embedding now.') % Optional verbose output (level 2)d
    corr_kern  = mkDataEmbedding(data_obj, []);                            % Create an embedding
    embed_flag = true;                                                     % Set the flag for using the graph embedding to false
elseif isnumeric(corr_kern)                                                % Nothing to do
else
    corr_kern = checkCorrKern(data_obj, [], pVerbose);                     % Otherwise rerun with an empty, default set
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Output Parsing

if nargout > 1
    varargout{1} = embed_flag;                                             % If requested, output the embedding flag
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
