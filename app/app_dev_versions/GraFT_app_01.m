classdef GraFT_app_01_dev < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        Label2_3                        matlab.ui.control.Label
        Label2_4                        matlab.ui.control.Label
        GraFTanalysisLabel_2            matlab.ui.control.Label
        TabGroup                        matlab.ui.container.TabGroup
        OpenDatasetTab                  matlab.ui.container.Tab
        Panel                           matlab.ui.container.Panel
        ToCropRightClickCropImageLabel  matlab.ui.control.Label
        Label3                          matlab.ui.control.Label
        Panel_2                         matlab.ui.container.Panel
        Button                          matlab.ui.control.Button
        Button_2                        matlab.ui.control.Button
        Label_2                         matlab.ui.control.Label
        Slider                          matlab.ui.control.Slider
        UIAxes                          matlab.ui.control.UIAxes
        ButtonGroup_2                   matlab.ui.container.ButtonGroup
        ProjectionButton                matlab.ui.control.ToggleButton
        CropButton_2                    matlab.ui.control.ToggleButton
        HistogramButton                 matlab.ui.control.ToggleButton
        ViewButton                      matlab.ui.control.ToggleButton
        ThresholdLabel                  matlab.ui.control.Label
        ViewModeLabel                   matlab.ui.control.Label
        BackButton                      matlab.ui.control.Button
        ViewDropDown                    matlab.ui.control.DropDown
        SetUpPanel                      matlab.ui.container.Panel
        NewLoadButton                   matlab.ui.control.StateButton
        BrowseforFileButton             matlab.ui.control.Button
        LoadDataButton                  matlab.ui.control.Button
        PathingSettingsLabel            matlab.ui.control.Label
        BrowseforFolderButton           matlab.ui.control.Button
        DATAFILESLabel                  matlab.ui.control.Label
        currentpathLabel                matlab.ui.control.Label
        DataLoadingPanel                matlab.ui.container.Panel
        MultiSelectCtrlClickLabel       matlab.ui.control.Label
        RangeShiftClickLabel            matlab.ui.control.Label
        LoadSelectionButton             matlab.ui.control.Button
        SelectAllButton                 matlab.ui.control.Button
        ImagesListBox                   matlab.ui.control.ListBox
        OptionsPanel                    matlab.ui.container.Panel
        NoCropSelectedLabel             matlab.ui.control.Label
        ButtonGroup                     matlab.ui.container.ButtonGroup
        NoneButton                      matlab.ui.control.RadioButton
        NormcorreButton                 matlab.ui.control.RadioButton
        AverageButton                   matlab.ui.control.RadioButton
        DropDown                        matlab.ui.control.DropDown
        DataDenoisingLabel              matlab.ui.control.Label
        ChooseButton                    matlab.ui.control.Button
        CroppingLabel                   matlab.ui.control.Label
        MotionCorrectionLabel           matlab.ui.control.Label
        DenoiseButton                   matlab.ui.control.Button
        SingleFileSelectionPanel        matlab.ui.container.Panel
        nwbSelectdatalocationPanel      matlab.ui.container.Panel
        LoadedNWBStructureLabel         matlab.ui.control.Label
        SelectButton_2                  matlab.ui.control.StateButton
        NoteOnlyrawdatainacquisionisacceptedLabel  matlab.ui.control.Label
        TextArea                        matlab.ui.control.TextArea
        ListBox                         matlab.ui.control.ListBox
        matSelectdesiredfielddetectedPanel  matlab.ui.container.Panel
        InfoTextArea                    matlab.ui.control.TextArea
        SelectButton                    matlab.ui.control.Button
        SelectdesiredfielddetectedListBox  matlab.ui.control.ListBox
        AppStatusPanel                  matlab.ui.container.Panel
        StatusLamp_2                    matlab.ui.control.Lamp
        textLabel                       matlab.ui.control.Label
        GraFTTab                        matlab.ui.container.Tab
        Panel_4                         matlab.ui.container.Panel
        SavePanel                       matlab.ui.container.Panel
        SeeResultsButton                matlab.ui.control.Button
        Panel_5                         matlab.ui.container.Panel
        Label_6                         matlab.ui.control.Label
        FormatDropDown                  matlab.ui.control.DropDown
        FormatDropDownLabel             matlab.ui.control.Label
        Label2_7                        matlab.ui.control.Label
        SaveNameLabel                   matlab.ui.control.Label
        Label_7                         matlab.ui.control.Label
        CurrentDirectoryLabel           matlab.ui.control.Label
        DataPropertiesLabel             matlab.ui.control.Label
        KeeporiginaldataFsimCheckBox    matlab.ui.control.CheckBox
        ChangeButton                    matlab.ui.control.Button
        SaveButton                      matlab.ui.control.Button
        AppStatusPanel_2                matlab.ui.container.Panel
        OutputhereLabel                 matlab.ui.control.Label
        BackButton_2                    matlab.ui.control.Button
        AdvancedOptionsPanel            matlab.ui.container.Panel
        NormalizeTemporalCheckBox       matlab.ui.control.CheckBox
        W_timeEditFieldLabel            matlab.ui.control.Label
        ContinuityTermEditField         matlab.ui.control.NumericEditField
        GradientTypeDropDown            matlab.ui.control.DropDown
        ContDecayEditField              matlab.ui.control.NumericEditField
        VerboseSpinner                  matlab.ui.control.Spinner
        NormalizeSpatialCheckBox        matlab.ui.control.CheckBox
        CreateMemmapCheckBox            matlab.ui.control.CheckBox
        ReduceDimCheckBox               matlab.ui.control.CheckBox
        LikelyFormDropDown              matlab.ui.control.DropDown
        LikelyFormDropDownLabel         matlab.ui.control.Label
        W_timeEditField                 matlab.ui.control.NumericEditField
        CorrelationTypeDropDown         matlab.ui.control.DropDown
        TypeofdictionaryupdateLabel     matlab.ui.control.Label
        ControlhowmuchtoweighthepreviousestimateLabel  matlab.ui.control.Label
        CorrelationTypeDropDownLabel    matlab.ui.control.Label
        VerboseSpinnerLabel             matlab.ui.control.Label
        ContDecayEditFieldLabel         matlab.ui.control.Label
        GradientTypeDropDownLabel       matlab.ui.control.Label
        SpatialSmoothingKernelLabel     matlab.ui.control.Label
        InitializecorrelationkernelstructureLabel  matlab.ui.control.Label
        DecayrateofthecontinuationparameterLabel  matlab.ui.control.Label
        LevelofverboseoutputLabel       matlab.ui.control.Label
        ContinuityTermEditFieldLabel    matlab.ui.control.Label
        MainParametersPanel             matlab.ui.container.Panel
        PlottingperpatchdisabledLabel   matlab.ui.control.Label
        ResultsButton                   matlab.ui.control.Button
        RunGraFTButton                  matlab.ui.control.Button
        LambdaEditField_2               matlab.ui.control.NumericEditField
        LamForbEditField_2              matlab.ui.control.NumericEditField
        LamCorrEditField_2              matlab.ui.control.NumericEditField
        NumberofComponentsEditField_2   matlab.ui.control.NumericEditField
        UsePatchCheckBox_2              matlab.ui.control.CheckBox
        PatchSizeEditField_2            matlab.ui.control.NumericEditField
        PlotCheckBox                    matlab.ui.control.CheckBox
        DefaultsButton                  matlab.ui.control.StateButton
        AdvancedButton                  matlab.ui.control.Button
        SetButton                       matlab.ui.control.Button
        SparsityLabel                   matlab.ui.control.Label
        ExtratimetraceweightLabel       matlab.ui.control.Label
        PreventoverslycorrelateddictionaryelementsLabel  matlab.ui.control.Label
        PerpatchNoteLabel               matlab.ui.control.Label
        LamForbEditField_2Label         matlab.ui.control.Label
        PatchSizeEditField_2Label       matlab.ui.control.Label
        NumberofComponentsEditField_2Label  matlab.ui.control.Label
        LamCorrEditField_2Label         matlab.ui.control.Label
        LambdaEditField_2Label          matlab.ui.control.Label
        Label2_5                        matlab.ui.control.Label
        Label2_6                        matlab.ui.control.Label
        SaveCurrentParametersLabel      matlab.ui.control.Label
        ResultsTab                      matlab.ui.container.Tab
        LoadResultsPanel                matlab.ui.container.Panel
        ViewButton_2                    matlab.ui.control.Button
        ChangeButton_2                  matlab.ui.control.Button
        Label_9                         matlab.ui.control.Label
        CurrentDirectoryLabel_2         matlab.ui.control.Label
        Label_8                         matlab.ui.control.Label
        LoadButton                      matlab.ui.control.Button
        DetectButton                    matlab.ui.control.Button
        Panel_7                         matlab.ui.container.Panel
        CurrentViewLabel                matlab.ui.control.Label
        IM_NUMLabel                     matlab.ui.control.Label
        Button_6                        matlab.ui.control.Button
        Button_5                        matlab.ui.control.Button
        UIAxes3                         matlab.ui.control.UIAxes
        UIAxes2                         matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        Colors      % pallett
        Data        % data
        Status      % app status
        params      % params
        corr_kern   % corr_kern
        NWB         % nwb-related
    end
    
    methods (Access = private)
        
        function colors = get_colors(app)
            colors = cell(20,1);
            % PALLET
            colors{1} = '#000000';  % black
            colors{2} = '#FFFFFF';  % white
            colors{3} = '#303C4D';  % 
            colors{5} = '#0D1117';  % black background
            colors{4} = '#161B22';  % gray
            colors{6} = '#43A0EB';  % highlight blue
            colors{7} = '#238636';  % github green
            colors{8} = '#F8965A';  % lamp 'busy'
            app.Colors = colors;
        end
        
        function colorMePlz(app)
            get_colors(app);
            % UIFIGURE
            app.Label2_3.FontColor              = app.Colors{2};
            app.Label2_4.FontColor              = app.Colors{2};
            app.GraFTanalysisLabel_2.FontColor  = app.Colors{2};
            app.UIFigure.Color                  = app.Colors{4};
            % OPENDATASET tab
            app.OpenDatasetTab.BackgroundColor  = app.Colors{5};            % TAB
            app.OptionsPanel.BackgroundColor    = app.Colors{5};            % Panel
            app.OptionsPanel.ForegroundColor    = app.Colors{6};            % Foreground
            app.SetUpPanel.BackgroundColor      = app.Colors{5};            % Panel
            app.SetUpPanel.ForegroundColor      = app.Colors{6};            % Foreground
            app.AppStatusPanel.BackgroundColor  = app.Colors{5};            % Panel
            app.AppStatusPanel.ForegroundColor  = app.Colors{6};            % Foreground
            app.StatusLamp_2.Color                = app.Colors{7};          % Lamp
                % Data Loading Options
                app.DataLoadingPanel.BackgroundColor    = app.Colors{5};    % Panel
                app.DataLoadingPanel.ForegroundColor    = app.Colors{6};    % Foreground
                app.ImagesListBox.BackgroundColor       = app.Colors{4};    % List Box
                app.SelectAllButton.BackgroundColor     = app.Colors{4};    % Select All Button
                % Individual File Loading
                app.SingleFileSelectionPanel.BackgroundColor = app.Colors{5};  % File Panel 
                app.SingleFileSelectionPanel.ForegroundColor = app.Colors{6};
                    % .nwb
                    app.nwbSelectdatalocationPanel.BackgroundColor  = app.Colors{5};
                    app.nwbSelectdatalocationPanel.ForegroundColor  = app.Colors{2};
                    app.TextArea.BackgroundColor                    = app.Colors{5};
                    app.ListBox.BackgroundColor                     = app.Colors{5};
                    % .mat
                    app.matSelectdesiredfielddetectedPanel.BackgroundColor  = app.Colors{5};           % .matPanel
                    app.matSelectdesiredfielddetectedPanel.ForegroundColor  = app.Colors{2};
                    app.SelectdesiredfielddetectedListBox.BackgroundColor   = app.Colors{5};
                    app.InfoTextArea.BackgroundColor                        = app.Colors{5};
                % Options Panel
                app.ButtonGroup.BackgroundColor     = app.Colors{5};        % Motion Correction
                app.ChooseButton.BackgroundColor    = app.Colors{4};        % Cropping
                    % Cropping
                    app.ButtonGroup_2.BackgroundColor       = app.Colors{5};
                    app.CropButton_2.BackgroundColor        = app.Colors{4};
                    app.HistogramButton.BackgroundColor     = app.Colors{4};
                    app.ProjectionButton.BackgroundColor    = app.Colors{4};
                    app.ViewButton.BackgroundColor      = app.Colors{4};
                app.DropDown.BackgroundColor            = app.Colors{4};    % Data Denoising
                app.Panel.BackgroundColor               = app.Colors{5};    % Cropping Tool
                app.Panel_2.BackgroundColor             = app.Colors{5};    % UIAxes
            % GraFT
            app.GraFTTab.BackgroundColor                = app.Colors{5};    % GraFT Tab
            app.MainParametersPanel.BackgroundColor     = app.Colors{5};    % Main GraFT parameters
            app.AdvancedOptionsPanel.BackgroundColor    = app.Colors{5};    % Advanced GraFT parameters
            app.Panel_4.BackgroundColor                 = app.Colors{5};
                app.AppStatusPanel_2.BackgroundColor    = app.Colors{5};    % 2nd app status
                app.SavePanel.BackgroundColor           = app.Colors{5};    % save panel
                    app.Panel_5.BackgroundColor         = app.Colors{4};
            % Results
            app.ResultsTab.BackgroundColor              = app.Colors{5};    % Results tab
                app.LoadResultsPanel.BackgroundColor    = app.Colors{5};
                app.LoadResultsPanel.ForegroundColor    = app.Colors{6};
                    app.DetectButton.BackgroundColor    = app.Colors{4};
                    app.ChangeButton_2.BackgroundColor  = app.Colors{4};
                    app.LoadButton.BackgroundColor      = app.Colors{4};
                    app.ViewButton_2.BackgroundColor    = app.Colors{4};
                    app.Label_8.BackgroundColor         = app.Colors{4};
                app.Panel_7.BackgroundColor             = app.Colors{5};
                app.Button_5.BackgroundColor            = app.Colors{4};
                app.Button_6.BackgroundColor            = app.Colors{4};

        end
        
        function setDefaults(app)
            % Data 
            app.Data.flag               = '';                               % no data loaded
            app.Data.name               = cd;
            app.Data.files              = [];
            app.Data.Fsim               = [];                               % raw data
            app.Data.Fsim_motco         = [];                               % motion_corrected/denoised
            app.Data.S                  = [];                               % GraFT results
            app.Data.D                  = [];
            app.Data.type               = 'dir';                               % .mat, .nwb, or dir (default)
            app.Data.temp               = [];                               % for loaded indiviual files
            app.Data.new_load           = [];                               % for loading saved GraFT analysis
            % Open Dataset
            app.currentpathLabel.Text   = pwd;
            app.Label_9.Text            = pwd;
            app.Status.MotionCorrection = 'None';
            app.Status.projection_mean  = 0;
            app.Status.projection_max   = 0;
            app.Status.im_num           = 0;                                % total # of images in path
            app.Status.current_im       = 0;                                % current image for 'view'
            app.Status.denoise          = 0;                                % denoising status
            app.Status.crop             = 0;                                % cropping
            app.Status.res_current_im   = 1;                                % results current image
            app.Status.res_total_im_num = 0;                                % total number of results image loaded
            % GraFT
            app.Status.adv_settings     = 0;                                % toggle flip flop control
            % NWB
            app.NWB.acquisitiondatastub = [{'TwophotonSeries'};             % Calcium
                                           {'vcs'};                         % VoltageClampSeries (icephys)
                                           {'ElectricalSeries'};            % Ecephys (Extracellular electrophysiology) 
                                           ];       
            % Data Loading Panel
            app.DataLoadingPanel.Visible                            = 'off';
                app.BrowseforFolderButton.Visible                   = 'on';
                app.BrowseforFileButton.Visible                     = 'on';
                app.LoadDataButton.Visible                          = 'on';
                app.NewLoadButton.Visible                           = 'off';
            app.AppStatusPanel.Visible                              = 'off';
                app.SingleFileSelectionPanel.Visible                = 'off';
                    app.matSelectdesiredfielddetectedPanel.Visible  = 'off';
                    app.nwbSelectdatalocationPanel.Visible          = 'off';
            app.OptionsPanel.Visible                                = 'off';
                app.Panel.Visible                                   = 'off';
            % GraFT
            app.MainParametersPanel.Visible                         = 'on';
                app.AdvancedOptionsPanel.Visible                    = 'off';
            app.Panel_4.Visible                                     = 'off';
            % Results Tab
            app.ViewButton_2.Enable                                 = 'off';
            app.Panel_7.Visible                                     = 'off';
        end

        function paramsDefault(app)
            % basic
            app.params.lambda           = 0.05;
            app.params.lamForb          = 0.2;
            app.params.lamCorr          = 0.1;
            app.params.n_dict           = 5;
            app.params.patchSize        = 50;
            app.params.usePatch         = true;
            app.params.plot             = true;
            % advanced
            app.params.lamCont          = 0.1;
            app.params.grad_type        = 'Full Optimization';
            app.params.lamContStp       = 0.9;
            app.params.create_memmap    = false;
            app.params.verbose          = 0;
            app.params.normalizeSpatial = true;
            app.params.likely_form      = 'gaussian';
            % correlation kernel
            app.corr_kern.w_time         = 0;
            app.corr_kern.reduce_dim     = true;
            app.corr_kern.corrType       = 'embedding';
        end
        
        function load_data(app)
            % update visibility
            app.DataLoadingPanel.Visible = 'off';
            app.SingleFileSelectionPanel.Visible = 'off';

            % load data differently depending on chosen filetype
            switch app.Data.type
                case 'dir'                                                  % comes from folder dir
                    app.Data.files  = dir(fullfile(app.Data.name, '*.tiff'));
                    pause(0.25);
                    if size(app.Data.files, 1) == 0
                        % If no images found
                        app.textLabel.Text = sprintf('%s \nNo images found', ...
                                                        app.textLabel.Text);
                        % ListBox Empty
                        app.ImagesListBox.Items         = {};                       
                        app.LoadSelectionButton.Visible = 'off';
                        app.SelectAllButton.Visible     = 'off';
                        app.StatusLamp_2.Color          = app.Colors{7};    % Status = not running
                        % Show panel
                        app.DataLoadingPanel.Visible = 'on';
                    else
                        % 'tiff images found
                        num_files = length(app.Data.files);
                        app.Data.Steps = num_files;
                        app.textLabel.Text = sprintf('%s \n%d images found', ...
                                                app.textLabel.Text, ...
                                                num_files);
                        pause(0.5);
                        
                        % Initiate cell with loaded tiff imgs name
                        file_name_cell = cell(1,num_files);
                        for i = 1:num_files
                            file_name_cell{i} = app.Data.files(i).name;
                        end

                        % ListBox Update
                        app.ImagesListBox.Items         = file_name_cell;
                        app.DataLoadingPanel.Visible    = 'on';
                        app.LoadSelectionButton.Visible = 'on';
                        app.SelectAllButton.Visible     = 'on';
                        
                        % Update Status
                        app.StatusLamp_2.Color = app.Colors{7};
                    end
                case '.nwb'
                    try
                        % uiprogressdlg
                        fig = uifigure;
                        fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
                        movegui(fig, "center"); fig.Visible = 'on';
                        d = uiprogressdlg(fig,'Title','Loading file',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        drawnow
                        d.Message = 'File type - .nwb';
                        app.Data.temp = nwbRead(app.currentpathLabel.Text, 'ignorecache');
                        close(d); close(fig);

                        % Visibility
                        app.SingleFileSelectionPanel.Visible    = 'on';
                        app.nwbSelectdatalocationPanel.Visible  = 'on';

                        % Listbox + Text Area
                        fieldname_cell = fieldnames(app.Data.temp);
                        text = '';
                        for i = 1:numel(fieldname_cell)
                            text = sprintf('%s \n%s', text, fieldname_cell{i});
                        end
                        app.TextArea.Value = text;
                        if ~isempty(find(contains(fieldname_cell, 'acquisition')))
                            app.ListBox.Items = app.NWB.acquisitiondatastub;
                        end
                    catch
                        warning('Something went wrong, try loading another file')
                    end

                case '.mat'
                    try
                        % uiprogressdlg
                        fig = uifigure;
                        fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
                        movegui(fig, "center"); fig.Visible = 'on';
                        d = uiprogressdlg(fig,'Title','Loading file',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        drawnow
                        d.Message = 'File type - .mat';
                        app.Data.temp = load(app.Data.name);
                        close(d); close(fig);

                        % Visibility
                        app.SingleFileSelectionPanel.Visible = 'on';
                        app.matSelectdesiredfielddetectedPanel.Visible = 'on';

                        % Initiate cell with loaded fieldnames
                        fieldname_cell = fieldnames(app.Data.temp);
                        % Updating ListBox
                        app.SelectdesiredfielddetectedListBox.Items = fieldname_cell;
                        % Initiating Info text field
                        first = getfield(app.Data.temp, fieldname_cell{1});
                        info  = whos('first');
                        % Update text
                        app.InfoTextArea.Value = sprintf('Detected:\n\nsize: %s\nbytes: %d\nclass: %s', ...
                                                        num2str(info.size), ...
                                                        info.bytes, ...
                                                        info.class);
                    catch
                        warning('Something went wrong, try loading another file')
                    end
                    
            end
        end

        function data = motion_correction(app, type)
            % check for double/repeat motion correction
            if strcmp(type, app.Status.MotionCorrection)
                data = app.Data.Fsim_motco;
                return
            end
            
            % uiprogressdlg
            fig = uifigure;
            fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
            movegui(fig, "center"); fig.Visible = 'on';
            d = uiprogressdlg(fig,'Title','Motion Correction in Progresss',...
                'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
            drawnow

            t = tic;
            switch type
                case 'Average'
                    d.Message = 'Method - Average';
                    data = app.Data.Fsim/median(app.Data.Fsim(:));
                    app.Status.MotionCorrection = 'Average';
                case 'Norm corre'
                    d.Message = 'Method - Norm corre';
                    options_rigid = NoRMCorreSetParms('d1',size(app.Data.Fsim,1),'d2',size(app.Data.Fsim,2), ...
                                    'bin_width',50,'max_shift',10,'us_fac',2,'iter',5,'init_batch',200);
                    [data,~,~,~,~] = normcorre(app.Data.Fsim,options_rigid);
                    app.Status.MotionCorrection = 'Norm corre';
                case 'None'
                    d.Message = 'Method - None';
                    data = app.Data.Fsim;
                    app.Status.MotionCorrection = 'None';
            end
            close(d); close(fig);

            % Update User Status
            app.textLabel.Text = sprintf('%s \nMotion correction--"%s" in %.3f seconds', ...
                                    app.textLabel.Text, app.Status.MotionCorrection, toc(t));
            % Update denoising
            app.Status.denoise = 0;
        end
        
        function get_projection(app, type)
            % do projections and save them if first time
            switch type
                case 'Mean'
                    if app.Status.projection_mean == 0
                        % update
                        app.Status.projection_mean = 1;
                        % uiprogressdlg
                        fig = uifigure;
                        fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
                        movegui(fig, "center"); fig.Visible = 'on';
                        d = uiprogressdlg(fig,'Title','Projection in Process',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        drawnow
                        d.Message = 'Mean Intensity Projection';
                        % do
                        app.Data.projection.mean = mean(app.Data.Fsim_motco,3);
                        close(d); close(fig);
                    else
                        return
                    end
                case 'Max'
                    % max intensity projection
                    if app.Status.projection_max == 0
                        % update
                        app.Status.projection_mean = 1;
                        % uiprogressdlg
                        fig = uifigure;
                        fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
                        movegui(fig, "center"); fig.Visible = 'on';
                        d = uiprogressdlg(fig,'Title','Projection in Process',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        drawnow
                        d.Message = 'Max Intensity Projection';
                        % do
                        app.Data.projection.max = max(app.Data.Fsim_motco, [], 3);
                        close(d); close(fig);
                    else
                        return
                    end
            end
        end
        
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UIFigure.Visible = 'off';
            movegui(app.UIFigure, 'center')
            app.UIFigure.Visible = 'on';
            app.colorMePlz()                                                % Set UI colors schemes
            app.setDefaults()                                               % Initiates app.Data/Status + Panel visibilities
            app.paramsDefault()                                             % Resets GraFT params
        end

        % Button pushed function: BrowseforFolderButton
        function BrowseforFolderButtonPushed(app, event)
            new_path = uigetdir("Select Folder to Save");
            if new_path ~= 0                                                % case of cancellation
                app.currentpathLabel.Text = new_path;
                cd(new_path);
            else
                warning('No new folder selected')
            end
            % Update
            app.Data.name = new_path;
            % datatype
            app.Data.type = 'dir';
        end

        % Button pushed function: BrowseforFileButton
        function BrowseforFileButtonPushed(app, event)
            [filename, path] = uigetfile({'*.nwb;*.mat'}, "Select File");
            new_path = [path, filename];

            if ~isequal(filename, 0)
                app.currentpathLabel.Text = new_path;
                cd(path);
            else
                warning('No new file selected')
            end
            
            % Update
            app.Data.name = filename;
            % datatype
            app.Data.type = filename(find(filename == '.'):end);
        end

        % Value changed function: SelectdesiredfielddetectedListBox
        function SelectdesiredfielddetectedListBoxValueChanged(app, event)
            value = app.SelectdesiredfielddetectedListBox.Value;
            
            % Initiating Info text field
            current = getfield(app.Data.temp, value);
            info  = whos('current');
            % Update text
            app.InfoTextArea.Value = sprintf('Detected:\n\nsize: %s\nbytes: %d\nclass: %s', ...
                                            num2str(info.size), ...
                                            info.bytes, ...
                                            info.class);
        end

        % Button pushed function: LoadDataButton
        function LoadDataButtonPushed(app, event)
            % updating UI with new data selection
            app.AppStatusPanel.Visible  = 'on';
            app.OptionsPanel.Visible    = 'off';
            app.StatusLamp_2.Color      = app.Colors{8};
            app.textLabel.Text          = 'Loading Data...';
            
            % load fx
            app.load_data()

            % Visibilities
            app.LoadDataButton.Visible          = 'off';
            app.BrowseforFolderButton.Visible   = 'off';
            app.BrowseforFileButton.Visible     = 'off';
            app.NewLoadButton.Visible           = 'on';
        end

        % Button pushed function: SelectAllButton
        function SelectAllButtonPushed(app, event)
            app.ImagesListBox.Value = app.ImagesListBox.Items;              % Select All Items Possible
        end

        % Button pushed function: LoadSelectionButton
        function LoadSelectionButtonPushed(app, event)
            % Selection
            num_selected = length(app.ImagesListBox.Value);
            app.textLabel.Text = sprintf('%s \n%d images selected', app.textLabel.Text, num_selected);
            
            % Checks selection type
            if num_selected == 0
                app.textLabel.Text = sprintf('%s \nMake selection', app.textLabel.Text);
                return
            elseif num_selected ~= app.Data.Steps
                selection = cell2struct(app.ImagesListBox.Value, 'name', 1);
                app.Data.files = selection;
            end

            % Load data
            app.StatusLamp_2.Color = app.Colors{8}; pause(0.5); t = tic;
            app.Data = load_app_data(app.Data);
            
            % Update App
            app.textLabel.Text = sprintf('%s, \n%s', app.textLabel.Text, app.Data.flag);
            app.textLabel.Text = sprintf('%s \nTime taken: %.3f seconds', app.textLabel.Text, toc(t));
            app.StatusLamp_2.Color          = app.Colors{7};
            app.DataLoadingPanel.Visible    = 'off';
                
            % Initiaiting Motion Correct with 'None' method
            app.Data.Fsim_motco = app.Data.Fsim;

            % Show options panel if loading complete
            if strcmp(app.Data.flag, 'Complete') == 1; app.OptionsPanel.Visible = 'on';end
        end

        % Button pushed function: SelectButton
        function SelectButtonPushed(app, event)
            % Independent file selection
            switch app.Data.type
                case '.nwb'
                case '.mat'
                    % Selection
                    app.Data.Fsim = getfield(app.Data.temp, app.SelectdesiredfielddetectedListBox.Value);
            end

            % Update App
            app.Data.flag = 'Complete';
            app.textLabel.Text = sprintf('Loaded .mat file\nField Name: %s\n%s', ...
                                        app.SelectdesiredfielddetectedListBox.Value, ...
                                        app.Data.flag);
            app.StatusLamp_2.Color                  = app.Colors{7};
            app.SingleFileSelectionPanel.Visible    = 'off';

            % Initiaiting Motion Correct with 'None' method
            app.Data.Fsim_motco = app.Data.Fsim;
            
            % Show options panel if loading complete
            if strcmp(app.Data.flag, 'Complete') == 1; app.OptionsPanel.Visible = 'on';end
            % Clear memory
            clearvars app.Data.temp
        end

        % Button pushed function: ChooseButton
        function ChooseButtonPushed(app, event)
            % Performs Selected Motion Correction
            app.Data.Fsim_motco = app.motion_correction(app.ButtonGroup.SelectedObject.Text);

            % Show first image
            cla(app.UIAxes, "reset")
            imagesc(app.Data.Fsim_motco(:,:,1), 'Parent', app.UIAxes);      % use this axis image
            colormap(app.UIAxes, gray);
            
            % Label and Slider Values
            app.Status.im_num       = size(app.Data.Fsim_motco, 3);         % total image number
            app.Status.current_im   = 1;                                    % initializing current image
            app.Label_2.Text        = sprintf('1/%d', app.Status.im_num);   % creating total image #
            app.Slider.Value        = 1;                                    % initializing slider value
            if app.Status.im_num == 1                                       % disabling when only one image
                app.Slider.Enable   = 'off';
                app.Button.Enable   = 'off';
                app.Button_2.Enable = 'off';
            else
                app.Slider.Enable   = 'on';
                app.Slider.Visible  = 'on';
                app.Slider.Limits   = [1,app.Status.im_num];                % setting limit range when im > 1
            end

            % Default Panel Control
            app.ButtonGroup_2.HighlightColor        = app.Colors{6};
            app.Panel.Visible                       = 'on';
            app.Panel_2.Visible                     = 'on';
            app.ButtonGroup_2.Visible               = 'on';
            % Remove other options while selecting
            app.AppStatusPanel.Visible          = 'off';
            app.ButtonGroup.Visible             = 'off';
            app.MotionCorrectionLabel.Visible   = 'off';
            app.DataDenoisingLabel.Visible      = 'off';
            app.DropDown.Visible                = 'off';
            app.DenoiseButton.Visible           = 'off';
        end

        % Button pushed function: DenoiseButton
        function DenoiseButtonPushed(app, event)
            app.Data.Fsim_motco = app.motion_correction(app.ButtonGroup.SelectedObject.Text);
            
            if app.Status.denoise == 0
                % update
                app.Status.denoise = 1;
                % uiprogressdlg
                fig = uifigure;
                fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
                movegui(fig, "center"); fig.Visible = 'on';
                d = uiprogressdlg(fig,'Title','Data Denoising in Proccess',...
                    'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                drawnow
                d.Message = 'Denoising data...';
                % do
                tic;
                try
                    app.Data.Fsim_motco = denoiseCIinSpace(app.Data.Fsim_motco);
                    close(d); close(fig);
                catch
                    close(d); close(fig);
                    app.textLabel.Text = sprintf('%s, \nProblem with denoising data, examine data size.', ...
                                                app.textLabel.Text);
                    return 
                end

                app.textLabel.Text = sprintf('%s, \nDenoising Done in %f seconds', ...
                                            app.textLabel.Text, ...
                                            toc);
            else
                app.textLabel.Text = sprintf('%s, \nData already completed denoising.', ...
                                            app.textLabel.Text);
            end
            
        end

        % Value changing function: Slider
        function SliderValueChanging(app, event)
            app.Status.current_im   = round(event.Value);
            switch app.ButtonGroup_2.SelectedObject.Text
                case 'View'
                    % change picture with slider
                    app.Label_2.Text = sprintf('%d/%d', app.Status.current_im, app.Status.im_num);
                    imagesc(app.Data.Fsim_motco(:,:,app.Status.current_im), 'Parent', app.UIAxes);
                    colormap(app.UIAxes, gray);
                case 'Projection'
                    % disable with projection
                case 'Histogram'
                    % threshold control with slider
            end
        end

        % Button pushed function: Button, Button_2
        function Button_2Pushed(app, event)
            switch app.ButtonGroup_2.SelectedObject.Text                    % single image '>' & '<' button control
                case 'View'                                                 % only one use case for when view is selected
                    if app.Status.current_im > 1 && event.Source.Text=='<'
                        app.Status.current_im   = app.Status.current_im - 1;
                        app.Slider.Value        = app.Status.current_im;
                    elseif app.Status.current_im < app.Status.im_num && event.Source.Text=='>'
                        app.Status.current_im   = app.Status.current_im + 1;
                        app.Slider.Value        = app.Status.current_im;
                    end

                    app.Label_2.Text = sprintf('%d/%d', app.Status.current_im, app.Status.im_num);
                    imagesc(app.Data.Fsim_motco(:,:,app.Status.current_im), 'Parent', app.UIAxes);
                    colormap(app.UIAxes, gray);
            end
            
        end

        % Button pushed function: BackButton
        function BackButtonPushed(app, event)
            if any(size(app.Data.Fsim) ~= size(app.Data.Fsim_motco))
                app.NoCropSelectedLabel.Visible = 'off';
            else
                app.NoCropSelectedLabel.Visible = 'on';
            end
            
            % Disable 
            app.Panel.Visible                   = 'off';
            app.AppStatusPanel.Visible          = 'on';
            app.ButtonGroup.Visible             = 'on';
            app.MotionCorrectionLabel.Visible   = 'on';
            app.DataDenoisingLabel.Visible      = 'on';
            app.DropDown.Visible                = 'on';
            app.DenoiseButton.Visible           = 'on';
        end

        % Callback function: ButtonGroup_2, ButtonGroup_2
        function ButtonGroup_2SelectionChanged(app, event)
            switch app.ButtonGroup_2.SelectedObject.Text
                case 'View'
                    cla(app.UIAxes, "reset")

                    app.ChooseButtonPushed('')
                    app.Panel_2.Visible                         = 'on';
                    app.Button_2.Visible                        = 'on';
                    app.Button.Visible                          = 'on';
                    app.Label_2.Visible                         = 'on';
                    app.Slider.Visible                          = 'on';
                    app.ToCropRightClickCropImageLabel.Visible  = 'off';
                    app.Label3.Visible                          = 'off';
                
                case 'Crop'
                    % handle visibilies
                    app.Slider.Visible                          = 'off';
                    app.Button.Visible                          = 'off';
                    app.Button_2.Visible                        = 'off';
                    app.Label_2.Visible                         = 'off';
                    app.ToCropRightClickCropImageLabel.Visible  = 'on';
                    app.Label3.Visible                          = 'on';

                    % automatically does a default projection
                    cla(app.UIAxes, "reset")

                    % do default projection (mean)
                    app.get_projection('Mean');
                    imagesc(app.Data.projection.mean, 'Parent', app.UIAxes);
                    colormap(app.UIAxes, gray);


                    % interactive cropping
                    [img_out, img_idx] = imcrop(app.UIAxes);                % img_dx = [x,y,width,height]
                    if isempty(img_out) || isempty(img_idx)
                        return
                    end
                    app.Data.projection.mean = img_out;                     % updating projection img
                    imagesc(app.Data.projection.mean, 'Parent', app.UIAxes);
                    colormap(app.UIAxes, gray);
                    
                    % uiprogressdlg
                    fig = uifigure;
                    fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
                    movegui(fig, "center"); fig.Visible = 'on';
                    d = uiprogressdlg(fig,'Title','Cropping in Progresss',...
                        'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                    drawnow
                    % cropping
                    t = tic;
                    app.Data.Fsim_motco = app.Data.Fsim_motco(img_idx(1):img_idx(1)+img_idx(3), ... % X
                                                              img_idx(2):img_idx(2)+img_idx(4), ... % Y
                                                              :);                                   % Z
                    % end figure
                    close(d); close(fig);
                                
                    % Update User Status
                    app.textLabel.Text = sprintf('%s \nCropping Complete in %.3f seconds', ...
                                            app.textLabel.Text, toc(t));
                    
                    % Update Crop status
                    if any(size(app.Data.Fsim) ~= size(app.Data.Fsim_motco))
                        app.NoCropSelectedLabel.Visible = 'off';
                    else
                        app.NoCropSelectedLabel.Visible = 'on';
                    end

                case 'Projection'
                    cla(app.UIAxes, "reset")

                    % do default projection (mean)
                    app.get_projection('Mean');
                    imagesc(app.Data.projection.mean, 'Parent', app.UIAxes);
                    colormap(app.UIAxes, gray);
                    
                    % visibilities
                    app.Panel_2.Visible                         = 'on';
                    app.ThresholdLabel.Visible                  = 'off';
                    app.ViewDropDown.Visible                    = 'off';
                    app.Slider.Visible                          = 'off';
                    app.Button_2.Visible                        = 'off';
                    app.Button.Visible                          = 'off';
                    app.Label_2.Visible                         = 'off';
                    app.ToCropRightClickCropImageLabel.Visible  = 'off';
                    app.Label3.Visible                          = 'off';
               
                case 'Histogram'
                    cla(app.UIAxes, "reset")

                    % https://www.mathworks.com/matlabcentral/answers/500983-change-axis-colour-matlab
                    % https://www.mathworks.com/help/matlab/ref/matlab.graphics.axis.axes-properties.html

                    hist = histogram(app.Data.Fsim_motco(:,:,:), 200, 'Normalization', 'pdf', 'Parent',app.UIAxes);
                    mx = max(hist.Data(:));
                    mn = min(hist.Data(:));

                    hist.BinLimits = [mn, mx];

                    xline(mx, 'Color', 'r', 'Parent',app.UIAxes)
                    xline(5, 'Color', 'r', 'Parent',app.UIAxes)

                    set(app.UIAxes, 'XColor', [1 1 1], 'YColor', [1,1,1]);
                    
                    app.UIAxes.visible          = 'on';
                    app.Slider.Enable           = 'on';
                    app.ThresholdLabel.Visible  = 'off';
                    app.ViewDropDown.Visible    = 'off';
            end
        end

        % Value changed function: DefaultsButton
        function DefaultsButtonValueChanged(app, event)
            % setting them back to defaults
            app.RunGraFTButton.Enable = 'off';
            % basic
            app.LambdaEditField_2.Value             = app.params.lambda;
            app.LamForbEditField_2.Value            = app.params.lamForb;
            app.LamCorrEditField_2.Value            = app.params.lamCorr;
            app.NumberofComponentsEditField_2.Value = app.params.n_dict;
            app.UsePatchCheckBox_2.Value            = app.params.usePatch;
            app.PatchSizeEditField_2.Value          = app.params.patchSize;
            app.PlotCheckBox.Value                  = app.params.plot;
            % advanced
            app.ContinuityTermEditField.Value       = app.params.lamCont;
            app.GradientTypeDropDown.Value          = 'Full Optimization';
            app.ContDecayEditField.Value            = app.params.lamContStp;
            app.CreateMemmapCheckBox.Value          = app.params.create_memmap;
            app.VerboseSpinner.Value                = app.params.verbose;
            app.NormalizeSpatialCheckBox.Value      = app.params.normalizeSpatial;
            app.LikelyFormDropDown.Value            = app.params.likely_form;
            % correlation kernel
            app.W_timeEditField.Value               = app.corr_kern.w_time;
            app.ReduceDimCheckBox.Value             = app.corr_kern.reduce_dim;
            app.CorrelationTypeDropDown.Value       = app.corr_kern.corrType;
        end

        % Value changed function: ContDecayEditField, 
        % ...and 16 other components
        function LambdaEditField_2ValueChanged(app, event)
            app.RunGraFTButton.Enable = 'off';
%             if app.UsePatchCheckBox_2.Value == 1
%                 app.PlotCheckBox.Value = 0;
%                 app.PlotCheckBox.Enable = 'off';
%             else
%                 app.PlotCheckBox.Enable = 'on';
%             end
        end

        % Button pushed function: AdvancedButton
        function AdvancedButtonPushed(app, event)
            app.Status.adv_settings = app.Status.adv_settings + 1;
            if mod(app.Status.adv_settings, 2)==1
                app.AdvancedOptionsPanel.Visible = 'on';
            else
                app.AdvancedOptionsPanel.Visible = 'off';
            end
        end

        % Button pushed function: SetButton
        function SetButtonPushed(app, event)
            % saving parameters to what they are currently
            % basic
            app.params.lambda           = app.LambdaEditField_2.Value;
            app.params.lamForb          = app.LamForbEditField_2.Value;
            app.params.lamCorr          = app.LamCorrEditField_2.Value;
            app.params.n_dict           = app.NumberofComponentsEditField_2.Value;
            app.params.patchSize        = app.PatchSizeEditField_2.Value;
            app.params.usePatch         = app.UsePatchCheckBox_2.Value;
            app.params.plot             = app.PlotCheckBox.Value;
            % advanced
            app.params.lamCont          = app.ContinuityTermEditField.Value;
            if strcmp(app.GradientTypeDropDown.Value, 'Full Optimization');app.params.grad_type = 'full_ls_cor';else; app.params.grad_type = 'norm';end
            app.params.lamContStp       = app.ContDecayEditField.Value;
            app.params.create_memmap    = app.CreateMemmapCheckBox.Value;
            app.params.verbose          = app.VerboseSpinner.Value;
            app.params.normalizeSpatial = app.NormalizeSpatialCheckBox.Value;
            app.params.likely_form      = app.LikelyFormDropDown.Value;
            % correlation kernel
            app.corr_kern.w_time         = app.W_timeEditField.Value;
            app.corr_kern.reduce_dim     = app.ReduceDimCheckBox.Value;
            app.corr_kern.corrType       = app.CorrelationTypeDropDown.Value;
            
            % panel reset + graft button 
            app.Status.adv_settings = 0;
            app.AdvancedOptionsPanel.Visible = 'off';

            % check if data exists
            if ~isempty(app.Data.Fsim_motco)
                app.RunGraFTButton.Enable = 'on';
            else
                warning('No data loaded. Please load data.')
            end
        end

        % Button pushed function: RunGraFTButton
        function RunGraFTButtonPushed(app, event)
            if strcmp(app.Data.flag, '')
                app.TabGroup.SelectedTab = app.OpenDatasetTab;
                return
            end
            
            % uiprogressdlg
            fig = uifigure;
            fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
            movegui(fig, "center"); fig.Visible = 'on';
            d = uiprogressdlg(fig,'Title','GraFT in process',...
                'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
            drawnow

            % Actually run GraFT
            tic
            if app.params.usePatch
                [app.Data.S, app.Data.D] = patchGraFT(app.Data.Fsim_motco, app.params.n_dict,[],app.corr_kern,app.params);      % Learn the dictionary using patch-based code
            else
                [app.Data.D, app.Data.S] = GraFT(app.Data.Fsim_motco, [], app.corr_kern, app.params);   % Learn the dictionary (no patching - will be much more memory intensive and slower)
            end
            % end figure
            close(d); close(fig);

            % update text status
            app.textLabel.Text          = sprintf('%s \nGraFT Analysis Done! Time elapsed: %f seconds', ...
                                            app.textLabel.Text, toc);
            app.OutputhereLabel.Text    = app.textLabel.Text;

            app.Label_6.Text            = sprintf(['>>Data \n\nStructure with fields:\n\n' ...
                '           name: %s\n' ...
                '             files: %s\n' ...
                '            Fsim: [%sx%sx%s double]\n' ...
                'Fsim_motco: [%sx%sx%s double]\n' ...
                '                 S: [%sx%sx%s double]\n' ...
                '                 D: [%sx%s double]\n'], ...
                app.Data.name, ...
                string(size(app.Data.files,1)), ...
                string(size(app.Data.Fsim)), ...
                string(size(app.Data.Fsim_motco)), ...
                string(size(app.Data.S)), ...
                string(size(app.Data.D)));
            
            % results panel
            app.Label_7.Text = pwd;
            app.Label_9.Text = pwd;
            if app.params.normalizeSpatial
                normType = 'spatial';
            else
                normType = 'temporal';
            end
            saveName = sprintf('nfRun_%d_%d_%d_%d_%s.mat', ...
                round(100*app.params.lambda), round(100*app.params.lamForb),...
                round(100*app.params.lamCorr), round(100*app.params.lamCont),...
                normType); % Set the save name to store results in
            app.Label2_7.Text = saveName;

            app.Panel_4.Visible         = 'on';
            app.ResultsButton.Visible   = 'on';
        end

        % Button pushed function: BackButton_2
        function BackButton_2Pushed(app, event)
            app.Panel_4.Visible    = 'off';
            app.RunGraFTButton.Enable   = 'off';
        end

        % Button pushed function: ChangeButton, ChangeButton_2
        function ChangeButtonPushed(app, event)
            new_path = uigetdir("Select Directory / Folder");
            if new_path == 0
                return
            else
                app.Label_7.Text = new_path;
                app.Label_9.Text = new_path;
            end
        end

        % Button pushed function: SaveButton
        function SaveButtonPushed(app, event)
            saveDir  = app.Label_7.Text;                                   % Set the path where the output should be saved to
            saveName = app.Label2_7.Text;

            % update text status
            app.textLabel.Text          = sprintf('%s \nSaving results to %s...', ...
                                            app.textLabel.Text, saveName);
            app.OutputhereLabel.Text    = app.textLabel.Text;

            if ~app.KeeporiginaldataFsimCheckBox.Value
                app.Data.Fsim = '';
            end

            % uiprogressdlg
            fig = uifigure;
            fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
            movegui(fig, "center"); fig.Visible = 'on';
            d = uiprogressdlg(fig,'Title','GraFT in process',...
                'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
            drawnow
            str_to_save = app.Data;
            save(fullfile(saveDir,saveName),'-struct','str_to_save', '-v7.3')  % Save the results
            % end figure
            close(d); close(fig);

            % update text status
            app.textLabel.Text          = sprintf('%s \nSave complete!', ...
                                            app.textLabel.Text);
            app.OutputhereLabel.Text    = app.textLabel.Text;
        end

        % Button pushed function: ResultsButton
        function ResultsButtonPushed(app, event)
            app.Panel_4.Visible = 'on';
        end

        % Value changed function: NewLoadButton
        function NewLoadButtonValueChanged(app, event)
            app.setDefaults()                                               % Initiates app.Data/Status + Panel visibilities
            app.paramsDefault()                                             % Resets GraFT params
        end

        % Button pushed function: SeeResultsButton
        function SeeResultsButtonPushed(app, event)
            app.TabGroup.SelectedTab = app.ResultsTab;
            app.Label_9.Text = app.Label_7.Text;
        end

        % Button pushed function: DetectButton
        function DetectButtonPushed(app, event)
            if strcmp(app.Label_6.Text, '')
                app.Label_8.Text = 'No immediate result from GraFT detected. Load result file manually.';
            else
                app.Label_8.Text = app.Label_6.Text;
                app.ViewButton_2.Enable = 'on';
            end
        end

        % Button pushed function: LoadButton
        function LoadButtonPushed(app, event)
            [filename, path] = uigetfile({'*.mat'}, "Select File");
            new_path = [path, filename];

            if ~isequal(filename, 0)
                % uiprogressdlg
                fig = uifigure;
                fig.Visible = 'off'; fig.WindowStyle = 'modal'; fig.Position = [1800, 500, 400, 125];
                movegui(fig, "center"); fig.Visible = 'on';
                d = uiprogressdlg(fig,'Title','Loading file',...
                    'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                drawnow
                d.Message = 'Please wait while file loads';
                
                % do
                app.Data.new_load = load(new_path);
                close(d); close(fig);

                % check for desired fields
                if isfield(app.Data.new_load, 'S') && isfield(app.Data.new_load, 'D')
                    app.Label_8.Text = sprintf(['>>Data \n\nStructure with fields:\n\n' ...
                                    '           name: %s\n' ...
                                    '             files: %s\n' ...
                                    'Fsim_motco: [%sx%sx%s double]\n' ...
                                    '                 S: [%sx%sx%s double]\n' ...
                                    '                 D: [%sx%s double]\n'], ...
                                    app.Data.new_load.name, ...
                                    string(size(app.Data.new_load.files,1)), ...
                                    string(size(app.Data.new_load.Fsim_motco)), ...
                                    string(size(app.Data.new_load.S)), ...
                                    string(size(app.Data.new_load.D)));


                    % update status
                    app.Status.res_current_im   = 1;
                    app.IM_NUMLabel.Text        = num2str(app.Status.res_current_im);
                    app.Status.res_total_im_num = size(app.Data.new_load.S, 3);
                    app.ViewButton_2.Enable     = 'on';
                else
                    app.Label_8.Text = sprintf('%s\nStructure containing spatial and temporal (".S" & ".D") fields is not present.\nPlease try again.', ...
                                            app.Label_8.Text);
                end
            else
                warning('No new file selected')
            end
        end

        % Button pushed function: ViewButton_2
        function ViewButton_2Pushed(app, event)
            % update image panels
            cla(app.UIAxes2, "reset")
            cla(app.UIAxes3, "reset")
            imagesc(app.Data.new_load.S(:,:,1), 'Parent', app.UIAxes2);
            colormap(app.UIAxes2, gray);
            plot(app.Data.new_load.D(:,1), 'Parent', app.UIAxes3);
            app.Panel_7.Visible = 'on';
        end

        % Button pushed function: Button_5, Button_6
        function Button_6Pushed(app, event)
            if app.Status.res_current_im > 1 && event.Source.Text=='<'
                    app.Status.res_current_im = app.Status.res_current_im - 1;
%                     app.Slider.Value        = app.Status.current_im;
                elseif app.Status.res_current_im < app.Status.res_total_im_num && event.Source.Text=='>'
                    app.Status.res_current_im   = app.Status.res_current_im + 1;
%                     app.Slider.Value        = app.Status.current_im;
            end

            % update label
            app.IM_NUMLabel.Text = num2str(app.Status.res_current_im);

            % update image panels
            cla(app.UIAxes2, "reset")
            cla(app.UIAxes3, "reset")
            imagesc(app.Data.new_load.S(:,:,app.Status.res_current_im), 'Parent', app.UIAxes2);
            colormap(app.UIAxes2, gray);
            plot(app.Data.new_load.D(:,app.Status.res_current_im), 'Parent', app.UIAxes3);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [400 0 1000 1000];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Scrollable = 'on';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [37 63 940 771];

            % Create OpenDatasetTab
            app.OpenDatasetTab = uitab(app.TabGroup);
            app.OpenDatasetTab.Title = 'Open Dataset';
            app.OpenDatasetTab.BackgroundColor = [1 1 1];

            % Create AppStatusPanel
            app.AppStatusPanel = uipanel(app.OpenDatasetTab);
            app.AppStatusPanel.ForegroundColor = [0.0745 0.6235 1];
            app.AppStatusPanel.BorderType = 'none';
            app.AppStatusPanel.Title = 'App Status';
            app.AppStatusPanel.Visible = 'off';
            app.AppStatusPanel.BackgroundColor = [0.8 0.8 0.8];
            app.AppStatusPanel.FontWeight = 'bold';
            app.AppStatusPanel.FontSize = 14;
            app.AppStatusPanel.Position = [482 24 424 494];

            % Create textLabel
            app.textLabel = uilabel(app.AppStatusPanel);
            app.textLabel.VerticalAlignment = 'top';
            app.textLabel.FontColor = [1 1 1];
            app.textLabel.Position = [9 38 336 428];
            app.textLabel.Text = {'-text-'; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''};

            % Create StatusLamp_2
            app.StatusLamp_2 = uilamp(app.AppStatusPanel);
            app.StatusLamp_2.Position = [372 441 20 20];

            % Create SingleFileSelectionPanel
            app.SingleFileSelectionPanel = uipanel(app.OpenDatasetTab);
            app.SingleFileSelectionPanel.BorderType = 'none';
            app.SingleFileSelectionPanel.Title = 'Single-File Selection';
            app.SingleFileSelectionPanel.FontWeight = 'bold';
            app.SingleFileSelectionPanel.FontSize = 14;
            app.SingleFileSelectionPanel.Position = [36 41 597 477];

            % Create matSelectdesiredfielddetectedPanel
            app.matSelectdesiredfielddetectedPanel = uipanel(app.SingleFileSelectionPanel);
            app.matSelectdesiredfielddetectedPanel.ForegroundColor = [1 1 1];
            app.matSelectdesiredfielddetectedPanel.BorderType = 'none';
            app.matSelectdesiredfielddetectedPanel.Title = '.mat - Select desired field detected';
            app.matSelectdesiredfielddetectedPanel.BackgroundColor = [0.651 0.651 0.651];
            app.matSelectdesiredfielddetectedPanel.FontSize = 13;
            app.matSelectdesiredfielddetectedPanel.Position = [12 256 412 190];

            % Create SelectdesiredfielddetectedListBox
            app.SelectdesiredfielddetectedListBox = uilistbox(app.matSelectdesiredfielddetectedPanel);
            app.SelectdesiredfielddetectedListBox.ValueChangedFcn = createCallbackFcn(app, @SelectdesiredfielddetectedListBoxValueChanged, true);
            app.SelectdesiredfielddetectedListBox.FontColor = [1 1 1];
            app.SelectdesiredfielddetectedListBox.BackgroundColor = [0.502 0.502 0.502];
            app.SelectdesiredfielddetectedListBox.Position = [4 11 206 148];

            % Create SelectButton
            app.SelectButton = uibutton(app.matSelectdesiredfielddetectedPanel, 'push');
            app.SelectButton.ButtonPushedFcn = createCallbackFcn(app, @SelectButtonPushed, true);
            app.SelectButton.Position = [281 30 100 23];
            app.SelectButton.Text = 'Select';

            % Create InfoTextArea
            app.InfoTextArea = uitextarea(app.matSelectdesiredfielddetectedPanel);
            app.InfoTextArea.Editable = 'off';
            app.InfoTextArea.FontColor = [1 1 1];
            app.InfoTextArea.BackgroundColor = [0.502 0.502 0.502];
            app.InfoTextArea.Position = [246 73 167 86];

            % Create nwbSelectdatalocationPanel
            app.nwbSelectdatalocationPanel = uipanel(app.SingleFileSelectionPanel);
            app.nwbSelectdatalocationPanel.ForegroundColor = [1 1 1];
            app.nwbSelectdatalocationPanel.BorderType = 'none';
            app.nwbSelectdatalocationPanel.Title = '.nwb - Select data location';
            app.nwbSelectdatalocationPanel.BackgroundColor = [0.8 0.8 0.8];
            app.nwbSelectdatalocationPanel.FontSize = 13;
            app.nwbSelectdatalocationPanel.Position = [13 212 585 234];

            % Create ListBox
            app.ListBox = uilistbox(app.nwbSelectdatalocationPanel);
            app.ListBox.FontColor = [1 1 1];
            app.ListBox.BackgroundColor = [0.502 0.502 0.502];
            app.ListBox.Position = [2 107 195 74];

            % Create TextArea
            app.TextArea = uitextarea(app.nwbSelectdatalocationPanel);
            app.TextArea.HorizontalAlignment = 'center';
            app.TextArea.FontColor = [1 1 1];
            app.TextArea.BackgroundColor = [0.651 0.651 0.651];
            app.TextArea.Position = [222 9 346 172];

            % Create NoteOnlyrawdatainacquisionisacceptedLabel
            app.NoteOnlyrawdatainacquisionisacceptedLabel = uilabel(app.nwbSelectdatalocationPanel);
            app.NoteOnlyrawdatainacquisionisacceptedLabel.WordWrap = 'on';
            app.NoteOnlyrawdatainacquisionisacceptedLabel.FontColor = [1 0.4118 0.1608];
            app.NoteOnlyrawdatainacquisionisacceptedLabel.Position = [41 12 127 48];
            app.NoteOnlyrawdatainacquisionisacceptedLabel.Text = 'Note: Only raw data in ''acquision'' is accepted ';

            % Create SelectButton_2
            app.SelectButton_2 = uibutton(app.nwbSelectdatalocationPanel, 'state');
            app.SelectButton_2.Text = 'Select';
            app.SelectButton_2.Position = [51 70 100 23];

            % Create LoadedNWBStructureLabel
            app.LoadedNWBStructureLabel = uilabel(app.nwbSelectdatalocationPanel);
            app.LoadedNWBStructureLabel.FontColor = [1 1 1];
            app.LoadedNWBStructureLabel.Position = [223 181 135 22];
            app.LoadedNWBStructureLabel.Text = 'Loaded NWB Structure: ';

            % Create OptionsPanel
            app.OptionsPanel = uipanel(app.OpenDatasetTab);
            app.OptionsPanel.ForegroundColor = [0.0745 0.6235 1];
            app.OptionsPanel.BorderType = 'none';
            app.OptionsPanel.Title = 'Options';
            app.OptionsPanel.BackgroundColor = [0.8 0.8 0.8];
            app.OptionsPanel.FontWeight = 'bold';
            app.OptionsPanel.FontSize = 14;
            app.OptionsPanel.Position = [35 23 403 495];

            % Create DenoiseButton
            app.DenoiseButton = uibutton(app.OptionsPanel, 'push');
            app.DenoiseButton.ButtonPushedFcn = createCallbackFcn(app, @DenoiseButtonPushed, true);
            app.DenoiseButton.Position = [252 158 68 24];
            app.DenoiseButton.Text = 'Denoise';

            % Create MotionCorrectionLabel
            app.MotionCorrectionLabel = uilabel(app.OptionsPanel);
            app.MotionCorrectionLabel.FontSize = 15;
            app.MotionCorrectionLabel.FontWeight = 'bold';
            app.MotionCorrectionLabel.FontColor = [1 1 1];
            app.MotionCorrectionLabel.Position = [25 429 134 22];
            app.MotionCorrectionLabel.Text = 'Motion Correction';

            % Create CroppingLabel
            app.CroppingLabel = uilabel(app.OptionsPanel);
            app.CroppingLabel.FontSize = 15;
            app.CroppingLabel.FontWeight = 'bold';
            app.CroppingLabel.FontColor = [1 1 1];
            app.CroppingLabel.Position = [30 303 72 22];
            app.CroppingLabel.Text = 'Cropping';

            % Create ChooseButton
            app.ChooseButton = uibutton(app.OptionsPanel, 'push');
            app.ChooseButton.ButtonPushedFcn = createCallbackFcn(app, @ChooseButtonPushed, true);
            app.ChooseButton.BackgroundColor = [0.8 0.8 0.8];
            app.ChooseButton.FontSize = 13;
            app.ChooseButton.FontColor = [1 1 1];
            app.ChooseButton.Position = [83 239 60 50];
            app.ChooseButton.Text = 'Choose';

            % Create DataDenoisingLabel
            app.DataDenoisingLabel = uilabel(app.OptionsPanel);
            app.DataDenoisingLabel.FontSize = 15;
            app.DataDenoisingLabel.FontWeight = 'bold';
            app.DataDenoisingLabel.FontColor = [1 1 1];
            app.DataDenoisingLabel.Position = [30 198 114 22];
            app.DataDenoisingLabel.Text = 'Data Denoising';

            % Create DropDown
            app.DropDown = uidropdown(app.OptionsPanel);
            app.DropDown.Items = {'Wavelet'};
            app.DropDown.FontColor = [1 1 1];
            app.DropDown.BackgroundColor = [0.8 0.8 0.8];
            app.DropDown.Position = [74 158 100 24];
            app.DropDown.Value = 'Wavelet';

            % Create ButtonGroup
            app.ButtonGroup = uibuttongroup(app.OptionsPanel);
            app.ButtonGroup.ForegroundColor = [1 1 1];
            app.ButtonGroup.BorderType = 'none';
            app.ButtonGroup.BackgroundColor = [0.8 0.8 0.8];
            app.ButtonGroup.FontSize = 14;
            app.ButtonGroup.Position = [58 345 133 77];

            % Create AverageButton
            app.AverageButton = uiradiobutton(app.ButtonGroup);
            app.AverageButton.Text = 'Average';
            app.AverageButton.FontSize = 14;
            app.AverageButton.FontColor = [1 1 1];
            app.AverageButton.Position = [11 54 74 22];
            app.AverageButton.Value = true;

            % Create NormcorreButton
            app.NormcorreButton = uiradiobutton(app.ButtonGroup);
            app.NormcorreButton.Text = 'Norm corre';
            app.NormcorreButton.FontSize = 14;
            app.NormcorreButton.FontColor = [1 1 1];
            app.NormcorreButton.Position = [11 28 92 22];

            % Create NoneButton
            app.NoneButton = uiradiobutton(app.ButtonGroup);
            app.NoneButton.Text = 'None';
            app.NoneButton.FontSize = 14;
            app.NoneButton.FontColor = [1 1 1];
            app.NoneButton.Position = [11 1 55 22];

            % Create NoCropSelectedLabel
            app.NoCropSelectedLabel = uilabel(app.OptionsPanel);
            app.NoCropSelectedLabel.FontAngle = 'italic';
            app.NoCropSelectedLabel.FontColor = [1 1 1];
            app.NoCropSelectedLabel.Position = [259 253 117 22];
            app.NoCropSelectedLabel.Text = '--No Crop Selected--';

            % Create DataLoadingPanel
            app.DataLoadingPanel = uipanel(app.OpenDatasetTab);
            app.DataLoadingPanel.ForegroundColor = [0.0745 0.6235 1];
            app.DataLoadingPanel.BorderType = 'none';
            app.DataLoadingPanel.Title = 'Data Loading';
            app.DataLoadingPanel.Visible = 'off';
            app.DataLoadingPanel.BackgroundColor = [0.8 0.8 0.8];
            app.DataLoadingPanel.FontWeight = 'bold';
            app.DataLoadingPanel.FontSize = 14;
            app.DataLoadingPanel.Position = [35 200 403 317];

            % Create ImagesListBox
            app.ImagesListBox = uilistbox(app.DataLoadingPanel);
            app.ImagesListBox.Multiselect = 'on';
            app.ImagesListBox.FontColor = [1 1 1];
            app.ImagesListBox.BackgroundColor = [0.8 0.8 0.8];
            app.ImagesListBox.Position = [156 73 195 202];
            app.ImagesListBox.Value = {'Item 1'};

            % Create SelectAllButton
            app.SelectAllButton = uibutton(app.DataLoadingPanel, 'push');
            app.SelectAllButton.ButtonPushedFcn = createCallbackFcn(app, @SelectAllButtonPushed, true);
            app.SelectAllButton.BackgroundColor = [0.149 0.149 0.149];
            app.SelectAllButton.FontColor = [1 1 1];
            app.SelectAllButton.Position = [37 239 65 32];
            app.SelectAllButton.Text = 'Select All';

            % Create LoadSelectionButton
            app.LoadSelectionButton = uibutton(app.DataLoadingPanel, 'push');
            app.LoadSelectionButton.ButtonPushedFcn = createCallbackFcn(app, @LoadSelectionButtonPushed, true);
            app.LoadSelectionButton.Position = [259 29 94 23];
            app.LoadSelectionButton.Text = 'Load Selection';

            % Create RangeShiftClickLabel
            app.RangeShiftClickLabel = uilabel(app.DataLoadingPanel);
            app.RangeShiftClickLabel.FontAngle = 'italic';
            app.RangeShiftClickLabel.FontColor = [1 1 1];
            app.RangeShiftClickLabel.Position = [19 168 137 18];
            app.RangeShiftClickLabel.Text = 'Range (Shift + Click)';

            % Create MultiSelectCtrlClickLabel
            app.MultiSelectCtrlClickLabel = uilabel(app.DataLoadingPanel);
            app.MultiSelectCtrlClickLabel.FontAngle = 'italic';
            app.MultiSelectCtrlClickLabel.FontColor = [1 1 1];
            app.MultiSelectCtrlClickLabel.Position = [14 190 137 22];
            app.MultiSelectCtrlClickLabel.Text = 'Multi-Select (Ctrl + Click)';

            % Create SetUpPanel
            app.SetUpPanel = uipanel(app.OpenDatasetTab);
            app.SetUpPanel.ForegroundColor = [0.0706 0.6196 1];
            app.SetUpPanel.BorderType = 'none';
            app.SetUpPanel.Title = 'Set-Up';
            app.SetUpPanel.BackgroundColor = [0.8 0.8 0.8];
            app.SetUpPanel.FontWeight = 'bold';
            app.SetUpPanel.FontSize = 14;
            app.SetUpPanel.Position = [35 535 871 186];

            % Create currentpathLabel
            app.currentpathLabel = uilabel(app.SetUpPanel);
            app.currentpathLabel.FontColor = [1 1 1];
            app.currentpathLabel.Position = [111 84 527 22];
            app.currentpathLabel.Text = '-current path-';

            % Create DATAFILESLabel
            app.DATAFILESLabel = uilabel(app.SetUpPanel);
            app.DATAFILESLabel.FontColor = [1 1 1];
            app.DATAFILESLabel.Position = [30 84 107 22];
            app.DATAFILESLabel.Text = 'DATA FILES';

            % Create BrowseforFolderButton
            app.BrowseforFolderButton = uibutton(app.SetUpPanel, 'push');
            app.BrowseforFolderButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseforFolderButtonPushed, true);
            app.BrowseforFolderButton.BackgroundColor = [0.9412 0.9412 0.9412];
            app.BrowseforFolderButton.FontSize = 14;
            app.BrowseforFolderButton.FontColor = [0.149 0.149 0.149];
            app.BrowseforFolderButton.Position = [83 35 126 25];
            app.BrowseforFolderButton.Text = 'Browse for Folder';

            % Create PathingSettingsLabel
            app.PathingSettingsLabel = uilabel(app.SetUpPanel);
            app.PathingSettingsLabel.FontSize = 15;
            app.PathingSettingsLabel.FontWeight = 'bold';
            app.PathingSettingsLabel.FontColor = [1 1 1];
            app.PathingSettingsLabel.Position = [20 125 124 22];
            app.PathingSettingsLabel.Text = 'Pathing Settings';

            % Create LoadDataButton
            app.LoadDataButton = uibutton(app.SetUpPanel, 'push');
            app.LoadDataButton.ButtonPushedFcn = createCallbackFcn(app, @LoadDataButtonPushed, true);
            app.LoadDataButton.BackgroundColor = [0.9412 0.9412 0.9412];
            app.LoadDataButton.FontSize = 14;
            app.LoadDataButton.FontColor = [0.149 0.149 0.149];
            app.LoadDataButton.Position = [694 35 82 29];
            app.LoadDataButton.Text = 'Load Data';

            % Create BrowseforFileButton
            app.BrowseforFileButton = uibutton(app.SetUpPanel, 'push');
            app.BrowseforFileButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseforFileButtonPushed, true);
            app.BrowseforFileButton.FontSize = 14;
            app.BrowseforFileButton.Position = [224 35 126 25];
            app.BrowseforFileButton.Text = 'Browse for File';

            % Create NewLoadButton
            app.NewLoadButton = uibutton(app.SetUpPanel, 'state');
            app.NewLoadButton.ValueChangedFcn = createCallbackFcn(app, @NewLoadButtonValueChanged, true);
            app.NewLoadButton.Text = 'New Load';
            app.NewLoadButton.FontSize = 14;
            app.NewLoadButton.Position = [408 35 100 25];

            % Create Panel
            app.Panel = uipanel(app.OpenDatasetTab);
            app.Panel.BackgroundColor = [0.8 0.8 0.8];
            app.Panel.Position = [244 24 685 473];

            % Create ViewDropDown
            app.ViewDropDown = uidropdown(app.Panel);
            app.ViewDropDown.Items = {'Mean', '95th Percentile', 'Maximum'};
            app.ViewDropDown.Visible = 'off';
            app.ViewDropDown.Position = [73 15 98 24];
            app.ViewDropDown.Value = 'Mean';

            % Create BackButton
            app.BackButton = uibutton(app.Panel, 'push');
            app.BackButton.ButtonPushedFcn = createCallbackFcn(app, @BackButtonPushed, true);
            app.BackButton.Position = [15 33 53 32];
            app.BackButton.Text = 'Back';

            % Create ViewModeLabel
            app.ViewModeLabel = uilabel(app.Panel);
            app.ViewModeLabel.FontSize = 14;
            app.ViewModeLabel.FontWeight = 'bold';
            app.ViewModeLabel.FontColor = [1 1 1];
            app.ViewModeLabel.Position = [51 425 77 22];
            app.ViewModeLabel.Text = 'View Mode';

            % Create ThresholdLabel
            app.ThresholdLabel = uilabel(app.Panel);
            app.ThresholdLabel.FontSize = 14;
            app.ThresholdLabel.FontWeight = 'bold';
            app.ThresholdLabel.FontColor = [1 1 1];
            app.ThresholdLabel.Visible = 'off';
            app.ThresholdLabel.Position = [87 44 73 22];
            app.ThresholdLabel.Text = 'Threshold';

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.Panel);
            app.ButtonGroup_2.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroup_2SelectionChanged, true);
            app.ButtonGroup_2.BorderType = 'none';
            app.ButtonGroup_2.ButtonDownFcn = createCallbackFcn(app, @ButtonGroup_2SelectionChanged, true);
            app.ButtonGroup_2.Position = [32 301 123 125];

            % Create ViewButton
            app.ViewButton = uitogglebutton(app.ButtonGroup_2);
            app.ViewButton.Text = 'View';
            app.ViewButton.BackgroundColor = [0.8 0.8 0.8];
            app.ViewButton.FontColor = [1 1 1];
            app.ViewButton.Position = [11 97 100 23];
            app.ViewButton.Value = true;

            % Create HistogramButton
            app.HistogramButton = uitogglebutton(app.ButtonGroup_2);
            app.HistogramButton.Visible = 'off';
            app.HistogramButton.Text = 'Histogram';
            app.HistogramButton.BackgroundColor = [0.8 0.8 0.8];
            app.HistogramButton.FontColor = [1 1 1];
            app.HistogramButton.Position = [11 16 100 23];

            % Create CropButton_2
            app.CropButton_2 = uitogglebutton(app.ButtonGroup_2);
            app.CropButton_2.Text = 'Crop';
            app.CropButton_2.BackgroundColor = [0.651 0.651 0.651];
            app.CropButton_2.FontColor = [1 1 1];
            app.CropButton_2.Position = [11 70 100 23];

            % Create ProjectionButton
            app.ProjectionButton = uitogglebutton(app.ButtonGroup_2);
            app.ProjectionButton.Text = 'Projection';
            app.ProjectionButton.BackgroundColor = [0.651 0.651 0.651];
            app.ProjectionButton.FontColor = [1 1 1];
            app.ProjectionButton.Position = [11 44 100 23];

            % Create Panel_2
            app.Panel_2 = uipanel(app.Panel);
            app.Panel_2.BorderType = 'none';
            app.Panel_2.Visible = 'off';
            app.Panel_2.BackgroundColor = [0.8 0.8 0.8];
            app.Panel_2.Position = [181 9 497 456];

            % Create UIAxes
            app.UIAxes = uiaxes(app.Panel_2);
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.Position = [1 57 495 400];

            % Create Slider
            app.Slider = uislider(app.Panel_2);
            app.Slider.MajorTicks = [];
            app.Slider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanging, true);
            app.Slider.MinorTicks = [];
            app.Slider.Position = [23 22 241 3];

            % Create Label_2
            app.Label_2 = uilabel(app.Panel_2);
            app.Label_2.FontColor = [1 1 1];
            app.Label_2.Position = [276 12 117 22];
            app.Label_2.Text = '1/800000';

            % Create Button_2
            app.Button_2 = uibutton(app.Panel_2, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.BackgroundColor = [0.9608 0.9608 0.9608];
            app.Button_2.Position = [399 12 36 23];
            app.Button_2.Text = '<';

            % Create Button
            app.Button = uibutton(app.Panel_2, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button.BackgroundColor = [1 1 1];
            app.Button.Position = [442 12 36 23];
            app.Button.Text = '>';

            % Create Label3
            app.Label3 = uilabel(app.Panel);
            app.Label3.WordWrap = 'on';
            app.Label3.FontAngle = 'italic';
            app.Label3.FontColor = [1 1 1];
            app.Label3.Visible = 'off';
            app.Label3.Position = [32 87 137 70];
            app.Label3.Text = 'Note: Crop automatically performs an average projection for optimized cropping selection.';

            % Create ToCropRightClickCropImageLabel
            app.ToCropRightClickCropImageLabel = uilabel(app.Panel);
            app.ToCropRightClickCropImageLabel.HorizontalAlignment = 'center';
            app.ToCropRightClickCropImageLabel.FontSize = 13;
            app.ToCropRightClickCropImageLabel.FontColor = [1 1 1];
            app.ToCropRightClickCropImageLabel.Visible = 'off';
            app.ToCropRightClickCropImageLabel.Position = [21 255 155 32];
            app.ToCropRightClickCropImageLabel.Text = {'To Crop:'; 'Right-Click -> Crop Image'};

            % Create GraFTTab
            app.GraFTTab = uitab(app.TabGroup);
            app.GraFTTab.Title = 'GraFT';
            app.GraFTTab.BackgroundColor = [1 1 1];

            % Create MainParametersPanel
            app.MainParametersPanel = uipanel(app.GraFTTab);
            app.MainParametersPanel.ForegroundColor = [0.0706 0.6196 1];
            app.MainParametersPanel.BorderType = 'none';
            app.MainParametersPanel.Title = 'Main Parameters';
            app.MainParametersPanel.BackgroundColor = [0.8 0.8 0.8];
            app.MainParametersPanel.FontWeight = 'bold';
            app.MainParametersPanel.FontSize = 14;
            app.MainParametersPanel.Position = [34 358 765 362];

            % Create SaveCurrentParametersLabel
            app.SaveCurrentParametersLabel = uilabel(app.MainParametersPanel);
            app.SaveCurrentParametersLabel.FontColor = [1 1 1];
            app.SaveCurrentParametersLabel.Position = [237 52 141 22];
            app.SaveCurrentParametersLabel.Text = 'Save Current Parameters';

            % Create Label2_6
            app.Label2_6 = uilabel(app.MainParametersPanel);
            app.Label2_6.WordWrap = 'on';
            app.Label2_6.FontColor = [1 1 1];
            app.Label2_6.Position = [341 140 193 29];
            app.Label2_6.Text = 'Breaks up the image into squares with patchSize pixels on each side.';

            % Create Label2_5
            app.Label2_5 = uilabel(app.MainParametersPanel);
            app.Label2_5.WordWrap = 'on';
            app.Label2_5.FontSize = 10;
            app.Label2_5.FontAngle = 'italic';
            app.Label2_5.FontColor = [1 1 1];
            app.Label2_5.Position = [298 199 272 22];
            app.Label2_5.Text = 'Note: the final number of coefficients may be less than this due to lack of data variance and merging of components.';

            % Create LambdaEditField_2Label
            app.LambdaEditField_2Label = uilabel(app.MainParametersPanel);
            app.LambdaEditField_2Label.HorizontalAlignment = 'right';
            app.LambdaEditField_2Label.FontColor = [1 1 1];
            app.LambdaEditField_2Label.Position = [44 310 49 22];
            app.LambdaEditField_2Label.Text = 'Lambda';

            % Create LamCorrEditField_2Label
            app.LamCorrEditField_2Label = uilabel(app.MainParametersPanel);
            app.LamCorrEditField_2Label.HorizontalAlignment = 'right';
            app.LamCorrEditField_2Label.FontColor = [1 1 1];
            app.LamCorrEditField_2Label.Position = [40 240 54 22];
            app.LamCorrEditField_2Label.Text = 'LamCorr';

            % Create NumberofComponentsEditField_2Label
            app.NumberofComponentsEditField_2Label = uilabel(app.MainParametersPanel);
            app.NumberofComponentsEditField_2Label.HorizontalAlignment = 'right';
            app.NumberofComponentsEditField_2Label.WordWrap = 'on';
            app.NumberofComponentsEditField_2Label.FontColor = [1 1 1];
            app.NumberofComponentsEditField_2Label.Position = [21 193 75 35];
            app.NumberofComponentsEditField_2Label.Text = 'Number of Components';

            % Create PatchSizeEditField_2Label
            app.PatchSizeEditField_2Label = uilabel(app.MainParametersPanel);
            app.PatchSizeEditField_2Label.HorizontalAlignment = 'right';
            app.PatchSizeEditField_2Label.FontColor = [1 1 1];
            app.PatchSizeEditField_2Label.Position = [149 144 63 22];
            app.PatchSizeEditField_2Label.Text = 'Patch Size';

            % Create LamForbEditField_2Label
            app.LamForbEditField_2Label = uilabel(app.MainParametersPanel);
            app.LamForbEditField_2Label.HorizontalAlignment = 'right';
            app.LamForbEditField_2Label.FontColor = [1 1 1];
            app.LamForbEditField_2Label.Position = [40 276 54 22];
            app.LamForbEditField_2Label.Text = 'LamForb';

            % Create PerpatchNoteLabel
            app.PerpatchNoteLabel = uilabel(app.MainParametersPanel);
            app.PerpatchNoteLabel.WordWrap = 'on';
            app.PerpatchNoteLabel.FontColor = [1 1 1];
            app.PerpatchNoteLabel.Position = [224 199 68 22];
            app.PerpatchNoteLabel.Text = 'Per patch';

            % Create PreventoverslycorrelateddictionaryelementsLabel
            app.PreventoverslycorrelateddictionaryelementsLabel = uilabel(app.MainParametersPanel);
            app.PreventoverslycorrelateddictionaryelementsLabel.FontColor = [1 1 1];
            app.PreventoverslycorrelateddictionaryelementsLabel.Position = [224 240 253 22];
            app.PreventoverslycorrelateddictionaryelementsLabel.Text = 'Prevent oversly correlated dictionary elements';

            % Create ExtratimetraceweightLabel
            app.ExtratimetraceweightLabel = uilabel(app.MainParametersPanel);
            app.ExtratimetraceweightLabel.FontColor = [1 1 1];
            app.ExtratimetraceweightLabel.Position = [224 276 128 22];
            app.ExtratimetraceweightLabel.Text = 'Extra time-trace weight';

            % Create SparsityLabel
            app.SparsityLabel = uilabel(app.MainParametersPanel);
            app.SparsityLabel.FontColor = [1 1 1];
            app.SparsityLabel.Position = [224 310 105 22];
            app.SparsityLabel.Text = 'Sparsity';

            % Create SetButton
            app.SetButton = uibutton(app.MainParametersPanel, 'push');
            app.SetButton.ButtonPushedFcn = createCallbackFcn(app, @SetButtonPushed, true);
            app.SetButton.Position = [165 52 52 23];
            app.SetButton.Text = 'Set';

            % Create AdvancedButton
            app.AdvancedButton = uibutton(app.MainParametersPanel, 'push');
            app.AdvancedButton.ButtonPushedFcn = createCallbackFcn(app, @AdvancedButtonPushed, true);
            app.AdvancedButton.Position = [35 18 100 22];
            app.AdvancedButton.Text = 'Advanced';

            % Create DefaultsButton
            app.DefaultsButton = uibutton(app.MainParametersPanel, 'state');
            app.DefaultsButton.ValueChangedFcn = createCallbackFcn(app, @DefaultsButtonValueChanged, true);
            app.DefaultsButton.Text = 'Defaults';
            app.DefaultsButton.Position = [35 52 100 23];

            % Create PlotCheckBox
            app.PlotCheckBox = uicheckbox(app.MainParametersPanel);
            app.PlotCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.PlotCheckBox.Text = 'Plot';
            app.PlotCheckBox.FontColor = [1 1 1];
            app.PlotCheckBox.Position = [34 106 43 22];
            app.PlotCheckBox.Value = true;

            % Create PatchSizeEditField_2
            app.PatchSizeEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.PatchSizeEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.PatchSizeEditField_2.Position = [223 144 100 22];
            app.PatchSizeEditField_2.Value = 50;

            % Create UsePatchCheckBox_2
            app.UsePatchCheckBox_2 = uicheckbox(app.MainParametersPanel);
            app.UsePatchCheckBox_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.UsePatchCheckBox_2.Text = 'Use Patch';
            app.UsePatchCheckBox_2.FontColor = [1 1 1];
            app.UsePatchCheckBox_2.Position = [34 144 109 22];
            app.UsePatchCheckBox_2.Value = true;

            % Create NumberofComponentsEditField_2
            app.NumberofComponentsEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.NumberofComponentsEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.NumberofComponentsEditField_2.Position = [105 199 100 22];
            app.NumberofComponentsEditField_2.Value = 5;

            % Create LamCorrEditField_2
            app.LamCorrEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.LamCorrEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LamCorrEditField_2.Position = [105 240 100 22];
            app.LamCorrEditField_2.Value = 0.1;

            % Create LamForbEditField_2
            app.LamForbEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.LamForbEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LamForbEditField_2.Position = [105 276 99 22];
            app.LamForbEditField_2.Value = 0.2;

            % Create LambdaEditField_2
            app.LambdaEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.LambdaEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LambdaEditField_2.Position = [105 310 100 22];
            app.LambdaEditField_2.Value = 0.05;

            % Create RunGraFTButton
            app.RunGraFTButton = uibutton(app.MainParametersPanel, 'push');
            app.RunGraFTButton.ButtonPushedFcn = createCallbackFcn(app, @RunGraFTButtonPushed, true);
            app.RunGraFTButton.Enable = 'off';
            app.RunGraFTButton.Position = [620 25 92 42];
            app.RunGraFTButton.Text = 'Run GraFT';

            % Create ResultsButton
            app.ResultsButton = uibutton(app.MainParametersPanel, 'push');
            app.ResultsButton.ButtonPushedFcn = createCallbackFcn(app, @ResultsButtonPushed, true);
            app.ResultsButton.Visible = 'off';
            app.ResultsButton.Position = [620 74 90 23];
            app.ResultsButton.Text = 'Results';

            % Create PlottingperpatchdisabledLabel
            app.PlottingperpatchdisabledLabel = uilabel(app.MainParametersPanel);
            app.PlottingperpatchdisabledLabel.FontColor = [1 1 1];
            app.PlottingperpatchdisabledLabel.Position = [90 106 154 22];
            app.PlottingperpatchdisabledLabel.Text = '(Plotting per patch disabled)';

            % Create AdvancedOptionsPanel
            app.AdvancedOptionsPanel = uipanel(app.GraFTTab);
            app.AdvancedOptionsPanel.ForegroundColor = [0.0706 0.6196 1];
            app.AdvancedOptionsPanel.BorderType = 'none';
            app.AdvancedOptionsPanel.Title = 'Advanced Options';
            app.AdvancedOptionsPanel.Visible = 'off';
            app.AdvancedOptionsPanel.BackgroundColor = [0.651 0.651 0.651];
            app.AdvancedOptionsPanel.FontWeight = 'bold';
            app.AdvancedOptionsPanel.FontSize = 14;
            app.AdvancedOptionsPanel.Position = [36 17 884 335];

            % Create ContinuityTermEditFieldLabel
            app.ContinuityTermEditFieldLabel = uilabel(app.AdvancedOptionsPanel);
            app.ContinuityTermEditFieldLabel.HorizontalAlignment = 'right';
            app.ContinuityTermEditFieldLabel.FontColor = [1 1 1];
            app.ContinuityTermEditFieldLabel.Position = [24 276 88 22];
            app.ContinuityTermEditFieldLabel.Text = 'Continuity Term';

            % Create LevelofverboseoutputLabel
            app.LevelofverboseoutputLabel = uilabel(app.AdvancedOptionsPanel);
            app.LevelofverboseoutputLabel.FontColor = [1 1 1];
            app.LevelofverboseoutputLabel.Position = [268 179 130 22];
            app.LevelofverboseoutputLabel.Text = 'Level of verbose output';

            % Create DecayrateofthecontinuationparameterLabel
            app.DecayrateofthecontinuationparameterLabel = uilabel(app.AdvancedOptionsPanel);
            app.DecayrateofthecontinuationparameterLabel.FontColor = [1 1 1];
            app.DecayrateofthecontinuationparameterLabel.Position = [268 212 224 22];
            app.DecayrateofthecontinuationparameterLabel.Text = 'Decay rate of the continuation parameter';

            % Create InitializecorrelationkernelstructureLabel
            app.InitializecorrelationkernelstructureLabel = uilabel(app.AdvancedOptionsPanel);
            app.InitializecorrelationkernelstructureLabel.FontColor = [1 1 1];
            app.InitializecorrelationkernelstructureLabel.Position = [267 100 195 22];
            app.InitializecorrelationkernelstructureLabel.Text = 'Initialize correlation kernel structure';

            % Create SpatialSmoothingKernelLabel
            app.SpatialSmoothingKernelLabel = uilabel(app.AdvancedOptionsPanel);
            app.SpatialSmoothingKernelLabel.FontWeight = 'bold';
            app.SpatialSmoothingKernelLabel.FontColor = [1 1 1];
            app.SpatialSmoothingKernelLabel.Position = [31 131 151 22];
            app.SpatialSmoothingKernelLabel.Text = 'Spatial Smoothing Kernel';

            % Create GradientTypeDropDownLabel
            app.GradientTypeDropDownLabel = uilabel(app.AdvancedOptionsPanel);
            app.GradientTypeDropDownLabel.HorizontalAlignment = 'right';
            app.GradientTypeDropDownLabel.FontColor = [1 1 1];
            app.GradientTypeDropDownLabel.Position = [32 243 80 22];
            app.GradientTypeDropDownLabel.Text = 'Gradient Type';

            % Create ContDecayEditFieldLabel
            app.ContDecayEditFieldLabel = uilabel(app.AdvancedOptionsPanel);
            app.ContDecayEditFieldLabel.HorizontalAlignment = 'right';
            app.ContDecayEditFieldLabel.FontColor = [1 1 1];
            app.ContDecayEditFieldLabel.Position = [41 212 71 22];
            app.ContDecayEditFieldLabel.Text = 'Cont. Decay';

            % Create VerboseSpinnerLabel
            app.VerboseSpinnerLabel = uilabel(app.AdvancedOptionsPanel);
            app.VerboseSpinnerLabel.HorizontalAlignment = 'right';
            app.VerboseSpinnerLabel.FontColor = [1 1 1];
            app.VerboseSpinnerLabel.Position = [62 179 50 22];
            app.VerboseSpinnerLabel.Text = 'Verbose';

            % Create CorrelationTypeDropDownLabel
            app.CorrelationTypeDropDownLabel = uilabel(app.AdvancedOptionsPanel);
            app.CorrelationTypeDropDownLabel.HorizontalAlignment = 'right';
            app.CorrelationTypeDropDownLabel.FontColor = [1 1 1];
            app.CorrelationTypeDropDownLabel.Position = [62 62 93 22];
            app.CorrelationTypeDropDownLabel.Text = 'Correlation Type';

            % Create ControlhowmuchtoweighthepreviousestimateLabel
            app.ControlhowmuchtoweighthepreviousestimateLabel = uilabel(app.AdvancedOptionsPanel);
            app.ControlhowmuchtoweighthepreviousestimateLabel.FontColor = [1 1 1];
            app.ControlhowmuchtoweighthepreviousestimateLabel.Position = [268 276 270 22];
            app.ControlhowmuchtoweighthepreviousestimateLabel.Text = 'Control how much to weigh the previous estimate';

            % Create TypeofdictionaryupdateLabel
            app.TypeofdictionaryupdateLabel = uilabel(app.AdvancedOptionsPanel);
            app.TypeofdictionaryupdateLabel.FontColor = [1 1 1];
            app.TypeofdictionaryupdateLabel.Position = [267 243 139 22];
            app.TypeofdictionaryupdateLabel.Text = 'Type of dictionary update';

            % Create CorrelationTypeDropDown
            app.CorrelationTypeDropDown = uidropdown(app.AdvancedOptionsPanel);
            app.CorrelationTypeDropDown.Items = {'embedding', 'convolution'};
            app.CorrelationTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.CorrelationTypeDropDown.Position = [170 62 108 22];
            app.CorrelationTypeDropDown.Value = 'embedding';

            % Create W_timeEditField
            app.W_timeEditField = uieditfield(app.AdvancedOptionsPanel, 'numeric');
            app.W_timeEditField.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.W_timeEditField.Position = [131 100 100 22];

            % Create LikelyFormDropDownLabel
            app.LikelyFormDropDownLabel = uilabel(app.AdvancedOptionsPanel);
            app.LikelyFormDropDownLabel.HorizontalAlignment = 'right';
            app.LikelyFormDropDownLabel.FontColor = [1 1 1];
            app.LikelyFormDropDownLabel.Enable = 'off';
            app.LikelyFormDropDownLabel.Position = [592 276 67 22];
            app.LikelyFormDropDownLabel.Text = 'Likely Form';

            % Create LikelyFormDropDown
            app.LikelyFormDropDown = uidropdown(app.AdvancedOptionsPanel);
            app.LikelyFormDropDown.Items = {'gaussian', 'poisson'};
            app.LikelyFormDropDown.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LikelyFormDropDown.Enable = 'off';
            app.LikelyFormDropDown.Position = [674 276 100 22];
            app.LikelyFormDropDown.Value = 'gaussian';

            % Create ReduceDimCheckBox
            app.ReduceDimCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.ReduceDimCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.ReduceDimCheckBox.Enable = 'off';
            app.ReduceDimCheckBox.Text = 'Reduce Dim';
            app.ReduceDimCheckBox.FontColor = [1 1 1];
            app.ReduceDimCheckBox.Position = [543 100 88 22];
            app.ReduceDimCheckBox.Value = true;

            % Create CreateMemmapCheckBox
            app.CreateMemmapCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.CreateMemmapCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.CreateMemmapCheckBox.Enable = 'off';
            app.CreateMemmapCheckBox.Text = 'Create Memmap';
            app.CreateMemmapCheckBox.FontColor = [1 1 1];
            app.CreateMemmapCheckBox.Position = [597 243 111 22];

            % Create NormalizeSpatialCheckBox
            app.NormalizeSpatialCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.NormalizeSpatialCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.NormalizeSpatialCheckBox.Enable = 'off';
            app.NormalizeSpatialCheckBox.Text = 'Normalize Spatial';
            app.NormalizeSpatialCheckBox.FontColor = [1 1 1];
            app.NormalizeSpatialCheckBox.Position = [597 212 116 22];
            app.NormalizeSpatialCheckBox.Value = true;

            % Create VerboseSpinner
            app.VerboseSpinner = uispinner(app.AdvancedOptionsPanel);
            app.VerboseSpinner.Limits = [0 10];
            app.VerboseSpinner.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.VerboseSpinner.Position = [127 179 100 22];

            % Create ContDecayEditField
            app.ContDecayEditField = uieditfield(app.AdvancedOptionsPanel, 'numeric');
            app.ContDecayEditField.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.ContDecayEditField.Position = [127 212 100 22];
            app.ContDecayEditField.Value = 0.9;

            % Create GradientTypeDropDown
            app.GradientTypeDropDown = uidropdown(app.AdvancedOptionsPanel);
            app.GradientTypeDropDown.Items = {'Full Optimization', 'Norm'};
            app.GradientTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.GradientTypeDropDown.Position = [127 243 122 22];
            app.GradientTypeDropDown.Value = 'Full Optimization';

            % Create ContinuityTermEditField
            app.ContinuityTermEditField = uieditfield(app.AdvancedOptionsPanel, 'numeric');
            app.ContinuityTermEditField.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.ContinuityTermEditField.Position = [127 276 100 22];
            app.ContinuityTermEditField.Value = 0.1;

            % Create W_timeEditFieldLabel
            app.W_timeEditFieldLabel = uilabel(app.AdvancedOptionsPanel);
            app.W_timeEditFieldLabel.HorizontalAlignment = 'right';
            app.W_timeEditFieldLabel.FontColor = [1 1 1];
            app.W_timeEditFieldLabel.Position = [70 100 46 22];
            app.W_timeEditFieldLabel.Text = 'W_time';

            % Create NormalizeTemporalCheckBox
            app.NormalizeTemporalCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.NormalizeTemporalCheckBox.Enable = 'off';
            app.NormalizeTemporalCheckBox.Text = 'Normalize Temporal';
            app.NormalizeTemporalCheckBox.FontColor = [1 1 1];
            app.NormalizeTemporalCheckBox.Position = [740 212 128 22];

            % Create Panel_4
            app.Panel_4 = uipanel(app.GraFTTab);
            app.Panel_4.ForegroundColor = [0.0706 0.6196 1];
            app.Panel_4.BorderType = 'none';
            app.Panel_4.BackgroundColor = [0.651 0.651 0.651];
            app.Panel_4.FontWeight = 'bold';
            app.Panel_4.FontSize = 14;
            app.Panel_4.Position = [9 18 922 720];

            % Create BackButton_2
            app.BackButton_2 = uibutton(app.Panel_4, 'push');
            app.BackButton_2.ButtonPushedFcn = createCallbackFcn(app, @BackButton_2Pushed, true);
            app.BackButton_2.Position = [25 46 77 38];
            app.BackButton_2.Text = 'Back';

            % Create AppStatusPanel_2
            app.AppStatusPanel_2 = uipanel(app.Panel_4);
            app.AppStatusPanel_2.ForegroundColor = [0.0706 0.6196 1];
            app.AppStatusPanel_2.BorderType = 'none';
            app.AppStatusPanel_2.Title = 'App Status';
            app.AppStatusPanel_2.BackgroundColor = [0.8 0.8 0.8];
            app.AppStatusPanel_2.FontWeight = 'bold';
            app.AppStatusPanel_2.FontSize = 14;
            app.AppStatusPanel_2.Position = [14 117 375 587];

            % Create OutputhereLabel
            app.OutputhereLabel = uilabel(app.AppStatusPanel_2);
            app.OutputhereLabel.VerticalAlignment = 'top';
            app.OutputhereLabel.WordWrap = 'on';
            app.OutputhereLabel.FontColor = [1 1 1];
            app.OutputhereLabel.Position = [8 23 359 524];
            app.OutputhereLabel.Text = 'Output here';

            % Create SavePanel
            app.SavePanel = uipanel(app.Panel_4);
            app.SavePanel.ForegroundColor = [0.0706 0.6196 1];
            app.SavePanel.BorderType = 'none';
            app.SavePanel.Title = 'Save';
            app.SavePanel.BackgroundColor = [0.8 0.8 0.8];
            app.SavePanel.FontWeight = 'bold';
            app.SavePanel.FontSize = 14;
            app.SavePanel.Position = [393 117 526 587];

            % Create SaveButton
            app.SaveButton = uibutton(app.SavePanel, 'push');
            app.SaveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveButton.Position = [404 91 85 23];
            app.SaveButton.Text = 'Save';

            % Create ChangeButton
            app.ChangeButton = uibutton(app.SavePanel, 'push');
            app.ChangeButton.ButtonPushedFcn = createCallbackFcn(app, @ChangeButtonPushed, true);
            app.ChangeButton.Position = [389 487 100 23];
            app.ChangeButton.Text = 'Change';

            % Create KeeporiginaldataFsimCheckBox
            app.KeeporiginaldataFsimCheckBox = uicheckbox(app.SavePanel);
            app.KeeporiginaldataFsimCheckBox.Text = 'Keep original data (Fsim)';
            app.KeeporiginaldataFsimCheckBox.FontColor = [1 1 1];
            app.KeeporiginaldataFsimCheckBox.Position = [9 171 156 22];

            % Create DataPropertiesLabel
            app.DataPropertiesLabel = uilabel(app.SavePanel);
            app.DataPropertiesLabel.FontWeight = 'bold';
            app.DataPropertiesLabel.FontColor = [1 1 1];
            app.DataPropertiesLabel.Position = [6 447 98 22];
            app.DataPropertiesLabel.Text = 'Data Properties:';

            % Create CurrentDirectoryLabel
            app.CurrentDirectoryLabel = uilabel(app.SavePanel);
            app.CurrentDirectoryLabel.FontColor = [1 1 1];
            app.CurrentDirectoryLabel.Position = [12 517 100 22];
            app.CurrentDirectoryLabel.Text = 'Current Directory:';

            % Create Label_7
            app.Label_7 = uilabel(app.SavePanel);
            app.Label_7.FontColor = [1 1 1];
            app.Label_7.Position = [112 517 389 22];

            % Create SaveNameLabel
            app.SaveNameLabel = uilabel(app.SavePanel);
            app.SaveNameLabel.FontWeight = 'bold';
            app.SaveNameLabel.FontColor = [1 1 1];
            app.SaveNameLabel.Position = [12 133 73 22];
            app.SaveNameLabel.Text = 'Save Name:';

            % Create Label2_7
            app.Label2_7 = uilabel(app.SavePanel);
            app.Label2_7.FontColor = [1 1 1];
            app.Label2_7.Position = [90 133 399 22];
            app.Label2_7.Text = 'Label2';

            % Create FormatDropDownLabel
            app.FormatDropDownLabel = uilabel(app.SavePanel);
            app.FormatDropDownLabel.HorizontalAlignment = 'right';
            app.FormatDropDownLabel.FontColor = [1 1 1];
            app.FormatDropDownLabel.Position = [275 92 43 22];
            app.FormatDropDownLabel.Text = 'Format';

            % Create FormatDropDown
            app.FormatDropDown = uidropdown(app.SavePanel);
            app.FormatDropDown.Items = {'.mat'};
            app.FormatDropDown.Position = [325 92 67 22];
            app.FormatDropDown.Value = '.mat';

            % Create Panel_5
            app.Panel_5 = uipanel(app.SavePanel);
            app.Panel_5.BackgroundColor = [0.502 0.502 0.502];
            app.Panel_5.Position = [10 211 490 221];

            % Create Label_6
            app.Label_6 = uilabel(app.Panel_5);
            app.Label_6.VerticalAlignment = 'top';
            app.Label_6.WordWrap = 'on';
            app.Label_6.FontColor = [1 1 1];
            app.Label_6.Position = [13 15 465 196];
            app.Label_6.Text = '';

            % Create SeeResultsButton
            app.SeeResultsButton = uibutton(app.SavePanel, 'push');
            app.SeeResultsButton.ButtonPushedFcn = createCallbackFcn(app, @SeeResultsButtonPushed, true);
            app.SeeResultsButton.Position = [47 35 100 33];
            app.SeeResultsButton.Text = 'See Results';

            % Create ResultsTab
            app.ResultsTab = uitab(app.TabGroup);
            app.ResultsTab.Title = 'Results';

            % Create Panel_7
            app.Panel_7 = uipanel(app.ResultsTab);
            app.Panel_7.BorderType = 'none';
            app.Panel_7.BackgroundColor = [0.8 0.8 0.8];
            app.Panel_7.Position = [5 10 924 422];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.Panel_7);
            app.UIAxes2.XTick = [];
            app.UIAxes2.YTick = [];
            app.UIAxes2.ZTick = [];
            app.UIAxes2.Position = [5 30 455 385];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.Panel_7);
            app.UIAxes3.XTick = [];
            app.UIAxes3.YTick = [];
            app.UIAxes3.ZTick = [];
            app.UIAxes3.Position = [459 30 457 391];

            % Create Button_5
            app.Button_5 = uibutton(app.Panel_7, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_5.BackgroundColor = [0.8 0.8 0.8];
            app.Button_5.FontColor = [1 1 1];
            app.Button_5.Position = [484 5 100 23];
            app.Button_5.Text = '>';

            % Create Button_6
            app.Button_6 = uibutton(app.Panel_7, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.BackgroundColor = [0.8 0.8 0.8];
            app.Button_6.FontColor = [1 1 1];
            app.Button_6.Position = [345 5 100 23];
            app.Button_6.Text = '<';

            % Create IM_NUMLabel
            app.IM_NUMLabel = uilabel(app.Panel_7);
            app.IM_NUMLabel.FontColor = [1 1 1];
            app.IM_NUMLabel.Position = [839 5 52 22];
            app.IM_NUMLabel.Text = 'IM_NUM';

            % Create CurrentViewLabel
            app.CurrentViewLabel = uilabel(app.Panel_7);
            app.CurrentViewLabel.FontWeight = 'bold';
            app.CurrentViewLabel.FontColor = [1 1 1];
            app.CurrentViewLabel.Position = [754 5 83 22];
            app.CurrentViewLabel.Text = 'Current View:';

            % Create LoadResultsPanel
            app.LoadResultsPanel = uipanel(app.ResultsTab);
            app.LoadResultsPanel.ForegroundColor = [0.0745 0.6235 1];
            app.LoadResultsPanel.BorderType = 'none';
            app.LoadResultsPanel.Title = 'Load Results';
            app.LoadResultsPanel.BackgroundColor = [0.8 0.8 0.8];
            app.LoadResultsPanel.FontWeight = 'bold';
            app.LoadResultsPanel.FontSize = 14;
            app.LoadResultsPanel.Position = [9 443 918 278];

            % Create DetectButton
            app.DetectButton = uibutton(app.LoadResultsPanel, 'push');
            app.DetectButton.ButtonPushedFcn = createCallbackFcn(app, @DetectButtonPushed, true);
            app.DetectButton.BackgroundColor = [0.502 0.502 0.502];
            app.DetectButton.FontColor = [1 1 1];
            app.DetectButton.Position = [310 175 100 23];
            app.DetectButton.Text = 'Detect';

            % Create LoadButton
            app.LoadButton = uibutton(app.LoadResultsPanel, 'push');
            app.LoadButton.ButtonPushedFcn = createCallbackFcn(app, @LoadButtonPushed, true);
            app.LoadButton.BackgroundColor = [0.502 0.502 0.502];
            app.LoadButton.FontColor = [1 1 1];
            app.LoadButton.Position = [310 138 100 23];
            app.LoadButton.Text = 'Load';

            % Create Label_8
            app.Label_8 = uilabel(app.LoadResultsPanel);
            app.Label_8.BackgroundColor = [0.651 0.651 0.651];
            app.Label_8.VerticalAlignment = 'top';
            app.Label_8.WordWrap = 'on';
            app.Label_8.FontColor = [1 1 1];
            app.Label_8.Position = [439 7 465 196];
            app.Label_8.Text = '';

            % Create CurrentDirectoryLabel_2
            app.CurrentDirectoryLabel_2 = uilabel(app.LoadResultsPanel);
            app.CurrentDirectoryLabel_2.FontColor = [1 1 1];
            app.CurrentDirectoryLabel_2.Position = [54 217 97 22];
            app.CurrentDirectoryLabel_2.Text = 'Current Directory:';

            % Create Label_9
            app.Label_9 = uilabel(app.LoadResultsPanel);
            app.Label_9.FontColor = [1 1 1];
            app.Label_9.Position = [158 217 482 22];

            % Create ChangeButton_2
            app.ChangeButton_2 = uibutton(app.LoadResultsPanel, 'push');
            app.ChangeButton_2.ButtonPushedFcn = createCallbackFcn(app, @ChangeButtonPushed, true);
            app.ChangeButton_2.BackgroundColor = [0.502 0.502 0.502];
            app.ChangeButton_2.FontColor = [1 1 1];
            app.ChangeButton_2.Position = [56 191 99 23];
            app.ChangeButton_2.Text = 'Change';

            % Create ViewButton_2
            app.ViewButton_2 = uibutton(app.LoadResultsPanel, 'push');
            app.ViewButton_2.ButtonPushedFcn = createCallbackFcn(app, @ViewButton_2Pushed, true);
            app.ViewButton_2.BackgroundColor = [0.502 0.502 0.502];
            app.ViewButton_2.FontColor = [1 1 1];
            app.ViewButton_2.Position = [310 7 100 40];
            app.ViewButton_2.Text = 'View';

            % Create GraFTanalysisLabel_2
            app.GraFTanalysisLabel_2 = uilabel(app.UIFigure);
            app.GraFTanalysisLabel_2.HorizontalAlignment = 'center';
            app.GraFTanalysisLabel_2.FontSize = 30;
            app.GraFTanalysisLabel_2.FontWeight = 'bold';
            app.GraFTanalysisLabel_2.Position = [390 923 221 39];
            app.GraFTanalysisLabel_2.Text = 'GraFT-analysis';

            % Create Label2_4
            app.Label2_4 = uilabel(app.UIFigure);
            app.Label2_4.FontSize = 14;
            app.Label2_4.Position = [37 857 957 54];
            app.Label2_4.Text = {'GraFT is a signal extraction method for spatio-temporal data. It uses a diffusion map to learn a graph over spatial pixels that enables for stochastic '; 'filtering of learned sparse representations over each pixel''s time-trace. The sparse representaions are modeled as in a heirarchical dictionary learning '; 'framework with correlated decompositions over the graph.'};

            % Create Label2_3
            app.Label2_3 = uilabel(app.UIFigure);
            app.Label2_3.Position = [66 21 855 30];
            app.Label2_3.Text = {'The details of GraFT are described in:'; 'A.S. Charles, N. Cermak, R. Affan, B. Scott, J. Schiller & G. Mishne. GraFT: Graph Filtered Temporal Dictionary Learning for Functional Neural Imaging.'};

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GraFT_app_01_dev

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end