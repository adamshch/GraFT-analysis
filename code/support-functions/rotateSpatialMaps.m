function SN = rotateSpatialMaps(SN)

% SN = rotateSpatialMaps(SN)
%
% Code to rotate spatial maps to beter align or visualize them.
%
% 2019 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Rotate all the spatial maps

if iscell(SN)
    for ll = 1:numel(SN)
        SN{ll} = rotateSpatialMaps(SN{ll});                                % Iterate over all spatial map instantiations
    end
else
    for i =1:size(SN,3)
        SN(:,:,i) = rot90(SN(:,:,i),2);                                    % Rotate each map
    end
    % mask = rot90(mask,2);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%