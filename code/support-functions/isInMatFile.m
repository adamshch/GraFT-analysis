function checkVars = isInMatFile(fileName, varName)

% isInMatFile(fileName, varName)
%
% Chech if a variable called "varName", or list of variables as a cell 
% array of variable names in 'varName' exist  in the file "fileName"
%
% 2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input checking

if ~ischar(fileName); error('The file name must be a string!'); end        % Make sure the filename is a string

if ~isequal(fileName(end-3:end),'.mat')
    error('The file name must p[oint to a mat file!')                      % Make sure the filename is a .mat file
end

if ischar(varName);        vN{1} = varName;                                % Check if varName is a string. If so make a 1x1 cell array with that name in it
elseif iscell(varName);    vN    = varName;                                % Otherwise if varName is a cell array, just pass it through
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check if the variable name exists

variableInfo = who('-file', fileName);                                     % Get the variable list of the variables in the file 'filename'
checkVars    = zeros(numel(vN),1);                                         % Initialize 
for kk = 1:numel(checkVars)
    checkVars(kk) = ismember(vN{kk}, variableInfo);                        % Check if the kk^th variable is present in the list of variables ('variableInfo')
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
