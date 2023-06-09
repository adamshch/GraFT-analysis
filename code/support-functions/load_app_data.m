function Data = load_app_data(app)
%LOADS IMAGE used for GraFT functional application GUI 
%   Takes in structure with .nam and .files, indicating path and file name
%   for images under said directory. Creates a simple uiprogressdlg figure 
%   which reports progress.
%
% Created by Alex Estrada 10/19/2022
%% 



%% Inputs
Data = app.Data;

%% Progress bar
d = uiprogressdlg(app.UIFigure,'Title','Loading Images',...
    'Message','1','Cancelable','on');

%% Data Loading & Updating
if strcmp(Data.type, '.tif')
    tempFsim = Data.temp;
    steps = Data.Steps(1);
    Data.Fsim   = zeros([size(tempFsim), steps]);

    for ll = 1:Data.Steps
        % Check for Cancel button press
        if d.CancelRequested
            Data.flag = 'Request Cancelled';
            close(d)
            return
        end
        % Update progress, report current estimate
        d.Value = ll/steps;
        d.Message = sprintf('%d out of %d', ll, steps);
    
        % Load image
        Data.Fsim(:,:,ll) = imread(Data.name, ll);
    end

else
    tempFsim    = imread([Data.name, '\', Data.files(1).name]);
    steps = length(Data.files);
    Data.Fsim   = zeros([size(tempFsim), steps]);

    for ll = 1:steps
        % Check for Cancel button press
        if d.CancelRequested
            Data.flag = 'Request Cancelled';
            close(d)
            return
        end
        % Update progress, report current estimate
        d.Value = ll/steps;
        d.Message = sprintf('%d out of %d', ll, steps);
    
        % Load image
        fname = Data.files(ll).name;
        Data.Fsim(:,:,ll) = imread([Data.name, '\', fname]);
    end
end

d.Message = 'Done loading, finalizing structure type...';
Data.Fsim = im2double(Data.Fsim);
Data.flag = 'Complete';

% Close the dialog box
close(d);
end