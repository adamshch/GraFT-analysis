function Data = load_app_data(Data)
%LOADS IMAGE used for GraFT functional application GUI 
%   Takes in structure with .nam and .files, indicating path and file name
%   for images under said directory. Creates a simple uiprogressdlg figure 
%   which reports progress.
%
% Created by Alex Estrada 10/19/2022
%% 



%% Size and Position
fig = uifigure;
fig.Visible = 'off';
fig.WindowStyle = 'modal';
fig.Position = [1800, 500, 400, 150];
movegui(fig, "center")
fig.Visible = 'on';

%% Progress bar
d = uiprogressdlg(fig,'Title','Loading Images',...
    'Message','1','Cancelable','on');
drawnow

%% Data Loading & Updating
tempFsim    = imread([Data.name, '\', Data.files(1).name]);
steps = length(Data.files);
Data.Fsim   = zeros([size(tempFsim), steps]);
for ll = 1:steps
    % Check for Cancel button press
    if d.CancelRequested
        Data.flag = 'Request Cancelled';
        close(fig)
        return
    end
    % Update progress, report current estimate
    d.Value = ll/steps;
    d.Message = sprintf('%d out of %d', ll, steps);

    % Load image
    fname = Data.files(ll).name;
    Data.Fsim(:,:,ll) = imread([Data.name, '\', fname]);
end
d.Message = 'Done loading, finalizing structure type...';
Data.Fsim = im2double(Data.Fsim);
Data.flag = 'Complete';

% Close the dialog box
close(d); close(fig);
end