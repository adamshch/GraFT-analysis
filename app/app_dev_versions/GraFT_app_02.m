classdef GraFT_app_02 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        Label2_3                       matlab.ui.control.Label
        GraFTanalysisLabel_2           matlab.ui.control.Label
        TabGroup                       matlab.ui.container.TabGroup
        OpenDatasetTab                 matlab.ui.container.Tab
        Panel                          matlab.ui.container.Panel
        InteractivecontrasttoolviewingonlyLabel  matlab.ui.control.Label
        MeanimagestackprojectionLabel  matlab.ui.control.Label
        InteractiveselectionofareatocropLabel  matlab.ui.control.Label
        RawdataimagebyimageLabel       matlab.ui.control.Label
        Panel_9                        matlab.ui.container.Panel
        CropSettingsLabel              matlab.ui.control.Label
        applytoallimagescannotcancelLabel  matlab.ui.control.Label
        resetcropeditLabel             matlab.ui.control.Label
        FreeHandLabel                  matlab.ui.control.Label
        SquareRegionLabel              matlab.ui.control.Label
        ApplyButton                    matlab.ui.control.Button
        CancelButton                   matlab.ui.control.Button
        CreateMaskButton               matlab.ui.control.Button
        SelectAreaButton               matlab.ui.control.StateButton
        Label3                         matlab.ui.control.Label
        Panel_8                        matlab.ui.container.Panel
        ThisisonlyforviewingpurposesLabel  matlab.ui.control.Label
        ViewpixelhistogramandadjustcontrastLabel  matlab.ui.control.Label
        ApplytoAllButton               matlab.ui.control.Button
        LaunchButton                   matlab.ui.control.Button
        HistogramToolLabel             matlab.ui.control.Label
        Panel_2                        matlab.ui.container.Panel
        Button                         matlab.ui.control.Button
        Button_2                       matlab.ui.control.Button
        Label_2                        matlab.ui.control.Label
        Slider                         matlab.ui.control.Slider
        UIAxes                         matlab.ui.control.UIAxes
        ButtonGroup_2                  matlab.ui.container.ButtonGroup
        ProjectionButton               matlab.ui.control.ToggleButton
        CropButton_2                   matlab.ui.control.ToggleButton
        HistogramButton                matlab.ui.control.ToggleButton
        ViewButton                     matlab.ui.control.ToggleButton
        ThresholdLabel                 matlab.ui.control.Label
        ViewModeLabel                  matlab.ui.control.Label
        BackButton                     matlab.ui.control.Button
        ViewDropDown                   matlab.ui.control.DropDown
        OptionsPanel                   matlab.ui.container.Panel
        NoCropSelectedLabel            matlab.ui.control.Label
        ButtonGroup                    matlab.ui.container.ButtonGroup
        NoneButton                     matlab.ui.control.RadioButton
        NormcorreButton                matlab.ui.control.RadioButton
        AverageButton                  matlab.ui.control.RadioButton
        DropDown                       matlab.ui.control.DropDown
        DataDenoisingLabel             matlab.ui.control.Label
        SelectButton_3                 matlab.ui.control.Button
        ImageEditingLabel              matlab.ui.control.Label
        MotionCorrectionLabel          matlab.ui.control.Label
        DenoiseButton                  matlab.ui.control.Button
        DataLoadingPanel               matlab.ui.container.Panel
        MultiSelectCtrlClickLabel      matlab.ui.control.Label
        RangeShiftClickLabel           matlab.ui.control.Label
        LoadSelectionButton            matlab.ui.control.Button
        SelectAllButton                matlab.ui.control.Button
        ImagesListBox                  matlab.ui.control.ListBox
        SingleFileSelectionPanel       matlab.ui.container.Panel
        nwbSelectdatalocationPanel     matlab.ui.container.Panel
        LoadedNWBStructureLabel        matlab.ui.control.Label
        SelectButton_2                 matlab.ui.control.StateButton
        NoteOnlyrawdatainacquisionisacceptedLabel  matlab.ui.control.Label
        TextArea                       matlab.ui.control.TextArea
        ListBox                        matlab.ui.control.ListBox
        matSelectdesiredfielddetectedPanel  matlab.ui.container.Panel
        InfoTextArea                   matlab.ui.control.TextArea
        SelectButton                   matlab.ui.control.Button
        SelectdesiredfielddetectedListBox  matlab.ui.control.ListBox
        AppStatusPanel                 matlab.ui.container.Panel
        StatusLamp_2                   matlab.ui.control.Lamp
        textLabel                      matlab.ui.control.Label
        SetUpPanel                     matlab.ui.container.Panel
        ResetAllButton                 matlab.ui.control.StateButton
        NewLoadButton                  matlab.ui.control.StateButton
        BrowseforFileButton            matlab.ui.control.Button
        LoadDataButton                 matlab.ui.control.Button
        PathingSettingsLabel           matlab.ui.control.Label
        BrowseforFolderButton          matlab.ui.control.Button
        DATAFILESLabel                 matlab.ui.control.Label
        currentpathLabel               matlab.ui.control.Label
        GraFTTab                       matlab.ui.container.Tab
        Panel_4                        matlab.ui.container.Panel
        SavePanel                      matlab.ui.container.Panel
        EditField                      matlab.ui.control.EditField
        SeeResultsButton               matlab.ui.control.Button
        Panel_5                        matlab.ui.container.Panel
        Label_6                        matlab.ui.control.Label
        FormatDropDown                 matlab.ui.control.DropDown
        FormatDropDownLabel            matlab.ui.control.Label
        SaveNameLabel                  matlab.ui.control.Label
        Label_7                        matlab.ui.control.Label
        CurrentDirectoryLabel          matlab.ui.control.Label
        DataPropertiesLabel            matlab.ui.control.Label
        KeeporiginaldataFsimCheckBox   matlab.ui.control.CheckBox
        ChangeButton                   matlab.ui.control.Button
        SaveButton                     matlab.ui.control.Button
        AppStatusPanel_2               matlab.ui.container.Panel
        OutputhereLabel                matlab.ui.control.Label
        BackButton_2                   matlab.ui.control.Button
        AdvancedOptionsPanel           matlab.ui.container.Panel
        NormalizeTemporalCheckBox      matlab.ui.control.CheckBox
        W_timeEditFieldLabel           matlab.ui.control.Label
        ContinuityTermEditField        matlab.ui.control.NumericEditField
        GradientTypeDropDown           matlab.ui.control.DropDown
        ContDecayEditField             matlab.ui.control.NumericEditField
        VerboseSpinner                 matlab.ui.control.Spinner
        NormalizeSpatialCheckBox       matlab.ui.control.CheckBox
        CreateMemmapCheckBox           matlab.ui.control.CheckBox
        ReduceDimCheckBox              matlab.ui.control.CheckBox
        LikelyFormDropDown             matlab.ui.control.DropDown
        LikelyFormDropDownLabel        matlab.ui.control.Label
        W_timeEditField                matlab.ui.control.NumericEditField
        CorrelationTypeDropDown        matlab.ui.control.DropDown
        TypeofdictionaryupdateLabel    matlab.ui.control.Label
        ControlhowmuchtoweighthepreviousestimateLabel  matlab.ui.control.Label
        CorrelationTypeDropDownLabel   matlab.ui.control.Label
        VerboseSpinnerLabel            matlab.ui.control.Label
        ContDecayEditFieldLabel        matlab.ui.control.Label
        GradientTypeDropDownLabel      matlab.ui.control.Label
        SpatialSmoothingKernelLabel    matlab.ui.control.Label
        InitializecorrelationkernelstructureLabel  matlab.ui.control.Label
        DecayrateofthecontinuationparameterLabel  matlab.ui.control.Label
        LevelofverboseoutputLabel      matlab.ui.control.Label
        ContinuityTermEditFieldLabel   matlab.ui.control.Label
        MainParametersPanel            matlab.ui.container.Panel
        PlottingperpatchdisabledLabel  matlab.ui.control.Label
        ResultsButton                  matlab.ui.control.Button
        RunGraFTButton                 matlab.ui.control.Button
        LambdaEditField_2              matlab.ui.control.NumericEditField
        LamForbEditField_2             matlab.ui.control.NumericEditField
        LamCorrEditField_2             matlab.ui.control.NumericEditField
        NumberofComponentsEditField_2  matlab.ui.control.NumericEditField
        UsePatchCheckBox_2             matlab.ui.control.CheckBox
        PatchSizeEditField_2           matlab.ui.control.NumericEditField
        PlotCheckBox                   matlab.ui.control.CheckBox
        DefaultsButton                 matlab.ui.control.StateButton
        AdvancedButton                 matlab.ui.control.Button
        SetButton                      matlab.ui.control.Button
        SparsityLabel                  matlab.ui.control.Label
        ExtratimetraceweightLabel      matlab.ui.control.Label
        PreventoverslycorrelateddictionaryelementsLabel  matlab.ui.control.Label
        PerpatchNoteLabel              matlab.ui.control.Label
        LamForbEditField_2Label        matlab.ui.control.Label
        PatchSizeEditField_2Label      matlab.ui.control.Label
        NumberofComponentsEditField_2Label  matlab.ui.control.Label
        LamCorrEditField_2Label        matlab.ui.control.Label
        LambdaEditField_2Label         matlab.ui.control.Label
        Label2_5                       matlab.ui.control.Label
        Label2_6                       matlab.ui.control.Label
        SaveCurrentParametersLabel     matlab.ui.control.Label
        ResultsTab                     matlab.ui.container.Tab
        SaveChangesPanel               matlab.ui.container.Panel
        TextArea_3                     matlab.ui.control.TextArea
        SaveButton_3                   matlab.ui.control.Button
        BackButton_4                   matlab.ui.control.Button
        GraFTResultsCheckBox           matlab.ui.control.CheckBox
        ChangeButton_3                 matlab.ui.control.Button
        Label3_2                       matlab.ui.control.Label
        DirLabel                       matlab.ui.control.Label
        NameEditField                  matlab.ui.control.EditField
        NameEditFieldLabel             matlab.ui.control.Label
        ROIsCheckBox                   matlab.ui.control.CheckBox
        InDepthResultsPanel            matlab.ui.container.Panel
        SaveButton_2                   matlab.ui.control.Button
        BackButton_3                   matlab.ui.control.Button
        Panel_12                       matlab.ui.container.Panel
        UIAxes7                        matlab.ui.control.UIAxes
        CurrentPositionEditField       matlab.ui.control.EditField
        CurrentPositionEditFieldLabel  matlab.ui.control.Label
        TimeTracesButtonGroup          matlab.ui.container.ButtonGroup
        ImageButton                    matlab.ui.control.RadioButton
        LineButton                     matlab.ui.control.RadioButton
        LeftClicktoSelectLabel         matlab.ui.control.Label
        Panel_11                       matlab.ui.container.Panel
        ArtifactListLabel              matlab.ui.control.Label
        TextArea_2                     matlab.ui.control.TextArea
        ListBox_2                      matlab.ui.control.ListBox
        Panel_14                       matlab.ui.container.Panel
        Panel_15                       matlab.ui.container.Panel
        ClassifyArtifactProfilesLabel  matlab.ui.control.Label
        AddRemoveButton                matlab.ui.control.Button
        SourceProfileLabel             matlab.ui.control.Label
        UIAxes5                        matlab.ui.control.UIAxes
        ProfilesLabel                  matlab.ui.control.Label
        UIAxes4                        matlab.ui.control.UIAxes
        LoadResultsPanel               matlab.ui.container.Panel
        ViewButton_2                   matlab.ui.control.Button
        ChangeButton_2                 matlab.ui.control.Button
        Label_9                        matlab.ui.control.Label
        CurrentDirectoryLabel_2        matlab.ui.control.Label
        Label_8                        matlab.ui.control.Label
        LoadButton                     matlab.ui.control.Button
        DetectButton                   matlab.ui.control.Button
        Panel_7                        matlab.ui.container.Panel
        ControlindividualspatialtimetracesLabel  matlab.ui.control.Label
        ViewallspatialtimetracessimultaneouslyLabel  matlab.ui.control.Label
        INDEPTHRESULTSButton           matlab.ui.control.Button
        HidePanelButton                matlab.ui.control.Button
        CurrentROILabel                matlab.ui.control.Label
        IM_NUMLabel                    matlab.ui.control.Label
        Button_6                       matlab.ui.control.Button
        Button_5                       matlab.ui.control.Button
        UIAxes3                        matlab.ui.control.UIAxes
        UIAxes2                        matlab.ui.control.UIAxes
    end

    
    properties (Access = public)
        Colors      % pallett
        Data        % data
        Status      % app status
        params      % params
        corr_kern   % corr_kern
        NWB         % nwb-related
        new_load    % analysis
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
            app.StatusLamp_2.Color              = app.Colors{7};            % Lamp
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
                    app.matSelectdesiredfielddetectedPanel.BackgroundColor  = app.Colors{5}; % .matPanel
                    app.matSelectdesiredfielddetectedPanel.ForegroundColor  = app.Colors{2};
                    app.SelectdesiredfielddetectedListBox.BackgroundColor   = app.Colors{5};
                    app.InfoTextArea.BackgroundColor                        = app.Colors{5};
                % Options Panel
                app.ButtonGroup.BackgroundColor         = app.Colors{5};    % Motion Correction
                app.SelectButton_3.BackgroundColor      = app.Colors{4};    % Cropping
                    % Cropping
                    app.Panel_9.BackgroundColor         = app.Colors{5};
                    app.ButtonGroup_2.BackgroundColor   = app.Colors{5};
                    app.CropButton_2.BackgroundColor    = app.Colors{4};
                    app.HistogramButton.BackgroundColor = app.Colors{4};
                    app.ProjectionButton.BackgroundColor= app.Colors{4};
                    app.ViewButton.BackgroundColor      = app.Colors{4};
                    % Histogram
                    app.Panel_8.BackgroundColor         = app.Colors{5};
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
                    app.Button_5.BackgroundColor        = app.Colors{4};
                    app.Button_6.BackgroundColor        = app.Colors{4};
                app.InDepthResultsPanel.BackgroundColor = app.Colors{5};
                app.InDepthResultsPanel.ForegroundColor = app.Colors{6};
                    app.CurrentPositionEditField.BackgroundColor = app.Colors{4};
                    app.Panel_11.BackgroundColor        = app.Colors{5};
                        app.TextArea_2.BackgroundColor  = app.Colors{4};
                    app.Panel_12.BackgroundColor        = app.Colors{5};
                    app.TimeTracesButtonGroup.BackgroundColor = app.Colors{4};
                    app.ListBox_2.BackgroundColor       = app.Colors{5};
                    app.Panel_14.BackgroundColor        = app.Colors{5};    % stacked plot window
                        app.Panel_15.BackgroundColor    = app.Colors{2};    % stacked plot
                    app.SaveChangesPanel.BackgroundColor = app.Colors{5};   % save
                    app.SaveChangesPanel.ForegroundColor = app.Colors{6};
                        app.TextArea_3.BackgroundColor  = app.Colors{4};
        end
        
        function setDefaults(app)
            % Data 
            app.Data.flag               = '';                               % no data loaded
            app.Data.name               = cd;
            app.Data.files              = [];
            app.Data.Fsim               = [];                               % raw data
            app.Data.Fsim_motco         = [];                               % motion_corrected/denoised
            app.Data.hist_obj           = [];                               % histogram
            app.Data.crop_settings      = {};                               % crop settings
            app.Data.S                  = [];                               % GraFT results
            app.Data.D                  = [];
            app.Data.type               = 'dir';                            % .mat, .nwb, or dir (default)
            app.Data.temp               = [];                               % for loaded indiviual files
            app.Data.ROIs               = [];                               % 1 - ROI, 0 - Artifact
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
            app.Status.hist_max         = 0;                                % histogram maximum value
            app.Status.hist_min         = 0;                                % histogram minimum value
            app.Status.InDepthResults   = 0;                                % analyzed in-depth results
            % GraFT
            app.Status.adv_settings     = 0;                                % toggle flip flop control
            % NWB
            app.NWB.acquisitiondatastub = [{'TwophotonSeries'};             % Calcium
                                           {'vcs'};                         % VoltageClampSeries (icephys)
                                           {'ElectricalSeries'};            % Ecephys (Extracellular electrophysiology)
                                           ];
            % Results
            app.new_load                = [];                               % Viewing and editing GraFT results

            % Data Loading Panel
            app.DataLoadingPanel.Visible                            = 'off';
                app.BrowseforFolderButton.Visible                   = 'on';
                app.BrowseforFileButton.Visible                     = 'on';
                app.LoadDataButton.Visible                          = 'on';
                app.NewLoadButton.Visible                           = 'off';
                app.ResetAllButton.Visible                          = 'off';
            app.AppStatusPanel.Visible                              = 'off';
                app.SingleFileSelectionPanel.Visible                = 'off';
                    app.matSelectdesiredfielddetectedPanel.Visible  = 'off';
                    app.nwbSelectdatalocationPanel.Visible          = 'off';
            app.OptionsPanel.Visible                                = 'off';
                app.Panel.Visible                                   = 'off';
                    app.Panel_8.Visible                             = 'off';
                    app.Panel_9.Visible                             = 'off';
                        app.ApplyButton.Enable                      = 'off';
                        app.CancelButton.Enable                      = 'off';
            % GraFT
            app.MainParametersPanel.Visible                         = 'on';
                app.AdvancedOptionsPanel.Visible                    = 'off';
            app.Panel_4.Visible                                     = 'off';
            % Results Tab
            app.SaveChangesPanel.Visible                            = "off";
            app.LoadResultsPanel.Visible                            = 'on';
                app.ViewButton_2.Enable                             = 'off';
                app.Panel_7.Visible                                 = 'off';
            app.InDepthResultsPanel.Visible                         = 'off';
                app.Panel_11.Visible                                = 'on';
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
                        app.DataLoadingPanel.Visible = 'off';
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
                        d = uiprogressdlg(app.UIFigure,'Title','Loading file',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        d.Message = 'File type - .nwb';
                        app.Data.temp = nwbRead(app.currentpathLabel.Text, 'ignorecache');
                        close(d);

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
                        d = uiprogressdlg(app.UIFigure,'Title','Loading .mat file',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        d.Message = 'File type - .mat';
                        app.Data.temp = load(app.Data.name);
                        close(d);

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
                case '.tif'
                    try
                        % uiprogressdlg
                        d = uiprogressdlg(app.UIFigure,'Title','Loading .tif file',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        d.Message = 'File type - .tif';
                        app.Data.Steps = size(imfinfo(app.Data.name));
                        app.Data.files = string(1:app.Data.Steps);
                        app.Data.temp = imread(app.Data.name, 1);
                        close(d);

                        % ListBox Update
                        app.ImagesListBox.Items         = app.Data.files;
                        app.DataLoadingPanel.Visible    = 'on';
                        app.LoadSelectionButton.Visible = 'on';
                        app.SelectAllButton.Visible     = 'on';
                        
                        % Update Status
                        app.StatusLamp_2.Color = app.Colors{7};
                        
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
            d = uiprogressdlg(app.UIFigure,'Title','Motion Correction in Progresss',...
                'Cancelable','off', 'Indeterminate','on','CancelText','Early Stop');
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
            close(d);

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
                        d = uiprogressdlg(app.UIFigure,'Title','Projection in Process',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        d.Message = 'Mean Intensity Projection';
                        % do
                        app.Data.projection.mean = mean(app.Data.Fsim_motco,3);
                        close(d);
                    else
                        return
                    end
                case 'Max'
                    % max intensity projection
                    if app.Status.projection_max == 0
                        % update
                        app.Status.projection_mean = 1;
                        % uiprogressdlg
                        d = uiprogressdlg(app.UIFigure,'Title','Projection in Process',...
                            'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                        d.Message = 'Max Intensity Projection';
                        % do
                        app.Data.projection.max = max(app.Data.Fsim_motco, [], 3);
                        close(d);
                    else
                        return
                    end
            end
        end

        function getValues(app, hfig)
            % get histogram values (do nothing with them I guess?)
            app.Status.hist_min = str2double(get(findobj(hfig, 'tag', 'window min edit'), 'String'));
            app.Status.hist_max = str2double(get(findobj(hfig, 'tag', 'window max edit'), 'String'));
            close(hfig)
        end


        function mouse_click(app, ~, hit)
            % get coordinates of click 
            coords = ceil(hit.IntersectionPoint);
            if any(coords < 0) || any(coords > max(size(app.new_load.S)))
                warning('Coordinates outside of Axes. Try again')
                return
            end

            % find highest ROI for image set in this area
            val = 0;
            idx = 0;
            for i = 1:size(app.new_load.S, 3)
                if app.new_load.S(coords(2),coords(1),i) > val
                    val = app.new_load.S(coords(2), coords(1), i);
                    idx = i;
                end
            end
            
            % if no image selected
            if idx ~= 0
                imagesc(app.new_load.S(:,:,idx), 'Parent', app.UIAxes5)
                colormap(app.UIAxes5, gray)
                app.ListBox_2.Value = app.ListBox_2.Items{idx};
                app.ListBox_2ValueChanged()                                 % update ListBox ValueChanged for stacked plot
            end

        end

        
        function setupScreen(app)
            screensize = get(groot, 'ScreenSize');
            app_position = app.UIFigure.Position;
        end
        
        function updateProfiles(app)
            % only show those that are ROIs (true) for both interactive
            % profile plot, as well as the image/line plots
            
            % indexes for selection
            idx = find(app.new_load.ROIs);

            % combined profile plot
            s_selection = app.new_load.S(:,:,idx');
            new_im_size = size(s_selection);
            new_im = zeros(new_im_size(1), new_im_size(2));
            for i = 1:new_im_size(3)
                new_im = new_im + s_selection(:, :, i);
            end
            cla(app.UIAxes4, "reset"); imagesc(new_im, 'Parent', app.UIAxes4, 'ButtonDownFcn',@app.mouse_click)
            colormap(app.UIAxes4, gray);

            % image plot
            d_selection = app.new_load.D(:, idx');
            new_D_size = size(d_selection);
            v = prctile(d_selection, [15, 98], "all");
            if v(1) == 0
                app.new_load.image_plot = flipud(d_selection');
            else
                baseline = v(1);
                D_norm = (d_selection - baseline) / baseline;
                app.new_load.image_plot = flipud(D_norm');
            end

            % line plot
            spacing = v(2);
            array_spacings = 1:spacing:spacing*new_D_size(2);
            line_plot = d_selection + array_spacings;
            app.new_load.line_plot = line_plot;

            % Setting the interactive coordinate function
            pm.enterFcn = [];
            pm.exitFcn  = @(~,~) set(app.CurrentPositionEditField, 'Value', '');
            pm.traverseFcn = @(~,~) set(app.CurrentPositionEditField, 'Value',...
                sprintf('%.2f,  %.2f', app.UIAxes4.CurrentPoint(1,1:2)));
            iptSetPointerBehavior(app.UIAxes4, pm)
            iptPointerManager(app.UIFigure,'enable');
            set(app.UIFigure,'WindowButtonMotionFcn',@(~,~)NaN) %dummy fcn
            
            % update line/image button depending which is selected
            app.TimeTracesButtonGroupSelectionChanged()
        end
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.UIFigure.Visible = 'off';
            movegui(app.UIFigure, 'center')
            app.UIFigure.Visible = 'on';
            app.setupScreen()   % TODO
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

                % Update
                app.Data.name = new_path;
                % datatype
                app.Data.type = 'dir';
                
            else
                warning('No new folder selected')
            end
        end

        % Button pushed function: BrowseforFileButton
        function BrowseforFileButtonPushed(app, event)
            [filename, path] = uigetfile({'*.nwb;*.mat;*.tif'}, "Select File");
            new_path = [path, filename];

            if ~isequal(filename, 0)
                app.currentpathLabel.Text = new_path;
                cd(path);

                % Update
                app.Data.name = filename;
                % datatype
                app.Data.type = filename(find(filename == '.'):end);

            else
                warning('No new file selected')
            end
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
            app.ResetAllButton.Visible          = 'on';
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
            app.Data = load_app_data(app);
            
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

        % Button pushed function: SelectButton_3
        function SelectButton_3Pushed(app, event)
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
            % Remove other options while selecting
            app.OptionsPanel.Visible                = 'off';
            app.AppStatusPanel.Visible              = 'off';
        end

        % Button pushed function: DenoiseButton
        function DenoiseButtonPushed(app, event)
            app.Data.Fsim_motco = app.motion_correction(app.ButtonGroup.SelectedObject.Text);
            
            if app.Status.denoise == 0
                % update
                app.Status.denoise = 1;
                % uiprogressdlg
                d = uiprogressdlg(app.UIFigure,'Title','Data Denoising in Proccess',...
                    'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                d.Message = 'Denoising data...';
                % do
                tic;
                try
                    app.Data.Fsim_motco = denoiseCIinSpace(app.Data.Fsim_motco);
                    close(d);
                catch
                    close(d);
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
            
            % Reset the selection
            app.ButtonGroup_2.SelectedObject = app.ViewButton;
            app.ButtonGroup_2SelectionChanged()

            % Disable 
            app.OptionsPanel.Visible            = 'on';
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

                    app.SelectButton_3Pushed('')
                    app.Panel_2.Visible                         = 'on';
                    app.Button_2.Visible                        = 'on';
                    app.Button.Visible                          = 'on';
                    app.Label_2.Visible                         = 'on';
                    app.Slider.Visible                          = 'on';
                    app.Panel_8.Visible                         = 'off';    % histogram
                    app.Panel_9.Visible                         = 'off';    % crop 
                
                case 'Crop'
                    % handle visibilies
                    app.Slider.Visible                          = 'off';
                    app.Button.Visible                          = 'off';
                    app.Button_2.Visible                        = 'off';
                    app.Label_2.Visible                         = 'off';
                    app.Panel_8.Visible                         = 'off';    % histogram
                    app.Panel_9.Visible                         = 'on';     % crop

                    % automatically does a default projection
                    cla(app.UIAxes, "reset")

                    % do default projection (mean)
                    app.get_projection('Mean');
                    imagesc(app.Data.projection.mean, 'Parent', app.UIAxes);
                    colormap(app.UIAxes, gray);


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
                    app.Panel_8.Visible                         = 'off';    % histogram
                    app.Panel_9.Visible                         = 'off';    % crop
               
                case 'Histogram'
                    % Visibilities
                    app.Panel_9.Visible = 'off';                            % crop
                    app.Panel_8.Visible = 'on';                             % histogram
                    
                    % axes
                    cla(app.UIAxes, "reset")
                    app.get_projection('Mean');
                    imagesc(app.Data.projection.mean, 'Parent', app.UIAxes);
                    colormap(app.UIAxes, gray);              
            end
        end

        % Button pushed function: LaunchButton
        function LaunchButtonPushed(app, event)
            app.Data.hist_obj = imcontrast(app.UIAxes);
            
            set(app.Data.hist_obj, 'CloseRequestFcn', @(s,e)getValues(app, s));   
        end

        % Button pushed function: ApplytoAllButton
        function ApplytoAllButtonPushed(app, event)
            % apply histogram changes to entire stack
            
            % ensure that it isn't 0-1
            if app.Status.hist_min == 0 && app.Status.hist_max == 1
                warning('Please reset and try again')
                return
            else
                % use image adjust to adjust entire stack based on values
                dim = size(app.Data.Fsim_motco);
                data_out = zeros(dim);

                mask = app.Data.Fsim_motco > app.Status.hist_min & app.Data.Fsim_motco < app.Status.hist_max;
                data_out = app.Data.Fsim_motco .* mask;
            end
        end

        % Value changed function: SelectAreaButton
        function SelectAreaButtonValueChanged(app, event)
            % interactive cropping
            try
                message = sprintf("Left click and hold to select square region.\nRight click > Crop when done.");
                uiwait(msgbox(message));
                [img_out, img_idx] = imcrop(app.UIAxes);                    % img_dx = [x,y,width,height]
            catch 
                disp('Image cropping cancelled');
                return
            end

            if isempty(img_out) || isempty(img_idx); return; end
            
            % save settings
            s.croppedImage = img_out;
            s.img_idx = img_idx;
            s.modality = 'rect';
            app.Data.crop_settings = s;

            % update projection image
            imagesc(img_out, 'Parent', app.UIAxes);
            colormap(app.UIAxes, gray);

            % Enable Apply and Reset Buttons
            app.ApplyButton.Enable = 'on';
            app.CancelButton.Enable = 'on';
        end

        % Button pushed function: CreateMaskButton
        function CreateMaskButtonPushed(app, event)
            try
                message = sprintf("Left click and hold to begin drawing.\nSimply lift the mouse button to finish.");
                uiwait(msgbox(message));

                fh_obj = imfreehand(app.UIAxes);                            % Do the drawing
            catch 
                disp('Image cropping cancelled');
                return
            end
            
            if isempty(fh_obj)
                % bail
                return
            end

            % create the mask
            binary_img = createMask(fh_obj);   
            xy = fh_obj.getPosition;

            % Get coordinates of the boundary of the freehand drawn region.
            structBoundaries = bwboundaries(binary_img);
            xy=structBoundaries{1};                                         % Get n by 2 array of x,y coordinates.
            x = xy(:, 2);                                                   % Columns.
            y = xy(:, 1);                                                   % Rows.
            
            % Mask image outside the mask
            blackMaskedImage = app.Data.projection.mean;
            blackMaskedImage(~binary_img) = 0;                              % Will keep only part of image inside mask
            imagesc(blackMaskedImage); colormap(gray)

            % Crop the image
            leftColumn = min(x);
            rightColumn = max(x);
            topLine = min(y);
            bottomLine = max(y);
            width = rightColumn - leftColumn + 1;
            height = bottomLine - topLine + 1;
            croppedImage = imcrop(blackMaskedImage, [leftColumn, topLine, width, height]);
            
            % update to axes
            imagesc(croppedImage, 'Parent', app.UIAxes);
            colormap(app.UIAxes, gray);

            % save parameters
            s.modality = 'fh';
            s.croppedImage = croppedImage;
            s.rect_idx = [leftColumn, topLine, width, height];
            s.binary_img = binary_img;
            app.Data.crop_settings = s;

            % Enable Apply and Reset Buttons
            app.ApplyButton.Enable = 'on';
            app.CancelButton.Enable = 'on';
        end

        % Button pushed function: CancelButton
        function CancelButtonPushed(app, event)
            % reset out of crop changes
            app.Data.crop_settings = {};
            % reset projection
            app.get_projection('Mean');
            % reset axes
            cla(app.UIAxes, "reset")
            imagesc(app.Data.projection.mean, 'Parent', app.UIAxes);
            colormap(app.UIAxes, gray);
            % enables
            app.ApplyButton.Enable = 'off';
            app.CancelButton.Enable = 'off';
        end

        % Button pushed function: ApplyButton
        function ApplyButtonPushed(app, event)
            % settings
            s = app.Data.crop_settings;

            % uiprogressdlg
            d = uiprogressdlg(app.UIFigure,'Title','Cropping in Progresss',...
                'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
            
            t = tic;
            switch s.modality
                case 'rect'  % cropping rectangle
                    app.Data.Fsim_motco = app.Data.Fsim_motco(s.img_idx(1):s.img_idx(1)+s.img_idx(3), ... % X
                                                              s.img_idx(2):s.img_idx(2)+s.img_idx(4), ... % Y
                                                              :);                                         % Z
                case 'fh'    % cropping freehand
                    len_data = size(app.Data.Fsim_motco,3);
                    binary_stack = repmat(s.binary_img, [1,1,len_data]);    % mask stack
                    app.Data.Fsim_motco(~binary_stack) = 0;                 % mask imgs outside the mask
                    
                    temp = zeros([size(s.croppedImage), len_data]);         % create zeros template
                    for i = 1:len_data  % crop
                        temp(:,:,i) = imcrop(app.Data.Fsim_motco(:,:,i), s.rect_idx);
                    end
                    app.Data.Fsim_motco = temp;                             % update data
            end

            % end figure
            close(d);
          
            % Update User Status
            app.textLabel.Text = sprintf('%s \nCropping Complete in %.3f seconds', ...
                                            app.textLabel.Text, toc(t));

            % Update States
            app.ApplyButton.Enable  = 'off';
            app.CancelButton.Enable = 'off';
            app.Status.projection_mean = 0;                                 % reset the mean projection with new size
            if any(size(app.Data.Fsim) ~= size(app.Data.Fsim_motco))
                app.NoCropSelectedLabel.Visible = 'off';
            else
                app.NoCropSelectedLabel.Visible = 'on';
            end
        end

        % Value changed function: ResetAllButton
        function ResetAllButtonValueChanged(app, event)
            % temporary structure & reset
            temp = app.Data;
            app.setDefaults;
            app.paramsDefault;

            % only want to keep...
            app.Data.flag   = temp.flag;
            app.Data.name   = temp.name;
            app.Data.files  = temp.files;
            app.Data.Fsim   = temp.Fsim;
            app.Data.type   = temp.type;

            % Initiaiting Motion Correct with 'None' method
            app.Data.Fsim_motco = app.Data.Fsim;
            
            % Show panels if loading complete
            if strcmp(app.Data.flag, 'Complete') == 1
                app.OptionsPanel.Visible                = 'on';
                app.AppStatusPanel.Visible              = 'on';
                app.NewLoadButton.Visible               = 'on';
                app.ResetAllButton.Visible              = 'on';
                app.DataLoadingPanel.Visible            = 'off';
                app.BrowseforFileButton.Visible         = 'off';
                app.BrowseforFolderButton.Visible       = 'off';
                app.LoadDataButton.Visible              = 'off';
            end

            app.textLabel.Text = sprintf('Reset complete.\nAll changes to data are back to default!');
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
            d = uiprogressdlg(app.UIFigure,'Title','GraFTing',...
                'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');

            % Actually run GraFT
            tic
            if app.params.usePatch
                [app.Data.S, app.Data.D] = patchGraFT(app.Data.Fsim_motco, app.params.n_dict,[],app.corr_kern,app.params);      % Learn the dictionary using patch-based code
            else
                [app.Data.D, app.Data.S] = GraFT(app.Data.Fsim_motco, [], app.corr_kern, app.params);   % Learn the dictionary (no patching - will be much more memory intensive and slower)
            end
            % end figure
            close(d);

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

            % artifact
            app.Data.ROIs = ones(size(app.Data.D, 2), 1);                   % default 1

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

            app.EditField.Value = saveName;
            
            app.Panel_4.Visible         = 'on';
            app.ResultsButton.Visible   = 'on';
        end

        % Button pushed function: BackButton_2
        function BackButton_2Pushed(app, event)
            app.Panel_4.Visible         = 'off';
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
            saveName = app.EditField.Value;

            % update text status
            app.textLabel.Text          = sprintf('%s \nSaving results to %s...', ...
                                            app.textLabel.Text, saveName);
            app.OutputhereLabel.Text    = app.textLabel.Text;

            if ~app.KeeporiginaldataFsimCheckBox.Value
                app.Data.Fsim = '';
            end

            % uiprogressdlg
            d = uiprogressdlg(app.UIFigure,'Title','Saving GraFT results',...
                'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
            str_to_save = app.Data;
            str_to_save.Parameters = app.params;
            save(fullfile(saveDir,saveName),'-struct','str_to_save', '-v7.3')  % Save the results
            % end figure
            close(d);

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
                app.Label_8.Text    = app.Label_6.Text;
                app.new_load   = app.Data;

                % update status
                app.Status.res_current_im   = 1;
                app.IM_NUMLabel.Text        = num2str(app.Status.res_current_im);
                app.Status.res_total_im_num = size(app.new_load.S, 3);
                app.ViewButton_2.Enable = 'on';
            end
        end

        % Button pushed function: LoadButton
        function LoadButtonPushed(app, event)
            [filename, path] = uigetfile({'*.mat'}, "Select File");
            new_path = [path, filename];

            if ~isequal(filename, 0)
                % uiprogressdlg
                d = uiprogressdlg(app.UIFigure,'Title','Loading file',...
                    'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                d.Message = 'Please wait while file loads';
                app.new_load = load(new_path);
                close(d);

                % check for desired fields
                if isfield(app.new_load, 'S') && isfield(app.new_load, 'D')
                    app.Label_8.Text = sprintf(['>>Data \n\nStructure with fields:\n\n' ...
                                    '           name: %s\n' ...
                                    '             files: %s\n' ...
                                    'Fsim_motco: [%sx%sx%s double]\n' ...
                                    '                 S: [%sx%sx%s double]\n' ...
                                    '                 D: [%sx%s double]\n'], ...
                                    app.new_load.name, ...
                                    string(size(app.new_load.files,1)), ...
                                    string(size(app.new_load.Fsim_motco)), ...
                                    string(size(app.new_load.S)), ...
                                    string(size(app.new_load.D)));

                    if ~isfield(app.new_load, 'ROIs')
                        % create ROIs list if not detected
                        app.new_load.ROIs = ones(size(app.new_load.D, 2), 1);
                    end

                    % update status
                    app.Status.InDepthResults   = 0;                        % reset previous load     
                    app.Status.res_current_im   = 1;
                    app.IM_NUMLabel.Text        = num2str(app.Status.res_current_im);
                    app.Status.res_total_im_num = size(app.new_load.S, 3);
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
            imagesc(app.new_load.S(:,:,1), 'Parent', app.UIAxes2);
            colormap(app.UIAxes2, gray);
            plot(app.new_load.D(:,1), 'Parent', app.UIAxes3);

            % Visibilities
            app.Panel_7.Visible             = 'on';
        end

        % Button pushed function: Button_5, Button_6
        function Button_6Pushed(app, event)
            if app.Status.res_current_im > 1 && event.Source.Text=='<'
                    app.Status.res_current_im = app.Status.res_current_im - 1;
                elseif app.Status.res_current_im < app.Status.res_total_im_num && event.Source.Text=='>'
                    app.Status.res_current_im   = app.Status.res_current_im + 1;
            end

            % update label
            app.IM_NUMLabel.Text = num2str(app.Status.res_current_im);

            % update image panels
            cla(app.UIAxes2, "reset")
            cla(app.UIAxes3, "reset")
            imagesc(app.new_load.S(:,:,app.Status.res_current_im), 'Parent', app.UIAxes2);
            colormap(app.UIAxes2, gray);
            plot(app.new_load.D(:,app.Status.res_current_im), 'Parent', app.UIAxes3);
        end

        % Button pushed function: HidePanelButton
        function HidePanelButtonPushed(app, event)
            % Visibilities
            app.Panel_7.Visible             = 'off';
            app.LoadResultsPanel.Visible    = 'on';
        end

        % Button pushed function: INDEPTHRESULTSButton
        function INDEPTHRESULTSButtonPushed(app, event)
            if app.Status.InDepthResults == 0
                new_im_size = size(app.new_load.S);
                new_im = zeros(new_im_size(1), new_im_size(2));
                col_name = cell(new_im_size(3), 1);                             % temporal col names
    
                for i = 1:new_im_size(3)
                    new_im = new_im + app.new_load.S(:, :, i);
                    col_name{i} = sprintf('ROI-%d', i);
                end
                
                % PLOTS

                % combined interactive image plot
                cla(app.UIAxes4, "reset"); imagesc(new_im, 'Parent', app.UIAxes4, 'ButtonDownFcn',@app.mouse_click)
                colormap(app.UIAxes4, gray);

                % default selected spatial plot
                cla(app.UIAxes5, "reset");imagesc(app.new_load.S(:,:,app.Status.res_current_im), 'Parent', app.UIAxes5)
                colormap(app.UIAxes5, gray);

                % image plot
                new_D_size = size(app.new_load.D);
                v = prctile(app.new_load.D, [15, 98], "all");
                if v(1) == 0
                    app.new_load.image_plot = flipud(app.new_load.D');
                else
                    baseline = v(1);
                    D_norm = (app.new_load.D - baseline) / baseline;
                    app.new_load.image_plot = flipud(D_norm');
                end

                % line plot
                spacing = v(2);
                array_spacings = 1:spacing:spacing*new_D_size(2);
                line_plot = app.new_load.D + array_spacings;
                app.new_load.line_plot = line_plot;
                cla(app.UIAxes7, "reset")
                plot(line_plot, 'Parent', app.UIAxes7);                     % default - line plot selected

                % Temporal Stacked Plot
    %             if new_im_size(3)>5
    %                 panel_height = ceil(79*new_im_size(3))+391;
    %             end
                h = stackedplot(1:new_D_size(1), ...
                    app.new_load.D(:,app.Status.res_current_im), ...
                    'Parent', app.Panel_15);   % Activity Plot
                try 
                    h.DisplayLabels = col_name(app.Status.res_current_im);
                catch
                    warning("Displaying Labels Went Wrong")
                end
    
                % ListBox Items and Selection
                app.ListBox_2.Items = col_name;
                app.ListBox_2.Value = col_name{app.Status.res_current_im};
    
                % Setting the interactive coordinate function
                pm.enterFcn = [];
                pm.exitFcn  = @(~,~) set(app.CurrentPositionEditField, 'Value', '');
                pm.traverseFcn = @(~,~) set(app.CurrentPositionEditField, 'Value',...
                    sprintf('%.2f,  %.2f', app.UIAxes4.CurrentPoint(1,1:2)));
                iptSetPointerBehavior(app.UIAxes4, pm)
                iptPointerManager(app.UIFigure,'enable');
                set(app.UIFigure,'WindowButtonMotionFcn',@(~,~)NaN) %dummy fcn
                
                % update list
                ROIs_idx = find(app.new_load.ROIs == 0);
                if numel(ROIs_idx) > 0
                    for i = ROIs_idx
                        val = string(i);
                        app.TextArea_2.Value = sprintf('ROI - %s\n', val);
                    end
    
                    % visible only when there are 1+ artifacts
                    app.TextArea_2.Visible          = 'on';
                    app.ArtifactListLabel.Visible   = 'on';

                    % update profile view
                    app.updateProfiles()
                else
                    app.TextArea_2.Visible          = 'off';
                    app.ArtifactListLabel.Visible   = 'off';
                end

                % Update panel
                app.Status.InDepthResults = 1;
            end

            % Visibilities
            app.InDepthResultsPanel.Visible = 'on';
            app.LoadResultsPanel.Visible    = 'off';
            app.Panel_7.Visible             = 'off';
        end

        % Selection changed function: TimeTracesButtonGroup
        function TimeTracesButtonGroupSelectionChanged(app, event)
            % manage between line and image plot in viewing results

            selectedButton = app.TimeTracesButtonGroup.SelectedObject;
            cla(app.UIAxes7, "reset")
            switch selectedButton.Text
                case 'Line'
                    plot(app.new_load.line_plot, 'Parent', app.UIAxes7);
                case 'Image'
                    imagesc(app.new_load.image_plot, 'Parent', app.UIAxes7);
            end
        end

        % Value changed function: ListBox_2
        function ListBox_2ValueChanged(app, event)
            % handle stacked plot, allowing for up to 5 simultaneous
            % selections of the ListBox_2.Items

            value = app.ListBox_2.Value;
            if length(value) < 6
                % selection
                idxs = find(contains(app.ListBox_2.Items, value));
                out_D = app.new_load.D(:, idxs);
                
                % updating plot
                out_S = zeros(size(app.new_load.S, [1,2]));
                for i = idxs
                    out_S = out_S + app.new_load.S(:,:,i);
                end
                imagesc(out_S, 'Parent', app.UIAxes5) 
                colormap(app.UIAxes5, gray);

                % updating stacked plot
                d_length = length(app.new_load.D);
                h = stackedplot(1:d_length, out_D, 'Parent', app.Panel_15);
                try h.DisplayLabels = value; catch; warning("Displaying Labels Went Wrong"); end
            end
        end

        % Button pushed function: BackButton_3
        function BackButton_3Pushed(app, event)
            app.InDepthResultsPanel.Visible = 'off';
            app.Panel_7.Visible             = 'on';
            app.LoadResultsPanel.Visible    = 'on';
        end

        % Button pushed function: AddRemoveButton
        function AddRemoveButtonPushed(app, event)
            % remove or add selected ROIs as artifacts

            selection = app.ListBox_2.Value;
            idx = find(contains(app.ListBox_2.Items, selection));

            % check index to be within bounds
            if any(idx < 1) || numel(idx) > numel(app.ListBox_2.Items)
                warning('Index value selected invalid')
            end

            % switch values at the given index
            for i = idx
                if app.new_load.ROIs(i) == 0
                    app.new_load.ROIs(i) = 1;
                else 
                    app.new_load.ROIs(i) = 0;
                end
            end

            % update list
            ROIs_idx = find(app.new_load.ROIs == 0);
            if numel(ROIs_idx) > 0
                for i = ROIs_idx
                    val = string(i);
                    app.TextArea_2.Value = sprintf('ROI - %s\n', val);
                end

                % visible only when there are 1+ artifacts
                app.TextArea_2.Visible          = 'on';
                app.ArtifactListLabel.Visible   = 'on';

                % update profile view
                app.updateProfiles()
            else
                app.TextArea_2.Visible          = 'off';
                app.ArtifactListLabel.Visible   = 'off';
            end

        end

        % Button pushed function: SaveButton_2
        function SaveButton_2Pushed(app, event)
            app.InDepthResultsPanel.Enable  = "off";
            app.SaveChangesPanel.Visible    = "on";

            app.Label3_2.Text = pwd;
        end

        % Button pushed function: BackButton_4
        function BackButton_4Pushed(app, event)
            app.InDepthResultsPanel.Enable  = "on";
            app.SaveChangesPanel.Visible    = "off";
        end

        % Button pushed function: SaveButton_3
        function SaveButton_3Pushed(app, event)
            % save .mat to specified directory 
            
            % dir
            saveDir = app.Label3_2.Text;

            % name of file
            name = app.NameEditField.Value;
            if strcmp(name, "")
                time = datetime('now', 'Format', 'yyy_MM_d_HHmm');
                name = sprintf("GraFT_%s.mat", time);
            else
                name = name + ".mat";
            end

            % check ROI
            str_to_save = struct();
            if app.ROIsCheckBox.Value
                str_to_save.ROIs = app.new_load.ROIs;
            end
            
            % check data
            if app.GraFTResultsCheckBox.Value
                list_fields = fieldnames(app.new_load);
                for i = 1:numel(list_fields)
                    varName = list_fields{i};

                    if ~strcmp(varName, 'ROIs')
                        temp = sprintf('app.new_load.%s', varName);
                        varValue = eval(temp);
                        str_to_save.(varName) = varValue;
                    end
                end
            end
            
            if ~isempty(fieldnames(str_to_save))
                % uiprocess
                d = uiprogressdlg(app.UIFigure,'Title','Saving...',...
                    'Cancelable','on', 'Indeterminate','on','CancelText','Early Stop');
                % Save the results
                save(fullfile(saveDir,name),'-struct','str_to_save', '-v7.3')
                % end figure
                close(d);
                
                % update on save
                text = sprintf("Successfully saved %s within %s", ...
                                name, ...
                                saveDir);
                app.TextArea_3.Value = text;
            else
                % case if empty or another error
                text = "No selection of data to save detected. Select one of the checkboxes and try again.";
                app.TextArea_3.Value = text;
            end

            % update visibilities
            app.TextArea_3.Visible = "on";
        end

        % Button pushed function: ChangeButton_3
        function ChangeButton_3Pushed(app, event)
            new_path = uigetdir("Select Folder to Save");
            if new_path ~= 0                                                % case of cancellation
                app.Label3_2.Text = new_path;
                cd(new_path);
            else
                warning('No new folder selected')
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Color = [1 1 1];
            app.UIFigure.Position = [400 0 1300 1000];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.Scrollable = 'on';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [18 41 1267 876];

            % Create OpenDatasetTab
            app.OpenDatasetTab = uitab(app.TabGroup);
            app.OpenDatasetTab.Title = 'Open Dataset ';
            app.OpenDatasetTab.BackgroundColor = [1 1 1];

            % Create SetUpPanel
            app.SetUpPanel = uipanel(app.OpenDatasetTab);
            app.SetUpPanel.ForegroundColor = [0.0706 0.6196 1];
            app.SetUpPanel.BorderType = 'none';
            app.SetUpPanel.Title = 'Set-Up';
            app.SetUpPanel.BackgroundColor = [0.8 0.8 0.8];
            app.SetUpPanel.FontWeight = 'bold';
            app.SetUpPanel.FontSize = 14;
            app.SetUpPanel.Position = [35 640 1206 186];

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
            app.LoadDataButton.Position = [1014 33 82 29];
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
            app.NewLoadButton.Position = [568 35 100 25];

            % Create ResetAllButton
            app.ResetAllButton = uibutton(app.SetUpPanel, 'state');
            app.ResetAllButton.ValueChangedFcn = createCallbackFcn(app, @ResetAllButtonValueChanged, true);
            app.ResetAllButton.Text = 'Reset All';
            app.ResetAllButton.FontSize = 14;
            app.ResetAllButton.Position = [680 35 100 25];

            % Create AppStatusPanel
            app.AppStatusPanel = uipanel(app.OpenDatasetTab);
            app.AppStatusPanel.ForegroundColor = [0.0745 0.6235 1];
            app.AppStatusPanel.BorderType = 'none';
            app.AppStatusPanel.Title = 'App Status';
            app.AppStatusPanel.BackgroundColor = [0.8 0.8 0.8];
            app.AppStatusPanel.FontWeight = 'bold';
            app.AppStatusPanel.FontSize = 14;
            app.AppStatusPanel.Position = [566 28 675 595];

            % Create textLabel
            app.textLabel = uilabel(app.AppStatusPanel);
            app.textLabel.VerticalAlignment = 'top';
            app.textLabel.FontColor = [1 1 1];
            app.textLabel.Position = [22 9 598 558];
            app.textLabel.Text = {'-text-'; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''; ''};

            % Create StatusLamp_2
            app.StatusLamp_2 = uilamp(app.AppStatusPanel);
            app.StatusLamp_2.Position = [631 541 20 20];

            % Create SingleFileSelectionPanel
            app.SingleFileSelectionPanel = uipanel(app.OpenDatasetTab);
            app.SingleFileSelectionPanel.BorderType = 'none';
            app.SingleFileSelectionPanel.Title = 'Single-File Selection';
            app.SingleFileSelectionPanel.FontWeight = 'bold';
            app.SingleFileSelectionPanel.FontSize = 14;
            app.SingleFileSelectionPanel.Position = [36 350 519 273];

            % Create matSelectdesiredfielddetectedPanel
            app.matSelectdesiredfielddetectedPanel = uipanel(app.SingleFileSelectionPanel);
            app.matSelectdesiredfielddetectedPanel.ForegroundColor = [1 1 1];
            app.matSelectdesiredfielddetectedPanel.BorderType = 'none';
            app.matSelectdesiredfielddetectedPanel.Title = '.mat - Select desired field detected';
            app.matSelectdesiredfielddetectedPanel.BackgroundColor = [0.651 0.651 0.651];
            app.matSelectdesiredfielddetectedPanel.FontSize = 13;
            app.matSelectdesiredfielddetectedPanel.Position = [12 52 412 190];

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
            app.nwbSelectdatalocationPanel.Position = [13 8 507 234];

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
            app.TextArea.Position = [222 9 280 172];

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

            % Create DataLoadingPanel
            app.DataLoadingPanel = uipanel(app.OpenDatasetTab);
            app.DataLoadingPanel.ForegroundColor = [0.0745 0.6235 1];
            app.DataLoadingPanel.BorderType = 'none';
            app.DataLoadingPanel.Title = 'Data Loading';
            app.DataLoadingPanel.BackgroundColor = [0.8 0.8 0.8];
            app.DataLoadingPanel.FontWeight = 'bold';
            app.DataLoadingPanel.FontSize = 14;
            app.DataLoadingPanel.Position = [35 305 470 317];

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

            % Create OptionsPanel
            app.OptionsPanel = uipanel(app.OpenDatasetTab);
            app.OptionsPanel.ForegroundColor = [0.0745 0.6235 1];
            app.OptionsPanel.BorderType = 'none';
            app.OptionsPanel.Title = 'Options';
            app.OptionsPanel.BackgroundColor = [0.8 0.8 0.8];
            app.OptionsPanel.FontWeight = 'bold';
            app.OptionsPanel.FontSize = 14;
            app.OptionsPanel.Position = [35 128 470 495];

            % Create DenoiseButton
            app.DenoiseButton = uibutton(app.OptionsPanel, 'push');
            app.DenoiseButton.ButtonPushedFcn = createCallbackFcn(app, @DenoiseButtonPushed, true);
            app.DenoiseButton.Position = [183 158 68 24];
            app.DenoiseButton.Text = 'Denoise';

            % Create MotionCorrectionLabel
            app.MotionCorrectionLabel = uilabel(app.OptionsPanel);
            app.MotionCorrectionLabel.FontSize = 15;
            app.MotionCorrectionLabel.FontWeight = 'bold';
            app.MotionCorrectionLabel.FontColor = [1 1 1];
            app.MotionCorrectionLabel.Position = [25 429 134 22];
            app.MotionCorrectionLabel.Text = 'Motion Correction';

            % Create ImageEditingLabel
            app.ImageEditingLabel = uilabel(app.OptionsPanel);
            app.ImageEditingLabel.FontSize = 15;
            app.ImageEditingLabel.FontWeight = 'bold';
            app.ImageEditingLabel.FontColor = [1 1 1];
            app.ImageEditingLabel.Position = [30 303 103 22];
            app.ImageEditingLabel.Text = 'Image Editing';

            % Create SelectButton_3
            app.SelectButton_3 = uibutton(app.OptionsPanel, 'push');
            app.SelectButton_3.ButtonPushedFcn = createCallbackFcn(app, @SelectButton_3Pushed, true);
            app.SelectButton_3.BackgroundColor = [0.8 0.8 0.8];
            app.SelectButton_3.FontSize = 13;
            app.SelectButton_3.FontColor = [1 1 1];
            app.SelectButton_3.Position = [83 239 60 50];
            app.SelectButton_3.Text = 'Select';

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
            app.DropDown.Position = [65 158 100 24];
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

            % Create Panel
            app.Panel = uipanel(app.OpenDatasetTab);
            app.Panel.BackgroundColor = [0.8 0.8 0.8];
            app.Panel.Position = [35 27 1206 596];

            % Create ViewDropDown
            app.ViewDropDown = uidropdown(app.Panel);
            app.ViewDropDown.Items = {'Mean', '95th Percentile', 'Maximum'};
            app.ViewDropDown.Visible = 'off';
            app.ViewDropDown.Position = [73 138 98 24];
            app.ViewDropDown.Value = 'Mean';

            % Create BackButton
            app.BackButton = uibutton(app.Panel, 'push');
            app.BackButton.ButtonPushedFcn = createCallbackFcn(app, @BackButtonPushed, true);
            app.BackButton.Position = [30 23 53 32];
            app.BackButton.Text = 'Back';

            % Create ViewModeLabel
            app.ViewModeLabel = uilabel(app.Panel);
            app.ViewModeLabel.FontSize = 15;
            app.ViewModeLabel.FontWeight = 'bold';
            app.ViewModeLabel.FontColor = [1 1 1];
            app.ViewModeLabel.Position = [90 544 82 22];
            app.ViewModeLabel.Text = 'View Mode';

            % Create ThresholdLabel
            app.ThresholdLabel = uilabel(app.Panel);
            app.ThresholdLabel.FontSize = 14;
            app.ThresholdLabel.FontWeight = 'bold';
            app.ThresholdLabel.FontColor = [1 1 1];
            app.ThresholdLabel.Visible = 'off';
            app.ThresholdLabel.Position = [84 167 73 22];
            app.ThresholdLabel.Text = 'Threshold';

            % Create ButtonGroup_2
            app.ButtonGroup_2 = uibuttongroup(app.Panel);
            app.ButtonGroup_2.SelectionChangedFcn = createCallbackFcn(app, @ButtonGroup_2SelectionChanged, true);
            app.ButtonGroup_2.BorderType = 'none';
            app.ButtonGroup_2.ButtonDownFcn = createCallbackFcn(app, @ButtonGroup_2SelectionChanged, true);
            app.ButtonGroup_2.Position = [65 318 134 217];

            % Create ViewButton
            app.ViewButton = uitogglebutton(app.ButtonGroup_2);
            app.ViewButton.Text = 'View';
            app.ViewButton.BackgroundColor = [0.8 0.8 0.8];
            app.ViewButton.FontColor = [1 1 1];
            app.ViewButton.Position = [11 170 114 42];
            app.ViewButton.Value = true;

            % Create HistogramButton
            app.HistogramButton = uitogglebutton(app.ButtonGroup_2);
            app.HistogramButton.Text = 'Histogram';
            app.HistogramButton.BackgroundColor = [0.651 0.651 0.651];
            app.HistogramButton.FontColor = [1 1 1];
            app.HistogramButton.Position = [11 14 114 42];

            % Create CropButton_2
            app.CropButton_2 = uitogglebutton(app.ButtonGroup_2);
            app.CropButton_2.Text = 'Crop';
            app.CropButton_2.BackgroundColor = [0.651 0.651 0.651];
            app.CropButton_2.FontColor = [1 1 1];
            app.CropButton_2.Position = [11 118 114 42];

            % Create ProjectionButton
            app.ProjectionButton = uitogglebutton(app.ButtonGroup_2);
            app.ProjectionButton.Text = 'Projection';
            app.ProjectionButton.BackgroundColor = [0.651 0.651 0.651];
            app.ProjectionButton.FontColor = [1 1 1];
            app.ProjectionButton.Position = [11 66 114 42];

            % Create Panel_2
            app.Panel_2 = uipanel(app.Panel);
            app.Panel_2.BorderType = 'none';
            app.Panel_2.BackgroundColor = [0.8 0.8 0.8];
            app.Panel_2.Position = [484 9 711 581];

            % Create UIAxes
            app.UIAxes = uiaxes(app.Panel_2);
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.XTick = [];
            app.UIAxes.YTick = [];
            app.UIAxes.Position = [63 47 649 531];

            % Create Slider
            app.Slider = uislider(app.Panel_2);
            app.Slider.MajorTicks = [];
            app.Slider.Orientation = 'vertical';
            app.Slider.ValueChangingFcn = createCallbackFcn(app, @SliderValueChanging, true);
            app.Slider.MinorTicks = [];
            app.Slider.Position = [33 81 3 466];

            % Create Label_2
            app.Label_2 = uilabel(app.Panel_2);
            app.Label_2.FontColor = [1 1 1];
            app.Label_2.Position = [49 18 117 22];
            app.Label_2.Text = '1/800000';

            % Create Button_2
            app.Button_2 = uibutton(app.Panel_2, 'push');
            app.Button_2.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button_2.BackgroundColor = [0.9608 0.9608 0.9608];
            app.Button_2.Position = [137 18 36 23];
            app.Button_2.Text = '<';

            % Create Button
            app.Button = uibutton(app.Panel_2, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @Button_2Pushed, true);
            app.Button.BackgroundColor = [1 1 1];
            app.Button.Position = [180 18 36 23];
            app.Button.Text = '>';

            % Create Panel_8
            app.Panel_8 = uipanel(app.Panel);
            app.Panel_8.BorderType = 'none';
            app.Panel_8.BackgroundColor = [0.651 0.651 0.651];
            app.Panel_8.Position = [130 77 239 221];

            % Create HistogramToolLabel
            app.HistogramToolLabel = uilabel(app.Panel_8);
            app.HistogramToolLabel.FontWeight = 'bold';
            app.HistogramToolLabel.FontColor = [1 1 1];
            app.HistogramToolLabel.Position = [79 184 92 22];
            app.HistogramToolLabel.Text = 'Histogram Tool';

            % Create LaunchButton
            app.LaunchButton = uibutton(app.Panel_8, 'push');
            app.LaunchButton.ButtonPushedFcn = createCallbackFcn(app, @LaunchButtonPushed, true);
            app.LaunchButton.Position = [35 142 67 33];
            app.LaunchButton.Text = 'Launch';

            % Create ApplytoAllButton
            app.ApplytoAllButton = uibutton(app.Panel_8, 'push');
            app.ApplytoAllButton.ButtonPushedFcn = createCallbackFcn(app, @ApplytoAllButtonPushed, true);
            app.ApplytoAllButton.Enable = 'off';
            app.ApplytoAllButton.Visible = 'off';
            app.ApplytoAllButton.Position = [75 62 100 23];
            app.ApplytoAllButton.Text = 'Apply to All';

            % Create ViewpixelhistogramandadjustcontrastLabel
            app.ViewpixelhistogramandadjustcontrastLabel = uilabel(app.Panel_8);
            app.ViewpixelhistogramandadjustcontrastLabel.WordWrap = 'on';
            app.ViewpixelhistogramandadjustcontrastLabel.FontColor = [1 1 1];
            app.ViewpixelhistogramandadjustcontrastLabel.Position = [112 146 112 27];
            app.ViewpixelhistogramandadjustcontrastLabel.Text = 'View pixel histogram and adjust contrast';

            % Create ThisisonlyforviewingpurposesLabel
            app.ThisisonlyforviewingpurposesLabel = uilabel(app.Panel_8);
            app.ThisisonlyforviewingpurposesLabel.WordWrap = 'on';
            app.ThisisonlyforviewingpurposesLabel.FontColor = [1 1 1];
            app.ThisisonlyforviewingpurposesLabel.Position = [23 95 206 30];
            app.ThisisonlyforviewingpurposesLabel.Text = '**This is only for viewing purposes**';

            % Create Panel_9
            app.Panel_9 = uipanel(app.Panel);
            app.Panel_9.BorderType = 'none';
            app.Panel_9.BackgroundColor = [0.651 0.651 0.651];
            app.Panel_9.Position = [88 76 336 221];

            % Create Label3
            app.Label3 = uilabel(app.Panel_9);
            app.Label3.HorizontalAlignment = 'center';
            app.Label3.WordWrap = 'on';
            app.Label3.FontAngle = 'italic';
            app.Label3.FontColor = [1 1 1];
            app.Label3.Position = [18 9 292 53];
            app.Label3.Text = 'Note: Crop automatically performs an average projection for optimized cropping selection.';

            % Create SelectAreaButton
            app.SelectAreaButton = uibutton(app.Panel_9, 'state');
            app.SelectAreaButton.ValueChangedFcn = createCallbackFcn(app, @SelectAreaButtonValueChanged, true);
            app.SelectAreaButton.Text = 'Select Area';
            app.SelectAreaButton.Position = [67 160 79 28];

            % Create CreateMaskButton
            app.CreateMaskButton = uibutton(app.Panel_9, 'push');
            app.CreateMaskButton.ButtonPushedFcn = createCallbackFcn(app, @CreateMaskButtonPushed, true);
            app.CreateMaskButton.Position = [170 160 80 28];
            app.CreateMaskButton.Text = 'Create Mask';

            % Create CancelButton
            app.CancelButton = uibutton(app.Panel_9, 'push');
            app.CancelButton.ButtonPushedFcn = createCallbackFcn(app, @CancelButtonPushed, true);
            app.CancelButton.Enable = 'off';
            app.CancelButton.Position = [76 109 57 23];
            app.CancelButton.Text = 'Cancel';

            % Create ApplyButton
            app.ApplyButton = uibutton(app.Panel_9, 'push');
            app.ApplyButton.ButtonPushedFcn = createCallbackFcn(app, @ApplyButtonPushed, true);
            app.ApplyButton.Enable = 'off';
            app.ApplyButton.Position = [76 76 57 23];
            app.ApplyButton.Text = 'Apply';

            % Create SquareRegionLabel
            app.SquareRegionLabel = uilabel(app.Panel_9);
            app.SquareRegionLabel.FontSize = 9;
            app.SquareRegionLabel.FontAngle = 'italic';
            app.SquareRegionLabel.FontColor = [1 1 1];
            app.SquareRegionLabel.Position = [73 138 65 22];
            app.SquareRegionLabel.Text = 'Square Region';

            % Create FreeHandLabel
            app.FreeHandLabel = uilabel(app.Panel_9);
            app.FreeHandLabel.FontSize = 9;
            app.FreeHandLabel.FontAngle = 'italic';
            app.FreeHandLabel.FontColor = [1 1 1];
            app.FreeHandLabel.Position = [184 138 48 22];
            app.FreeHandLabel.Text = 'Free Hand';

            % Create resetcropeditLabel
            app.resetcropeditLabel = uilabel(app.Panel_9);
            app.resetcropeditLabel.FontColor = [1 1 1];
            app.resetcropeditLabel.Position = [150 110 81 22];
            app.resetcropeditLabel.Text = 'reset crop edit';

            % Create applytoallimagescannotcancelLabel
            app.applytoallimagescannotcancelLabel = uilabel(app.Panel_9);
            app.applytoallimagescannotcancelLabel.WordWrap = 'on';
            app.applytoallimagescannotcancelLabel.FontColor = [1 1 1];
            app.applytoallimagescannotcancelLabel.Position = [149 69 115 37];
            app.applytoallimagescannotcancelLabel.Text = 'apply to all images (cannot cancel)';

            % Create CropSettingsLabel
            app.CropSettingsLabel = uilabel(app.Panel_9);
            app.CropSettingsLabel.FontWeight = 'bold';
            app.CropSettingsLabel.FontColor = [1 1 1];
            app.CropSettingsLabel.Position = [118 193 84 22];
            app.CropSettingsLabel.Text = 'Crop Settings';

            % Create RawdataimagebyimageLabel
            app.RawdataimagebyimageLabel = uilabel(app.Panel);
            app.RawdataimagebyimageLabel.FontSize = 13;
            app.RawdataimagebyimageLabel.FontAngle = 'italic';
            app.RawdataimagebyimageLabel.FontColor = [1 1 1];
            app.RawdataimagebyimageLabel.Position = [221 497 157 22];
            app.RawdataimagebyimageLabel.Text = 'Raw data image-by-image';

            % Create InteractiveselectionofareatocropLabel
            app.InteractiveselectionofareatocropLabel = uilabel(app.Panel);
            app.InteractiveselectionofareatocropLabel.FontSize = 13;
            app.InteractiveselectionofareatocropLabel.FontAngle = 'italic';
            app.InteractiveselectionofareatocropLabel.FontColor = [1 1 1];
            app.InteractiveselectionofareatocropLabel.Position = [221 447 219 22];
            app.InteractiveselectionofareatocropLabel.Text = 'Interactive selection of area to crop';

            % Create MeanimagestackprojectionLabel
            app.MeanimagestackprojectionLabel = uilabel(app.Panel);
            app.MeanimagestackprojectionLabel.FontSize = 13;
            app.MeanimagestackprojectionLabel.FontAngle = 'italic';
            app.MeanimagestackprojectionLabel.FontColor = [1 1 1];
            app.MeanimagestackprojectionLabel.Position = [221 393 170 22];
            app.MeanimagestackprojectionLabel.Text = 'Mean image stack projection';

            % Create InteractivecontrasttoolviewingonlyLabel
            app.InteractivecontrasttoolviewingonlyLabel = uilabel(app.Panel);
            app.InteractivecontrasttoolviewingonlyLabel.FontSize = 13;
            app.InteractivecontrasttoolviewingonlyLabel.FontAngle = 'italic';
            app.InteractivecontrasttoolviewingonlyLabel.FontColor = [1 1 1];
            app.InteractivecontrasttoolviewingonlyLabel.Position = [221 337 229 22];
            app.InteractivecontrasttoolviewingonlyLabel.Text = 'Interactive contrast tool (viewing only)';

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
            app.MainParametersPanel.Position = [23 472 1218 362];

            % Create SaveCurrentParametersLabel
            app.SaveCurrentParametersLabel = uilabel(app.MainParametersPanel);
            app.SaveCurrentParametersLabel.FontColor = [1 1 1];
            app.SaveCurrentParametersLabel.Position = [287 100 141 22];
            app.SaveCurrentParametersLabel.Text = 'Save Current Parameters';

            % Create Label2_6
            app.Label2_6 = uilabel(app.MainParametersPanel);
            app.Label2_6.WordWrap = 'on';
            app.Label2_6.FontColor = [1 1 1];
            app.Label2_6.Position = [993 274 193 29];
            app.Label2_6.Text = 'Breaks up the image into squares with patchSize pixels on each side.';

            % Create Label2_5
            app.Label2_5 = uilabel(app.MainParametersPanel);
            app.Label2_5.WordWrap = 'on';
            app.Label2_5.FontSize = 11;
            app.Label2_5.FontAngle = 'italic';
            app.Label2_5.FontColor = [1 1 1];
            app.Label2_5.Position = [390 169 296 41];
            app.Label2_5.Text = 'Note: the final number of coefficients may be less than this due to lack of data variance and merging of components.';

            % Create LambdaEditField_2Label
            app.LambdaEditField_2Label = uilabel(app.MainParametersPanel);
            app.LambdaEditField_2Label.HorizontalAlignment = 'right';
            app.LambdaEditField_2Label.FontColor = [1 1 1];
            app.LambdaEditField_2Label.Position = [137 289 49 22];
            app.LambdaEditField_2Label.Text = 'Lambda';

            % Create LamCorrEditField_2Label
            app.LamCorrEditField_2Label = uilabel(app.MainParametersPanel);
            app.LamCorrEditField_2Label.HorizontalAlignment = 'right';
            app.LamCorrEditField_2Label.FontColor = [1 1 1];
            app.LamCorrEditField_2Label.Position = [133 219 54 22];
            app.LamCorrEditField_2Label.Text = 'LamCorr';

            % Create NumberofComponentsEditField_2Label
            app.NumberofComponentsEditField_2Label = uilabel(app.MainParametersPanel);
            app.NumberofComponentsEditField_2Label.HorizontalAlignment = 'right';
            app.NumberofComponentsEditField_2Label.WordWrap = 'on';
            app.NumberofComponentsEditField_2Label.FontColor = [1 1 1];
            app.NumberofComponentsEditField_2Label.Position = [54 172 135 35];
            app.NumberofComponentsEditField_2Label.Text = 'Number of Components';

            % Create PatchSizeEditField_2Label
            app.PatchSizeEditField_2Label = uilabel(app.MainParametersPanel);
            app.PatchSizeEditField_2Label.HorizontalAlignment = 'right';
            app.PatchSizeEditField_2Label.FontColor = [1 1 1];
            app.PatchSizeEditField_2Label.Position = [801 278 63 22];
            app.PatchSizeEditField_2Label.Text = 'Patch Size';

            % Create LamForbEditField_2Label
            app.LamForbEditField_2Label = uilabel(app.MainParametersPanel);
            app.LamForbEditField_2Label.HorizontalAlignment = 'right';
            app.LamForbEditField_2Label.FontColor = [1 1 1];
            app.LamForbEditField_2Label.Position = [133 255 54 22];
            app.LamForbEditField_2Label.Text = 'LamForb';

            % Create PerpatchNoteLabel
            app.PerpatchNoteLabel = uilabel(app.MainParametersPanel);
            app.PerpatchNoteLabel.WordWrap = 'on';
            app.PerpatchNoteLabel.FontColor = [1 1 1];
            app.PerpatchNoteLabel.Position = [317 178 68 22];
            app.PerpatchNoteLabel.Text = 'Per patch';

            % Create PreventoverslycorrelateddictionaryelementsLabel
            app.PreventoverslycorrelateddictionaryelementsLabel = uilabel(app.MainParametersPanel);
            app.PreventoverslycorrelateddictionaryelementsLabel.FontColor = [1 1 1];
            app.PreventoverslycorrelateddictionaryelementsLabel.Position = [317 219 253 22];
            app.PreventoverslycorrelateddictionaryelementsLabel.Text = 'Prevent oversly correlated dictionary elements';

            % Create ExtratimetraceweightLabel
            app.ExtratimetraceweightLabel = uilabel(app.MainParametersPanel);
            app.ExtratimetraceweightLabel.FontColor = [1 1 1];
            app.ExtratimetraceweightLabel.Position = [317 255 128 22];
            app.ExtratimetraceweightLabel.Text = 'Extra time-trace weight';

            % Create SparsityLabel
            app.SparsityLabel = uilabel(app.MainParametersPanel);
            app.SparsityLabel.FontColor = [1 1 1];
            app.SparsityLabel.Position = [317 289 105 22];
            app.SparsityLabel.Text = 'Sparsity';

            % Create SetButton
            app.SetButton = uibutton(app.MainParametersPanel, 'push');
            app.SetButton.ButtonPushedFcn = createCallbackFcn(app, @SetButtonPushed, true);
            app.SetButton.Position = [215 100 52 23];
            app.SetButton.Text = 'Set';

            % Create AdvancedButton
            app.AdvancedButton = uibutton(app.MainParametersPanel, 'push');
            app.AdvancedButton.ButtonPushedFcn = createCallbackFcn(app, @AdvancedButtonPushed, true);
            app.AdvancedButton.Position = [85 66 100 22];
            app.AdvancedButton.Text = 'Advanced';

            % Create DefaultsButton
            app.DefaultsButton = uibutton(app.MainParametersPanel, 'state');
            app.DefaultsButton.ValueChangedFcn = createCallbackFcn(app, @DefaultsButtonValueChanged, true);
            app.DefaultsButton.Text = 'Defaults';
            app.DefaultsButton.Position = [85 100 100 23];

            % Create PlotCheckBox
            app.PlotCheckBox = uicheckbox(app.MainParametersPanel);
            app.PlotCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.PlotCheckBox.Text = 'Plot';
            app.PlotCheckBox.FontColor = [1 1 1];
            app.PlotCheckBox.Position = [686 240 43 22];
            app.PlotCheckBox.Value = true;

            % Create PatchSizeEditField_2
            app.PatchSizeEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.PatchSizeEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.PatchSizeEditField_2.Position = [875 278 100 22];
            app.PatchSizeEditField_2.Value = 50;

            % Create UsePatchCheckBox_2
            app.UsePatchCheckBox_2 = uicheckbox(app.MainParametersPanel);
            app.UsePatchCheckBox_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.UsePatchCheckBox_2.Text = 'Use Patch';
            app.UsePatchCheckBox_2.FontColor = [1 1 1];
            app.UsePatchCheckBox_2.Position = [686 278 109 22];
            app.UsePatchCheckBox_2.Value = true;

            % Create NumberofComponentsEditField_2
            app.NumberofComponentsEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.NumberofComponentsEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.NumberofComponentsEditField_2.Position = [198 178 100 22];
            app.NumberofComponentsEditField_2.Value = 5;

            % Create LamCorrEditField_2
            app.LamCorrEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.LamCorrEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LamCorrEditField_2.Position = [198 219 100 22];
            app.LamCorrEditField_2.Value = 0.1;

            % Create LamForbEditField_2
            app.LamForbEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.LamForbEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LamForbEditField_2.Position = [198 255 99 22];
            app.LamForbEditField_2.Value = 0.2;

            % Create LambdaEditField_2
            app.LambdaEditField_2 = uieditfield(app.MainParametersPanel, 'numeric');
            app.LambdaEditField_2.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LambdaEditField_2.Position = [198 289 100 22];
            app.LambdaEditField_2.Value = 0.05;

            % Create RunGraFTButton
            app.RunGraFTButton = uibutton(app.MainParametersPanel, 'push');
            app.RunGraFTButton.ButtonPushedFcn = createCallbackFcn(app, @RunGraFTButtonPushed, true);
            app.RunGraFTButton.Enable = 'off';
            app.RunGraFTButton.Position = [1017 66 92 42];
            app.RunGraFTButton.Text = 'Run GraFT';

            % Create ResultsButton
            app.ResultsButton = uibutton(app.MainParametersPanel, 'push');
            app.ResultsButton.ButtonPushedFcn = createCallbackFcn(app, @ResultsButtonPushed, true);
            app.ResultsButton.Visible = 'off';
            app.ResultsButton.Position = [1017 115 90 23];
            app.ResultsButton.Text = 'Results';

            % Create PlottingperpatchdisabledLabel
            app.PlottingperpatchdisabledLabel = uilabel(app.MainParametersPanel);
            app.PlottingperpatchdisabledLabel.FontColor = [1 1 1];
            app.PlottingperpatchdisabledLabel.Position = [742 240 154 22];
            app.PlottingperpatchdisabledLabel.Text = '(Plotting per patch disabled)';

            % Create AdvancedOptionsPanel
            app.AdvancedOptionsPanel = uipanel(app.GraFTTab);
            app.AdvancedOptionsPanel.ForegroundColor = [0.0706 0.6196 1];
            app.AdvancedOptionsPanel.BorderType = 'none';
            app.AdvancedOptionsPanel.Title = 'Advanced Options';
            app.AdvancedOptionsPanel.BackgroundColor = [0.8 0.8 0.8];
            app.AdvancedOptionsPanel.FontWeight = 'bold';
            app.AdvancedOptionsPanel.FontSize = 14;
            app.AdvancedOptionsPanel.Position = [25 116 1216 341];

            % Create ContinuityTermEditFieldLabel
            app.ContinuityTermEditFieldLabel = uilabel(app.AdvancedOptionsPanel);
            app.ContinuityTermEditFieldLabel.HorizontalAlignment = 'right';
            app.ContinuityTermEditFieldLabel.FontColor = [1 1 1];
            app.ContinuityTermEditFieldLabel.Position = [93 262 88 22];
            app.ContinuityTermEditFieldLabel.Text = 'Continuity Term';

            % Create LevelofverboseoutputLabel
            app.LevelofverboseoutputLabel = uilabel(app.AdvancedOptionsPanel);
            app.LevelofverboseoutputLabel.FontColor = [1 1 1];
            app.LevelofverboseoutputLabel.Position = [337 165 130 22];
            app.LevelofverboseoutputLabel.Text = 'Level of verbose output';

            % Create DecayrateofthecontinuationparameterLabel
            app.DecayrateofthecontinuationparameterLabel = uilabel(app.AdvancedOptionsPanel);
            app.DecayrateofthecontinuationparameterLabel.FontColor = [1 1 1];
            app.DecayrateofthecontinuationparameterLabel.Position = [337 198 224 22];
            app.DecayrateofthecontinuationparameterLabel.Text = 'Decay rate of the continuation parameter';

            % Create InitializecorrelationkernelstructureLabel
            app.InitializecorrelationkernelstructureLabel = uilabel(app.AdvancedOptionsPanel);
            app.InitializecorrelationkernelstructureLabel.FontColor = [1 1 1];
            app.InitializecorrelationkernelstructureLabel.Position = [332 74 199 22];
            app.InitializecorrelationkernelstructureLabel.Text = 'Initialize correlation kernel structure';

            % Create SpatialSmoothingKernelLabel
            app.SpatialSmoothingKernelLabel = uilabel(app.AdvancedOptionsPanel);
            app.SpatialSmoothingKernelLabel.FontWeight = 'bold';
            app.SpatialSmoothingKernelLabel.FontColor = [1 1 1];
            app.SpatialSmoothingKernelLabel.Position = [96 105 155 22];
            app.SpatialSmoothingKernelLabel.Text = 'Spatial Smoothing Kernel';

            % Create GradientTypeDropDownLabel
            app.GradientTypeDropDownLabel = uilabel(app.AdvancedOptionsPanel);
            app.GradientTypeDropDownLabel.HorizontalAlignment = 'right';
            app.GradientTypeDropDownLabel.FontColor = [1 1 1];
            app.GradientTypeDropDownLabel.Position = [101 229 80 22];
            app.GradientTypeDropDownLabel.Text = 'Gradient Type';

            % Create ContDecayEditFieldLabel
            app.ContDecayEditFieldLabel = uilabel(app.AdvancedOptionsPanel);
            app.ContDecayEditFieldLabel.HorizontalAlignment = 'right';
            app.ContDecayEditFieldLabel.FontColor = [1 1 1];
            app.ContDecayEditFieldLabel.Position = [110 198 71 22];
            app.ContDecayEditFieldLabel.Text = 'Cont. Decay';

            % Create VerboseSpinnerLabel
            app.VerboseSpinnerLabel = uilabel(app.AdvancedOptionsPanel);
            app.VerboseSpinnerLabel.HorizontalAlignment = 'right';
            app.VerboseSpinnerLabel.FontColor = [1 1 1];
            app.VerboseSpinnerLabel.Position = [131 165 50 22];
            app.VerboseSpinnerLabel.Text = 'Verbose';

            % Create CorrelationTypeDropDownLabel
            app.CorrelationTypeDropDownLabel = uilabel(app.AdvancedOptionsPanel);
            app.CorrelationTypeDropDownLabel.HorizontalAlignment = 'right';
            app.CorrelationTypeDropDownLabel.FontColor = [1 1 1];
            app.CorrelationTypeDropDownLabel.Position = [127 38 93 22];
            app.CorrelationTypeDropDownLabel.Text = 'Correlation Type';

            % Create ControlhowmuchtoweighthepreviousestimateLabel
            app.ControlhowmuchtoweighthepreviousestimateLabel = uilabel(app.AdvancedOptionsPanel);
            app.ControlhowmuchtoweighthepreviousestimateLabel.FontColor = [1 1 1];
            app.ControlhowmuchtoweighthepreviousestimateLabel.Position = [337 262 270 22];
            app.ControlhowmuchtoweighthepreviousestimateLabel.Text = 'Control how much to weigh the previous estimate';

            % Create TypeofdictionaryupdateLabel
            app.TypeofdictionaryupdateLabel = uilabel(app.AdvancedOptionsPanel);
            app.TypeofdictionaryupdateLabel.FontColor = [1 1 1];
            app.TypeofdictionaryupdateLabel.Position = [336 229 139 22];
            app.TypeofdictionaryupdateLabel.Text = 'Type of dictionary update';

            % Create CorrelationTypeDropDown
            app.CorrelationTypeDropDown = uidropdown(app.AdvancedOptionsPanel);
            app.CorrelationTypeDropDown.Items = {'embedding', 'convolution'};
            app.CorrelationTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.CorrelationTypeDropDown.Position = [235 38 112 22];
            app.CorrelationTypeDropDown.Value = 'embedding';

            % Create W_timeEditField
            app.W_timeEditField = uieditfield(app.AdvancedOptionsPanel, 'numeric');
            app.W_timeEditField.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.W_timeEditField.Position = [196 76 104 22];

            % Create LikelyFormDropDownLabel
            app.LikelyFormDropDownLabel = uilabel(app.AdvancedOptionsPanel);
            app.LikelyFormDropDownLabel.HorizontalAlignment = 'right';
            app.LikelyFormDropDownLabel.FontColor = [1 1 1];
            app.LikelyFormDropDownLabel.Enable = 'off';
            app.LikelyFormDropDownLabel.Position = [869 263 67 22];
            app.LikelyFormDropDownLabel.Text = 'Likely Form';

            % Create LikelyFormDropDown
            app.LikelyFormDropDown = uidropdown(app.AdvancedOptionsPanel);
            app.LikelyFormDropDown.Items = {'gaussian', 'poisson'};
            app.LikelyFormDropDown.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.LikelyFormDropDown.Enable = 'off';
            app.LikelyFormDropDown.Position = [951 263 100 22];
            app.LikelyFormDropDown.Value = 'gaussian';

            % Create ReduceDimCheckBox
            app.ReduceDimCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.ReduceDimCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.ReduceDimCheckBox.Enable = 'off';
            app.ReduceDimCheckBox.Text = 'Reduce Dim';
            app.ReduceDimCheckBox.FontColor = [1 1 1];
            app.ReduceDimCheckBox.Position = [608 74 92 22];
            app.ReduceDimCheckBox.Value = true;

            % Create CreateMemmapCheckBox
            app.CreateMemmapCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.CreateMemmapCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.CreateMemmapCheckBox.Enable = 'off';
            app.CreateMemmapCheckBox.Text = 'Create Memmap';
            app.CreateMemmapCheckBox.FontColor = [1 1 1];
            app.CreateMemmapCheckBox.Position = [874 230 111 22];

            % Create NormalizeSpatialCheckBox
            app.NormalizeSpatialCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.NormalizeSpatialCheckBox.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.NormalizeSpatialCheckBox.Enable = 'off';
            app.NormalizeSpatialCheckBox.Text = 'Normalize Spatial';
            app.NormalizeSpatialCheckBox.FontColor = [1 1 1];
            app.NormalizeSpatialCheckBox.Position = [874 199 116 22];
            app.NormalizeSpatialCheckBox.Value = true;

            % Create VerboseSpinner
            app.VerboseSpinner = uispinner(app.AdvancedOptionsPanel);
            app.VerboseSpinner.Limits = [0 10];
            app.VerboseSpinner.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.VerboseSpinner.Position = [196 165 100 22];

            % Create ContDecayEditField
            app.ContDecayEditField = uieditfield(app.AdvancedOptionsPanel, 'numeric');
            app.ContDecayEditField.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.ContDecayEditField.Position = [196 198 100 22];
            app.ContDecayEditField.Value = 0.9;

            % Create GradientTypeDropDown
            app.GradientTypeDropDown = uidropdown(app.AdvancedOptionsPanel);
            app.GradientTypeDropDown.Items = {'Full Optimization', 'Norm'};
            app.GradientTypeDropDown.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.GradientTypeDropDown.Position = [196 229 122 22];
            app.GradientTypeDropDown.Value = 'Full Optimization';

            % Create ContinuityTermEditField
            app.ContinuityTermEditField = uieditfield(app.AdvancedOptionsPanel, 'numeric');
            app.ContinuityTermEditField.ValueChangedFcn = createCallbackFcn(app, @LambdaEditField_2ValueChanged, true);
            app.ContinuityTermEditField.Position = [196 262 100 22];
            app.ContinuityTermEditField.Value = 0.1;

            % Create W_timeEditFieldLabel
            app.W_timeEditFieldLabel = uilabel(app.AdvancedOptionsPanel);
            app.W_timeEditFieldLabel.HorizontalAlignment = 'right';
            app.W_timeEditFieldLabel.FontColor = [1 1 1];
            app.W_timeEditFieldLabel.Position = [135 76 46 22];
            app.W_timeEditFieldLabel.Text = 'W_time';

            % Create NormalizeTemporalCheckBox
            app.NormalizeTemporalCheckBox = uicheckbox(app.AdvancedOptionsPanel);
            app.NormalizeTemporalCheckBox.Enable = 'off';
            app.NormalizeTemporalCheckBox.Text = 'Normalize Temporal';
            app.NormalizeTemporalCheckBox.FontColor = [1 1 1];
            app.NormalizeTemporalCheckBox.Position = [1017 199 128 22];

            % Create Panel_4
            app.Panel_4 = uipanel(app.GraFTTab);
            app.Panel_4.ForegroundColor = [0.0706 0.6196 1];
            app.Panel_4.BorderType = 'none';
            app.Panel_4.BackgroundColor = [0.651 0.651 0.651];
            app.Panel_4.FontWeight = 'bold';
            app.Panel_4.FontSize = 14;
            app.Panel_4.Position = [2 7 1265 841];

            % Create BackButton_2
            app.BackButton_2 = uibutton(app.Panel_4, 'push');
            app.BackButton_2.ButtonPushedFcn = createCallbackFcn(app, @BackButton_2Pushed, true);
            app.BackButton_2.Position = [26 39 77 38];
            app.BackButton_2.Text = 'Back';

            % Create AppStatusPanel_2
            app.AppStatusPanel_2 = uipanel(app.Panel_4);
            app.AppStatusPanel_2.ForegroundColor = [0.0706 0.6196 1];
            app.AppStatusPanel_2.BorderType = 'none';
            app.AppStatusPanel_2.Title = 'App Status';
            app.AppStatusPanel_2.BackgroundColor = [0.8 0.8 0.8];
            app.AppStatusPanel_2.FontWeight = 'bold';
            app.AppStatusPanel_2.FontSize = 14;
            app.AppStatusPanel_2.Position = [27 92 525 733];

            % Create OutputhereLabel
            app.OutputhereLabel = uilabel(app.AppStatusPanel_2);
            app.OutputhereLabel.VerticalAlignment = 'top';
            app.OutputhereLabel.WordWrap = 'on';
            app.OutputhereLabel.FontColor = [1 1 1];
            app.OutputhereLabel.Position = [8 17 512 676];
            app.OutputhereLabel.Text = 'Output here';

            % Create SavePanel
            app.SavePanel = uipanel(app.Panel_4);
            app.SavePanel.ForegroundColor = [0.0706 0.6196 1];
            app.SavePanel.BorderType = 'none';
            app.SavePanel.Title = 'Save';
            app.SavePanel.BackgroundColor = [0.8 0.8 0.8];
            app.SavePanel.FontWeight = 'bold';
            app.SavePanel.FontSize = 14;
            app.SavePanel.Position = [607 21 644 808];

            % Create SaveButton
            app.SaveButton = uibutton(app.SavePanel, 'push');
            app.SaveButton.ButtonPushedFcn = createCallbackFcn(app, @SaveButtonPushed, true);
            app.SaveButton.Position = [513 61 85 23];
            app.SaveButton.Text = 'Save';

            % Create ChangeButton
            app.ChangeButton = uibutton(app.SavePanel, 'push');
            app.ChangeButton.ButtonPushedFcn = createCallbackFcn(app, @ChangeButtonPushed, true);
            app.ChangeButton.Position = [445 708 100 23];
            app.ChangeButton.Text = 'Change';

            % Create KeeporiginaldataFsimCheckBox
            app.KeeporiginaldataFsimCheckBox = uicheckbox(app.SavePanel);
            app.KeeporiginaldataFsimCheckBox.Text = 'Keep original data (Fsim)';
            app.KeeporiginaldataFsimCheckBox.FontColor = [1 1 1];
            app.KeeporiginaldataFsimCheckBox.Position = [45 215 156 22];

            % Create DataPropertiesLabel
            app.DataPropertiesLabel = uilabel(app.SavePanel);
            app.DataPropertiesLabel.FontWeight = 'bold';
            app.DataPropertiesLabel.FontColor = [1 1 1];
            app.DataPropertiesLabel.Position = [6 668 98 22];
            app.DataPropertiesLabel.Text = 'Data Properties:';

            % Create CurrentDirectoryLabel
            app.CurrentDirectoryLabel = uilabel(app.SavePanel);
            app.CurrentDirectoryLabel.FontColor = [1 1 1];
            app.CurrentDirectoryLabel.Position = [12 738 100 22];
            app.CurrentDirectoryLabel.Text = 'Current Directory:';

            % Create Label_7
            app.Label_7 = uilabel(app.SavePanel);
            app.Label_7.FontColor = [1 1 1];
            app.Label_7.Position = [112 738 389 22];

            % Create SaveNameLabel
            app.SaveNameLabel = uilabel(app.SavePanel);
            app.SaveNameLabel.FontWeight = 'bold';
            app.SaveNameLabel.FontColor = [1 1 1];
            app.SaveNameLabel.Position = [48 177 73 22];
            app.SaveNameLabel.Text = 'Save Name:';

            % Create FormatDropDownLabel
            app.FormatDropDownLabel = uilabel(app.SavePanel);
            app.FormatDropDownLabel.HorizontalAlignment = 'right';
            app.FormatDropDownLabel.FontColor = [1 1 1];
            app.FormatDropDownLabel.Position = [384 62 43 22];
            app.FormatDropDownLabel.Text = 'Format';

            % Create FormatDropDown
            app.FormatDropDown = uidropdown(app.SavePanel);
            app.FormatDropDown.Items = {'.mat'};
            app.FormatDropDown.Position = [434 62 67 22];
            app.FormatDropDown.Value = '.mat';

            % Create Panel_5
            app.Panel_5 = uipanel(app.SavePanel);
            app.Panel_5.BackgroundColor = [0.502 0.502 0.502];
            app.Panel_5.Position = [10 259 592 394];

            % Create Label_6
            app.Label_6 = uilabel(app.Panel_5);
            app.Label_6.VerticalAlignment = 'top';
            app.Label_6.WordWrap = 'on';
            app.Label_6.FontColor = [1 1 1];
            app.Label_6.Position = [13 11 555 373];
            app.Label_6.Text = '';

            % Create SeeResultsButton
            app.SeeResultsButton = uibutton(app.SavePanel, 'push');
            app.SeeResultsButton.ButtonPushedFcn = createCallbackFcn(app, @SeeResultsButtonPushed, true);
            app.SeeResultsButton.Position = [45 56 100 33];
            app.SeeResultsButton.Text = 'See Results';

            % Create EditField
            app.EditField = uieditfield(app.SavePanel, 'text');
            app.EditField.Position = [132 177 458 22];

            % Create ResultsTab
            app.ResultsTab = uitab(app.TabGroup);
            app.ResultsTab.Title = 'Results';

            % Create Panel_7
            app.Panel_7 = uipanel(app.ResultsTab);
            app.Panel_7.BorderType = 'none';
            app.Panel_7.BackgroundColor = [0.8 0.8 0.8];
            app.Panel_7.Position = [37 50 1193 448];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.Panel_7);
            app.UIAxes2.XTick = [];
            app.UIAxes2.YTick = [];
            app.UIAxes2.ZTick = [];
            app.UIAxes2.Position = [189 9 487 429];

            % Create UIAxes3
            app.UIAxes3 = uiaxes(app.Panel_7);
            app.UIAxes3.XTick = [];
            app.UIAxes3.YTick = [];
            app.UIAxes3.ZTick = [];
            app.UIAxes3.Position = [686 9 491 432];

            % Create Button_5
            app.Button_5 = uibutton(app.Panel_7, 'push');
            app.Button_5.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_5.BackgroundColor = [0.8 0.8 0.8];
            app.Button_5.FontColor = [1 1 1];
            app.Button_5.Position = [104 212 67 23];
            app.Button_5.Text = '>';

            % Create Button_6
            app.Button_6 = uibutton(app.Panel_7, 'push');
            app.Button_6.ButtonPushedFcn = createCallbackFcn(app, @Button_6Pushed, true);
            app.Button_6.BackgroundColor = [0.8 0.8 0.8];
            app.Button_6.FontColor = [1 1 1];
            app.Button_6.Position = [21 212 67 23];
            app.Button_6.Text = '<';

            % Create IM_NUMLabel
            app.IM_NUMLabel = uilabel(app.Panel_7);
            app.IM_NUMLabel.FontColor = [1 1 1];
            app.IM_NUMLabel.Position = [116 117 79 22];
            app.IM_NUMLabel.Text = 'IM_NUM';

            % Create CurrentROILabel
            app.CurrentROILabel = uilabel(app.Panel_7);
            app.CurrentROILabel.FontWeight = 'bold';
            app.CurrentROILabel.FontColor = [1 1 1];
            app.CurrentROILabel.Position = [31 117 77 22];
            app.CurrentROILabel.Text = 'Current ROI:';

            % Create HidePanelButton
            app.HidePanelButton = uibutton(app.Panel_7, 'push');
            app.HidePanelButton.ButtonPushedFcn = createCallbackFcn(app, @HidePanelButtonPushed, true);
            app.HidePanelButton.Position = [16 18 65 34];
            app.HidePanelButton.Text = 'Hide Panel';

            % Create INDEPTHRESULTSButton
            app.INDEPTHRESULTSButton = uibutton(app.Panel_7, 'push');
            app.INDEPTHRESULTSButton.ButtonPushedFcn = createCallbackFcn(app, @INDEPTHRESULTSButtonPushed, true);
            app.INDEPTHRESULTSButton.WordWrap = 'on';
            app.INDEPTHRESULTSButton.FontWeight = 'bold';
            app.INDEPTHRESULTSButton.Position = [28 326 134 68];
            app.INDEPTHRESULTSButton.Text = 'IN-DEPTH RESULTS';

            % Create ViewallspatialtimetracessimultaneouslyLabel
            app.ViewallspatialtimetracessimultaneouslyLabel = uilabel(app.Panel_7);
            app.ViewallspatialtimetracessimultaneouslyLabel.HorizontalAlignment = 'center';
            app.ViewallspatialtimetracessimultaneouslyLabel.WordWrap = 'on';
            app.ViewallspatialtimetracessimultaneouslyLabel.FontSize = 13;
            app.ViewallspatialtimetracessimultaneouslyLabel.FontAngle = 'italic';
            app.ViewallspatialtimetracessimultaneouslyLabel.FontColor = [1 1 1];
            app.ViewallspatialtimetracessimultaneouslyLabel.Position = [22 278 141 42];
            app.ViewallspatialtimetracessimultaneouslyLabel.Text = 'View all spatial/time traces simultaneously';

            % Create ControlindividualspatialtimetracesLabel
            app.ControlindividualspatialtimetracesLabel = uilabel(app.Panel_7);
            app.ControlindividualspatialtimetracesLabel.HorizontalAlignment = 'center';
            app.ControlindividualspatialtimetracesLabel.WordWrap = 'on';
            app.ControlindividualspatialtimetracesLabel.FontSize = 13;
            app.ControlindividualspatialtimetracesLabel.FontAngle = 'italic';
            app.ControlindividualspatialtimetracesLabel.FontColor = [1 1 1];
            app.ControlindividualspatialtimetracesLabel.Position = [24 153 137 42];
            app.ControlindividualspatialtimetracesLabel.Text = 'Control individual spatial/time traces';

            % Create LoadResultsPanel
            app.LoadResultsPanel = uipanel(app.ResultsTab);
            app.LoadResultsPanel.ForegroundColor = [0.0745 0.6235 1];
            app.LoadResultsPanel.BorderType = 'none';
            app.LoadResultsPanel.Title = 'Load Results';
            app.LoadResultsPanel.BackgroundColor = [0.8 0.8 0.8];
            app.LoadResultsPanel.FontWeight = 'bold';
            app.LoadResultsPanel.FontSize = 14;
            app.LoadResultsPanel.Position = [10 562 1193 278];

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
            app.Label_9.Position = [158 217 1001 22];

            % Create ChangeButton_2
            app.ChangeButton_2 = uibutton(app.LoadResultsPanel, 'push');
            app.ChangeButton_2.ButtonPushedFcn = createCallbackFcn(app, @ChangeButtonPushed, true);
            app.ChangeButton_2.BackgroundColor = [0.502 0.502 0.502];
            app.ChangeButton_2.FontColor = [1 1 1];
            app.ChangeButton_2.Position = [57 175 99 23];
            app.ChangeButton_2.Text = 'Change';

            % Create ViewButton_2
            app.ViewButton_2 = uibutton(app.LoadResultsPanel, 'push');
            app.ViewButton_2.ButtonPushedFcn = createCallbackFcn(app, @ViewButton_2Pushed, true);
            app.ViewButton_2.BackgroundColor = [0.502 0.502 0.502];
            app.ViewButton_2.FontSize = 13;
            app.ViewButton_2.FontColor = [1 1 1];
            app.ViewButton_2.Position = [310 7 100 40];
            app.ViewButton_2.Text = 'View';

            % Create InDepthResultsPanel
            app.InDepthResultsPanel = uipanel(app.ResultsTab);
            app.InDepthResultsPanel.ForegroundColor = [0.0745 0.6235 1];
            app.InDepthResultsPanel.BorderType = 'none';
            app.InDepthResultsPanel.Title = 'In-Depth Results';
            app.InDepthResultsPanel.BackgroundColor = [0.8 0.8 0.8];
            app.InDepthResultsPanel.FontWeight = 'bold';
            app.InDepthResultsPanel.FontSize = 14;
            app.InDepthResultsPanel.Position = [13 7 1239 833];

            % Create UIAxes4
            app.UIAxes4 = uiaxes(app.InDepthResultsPanel);
            zlabel(app.UIAxes4, 'Z')
            app.UIAxes4.XTick = [];
            app.UIAxes4.YTick = [];
            app.UIAxes4.Position = [133 395 441 399];

            % Create ProfilesLabel
            app.ProfilesLabel = uilabel(app.InDepthResultsPanel);
            app.ProfilesLabel.FontSize = 14;
            app.ProfilesLabel.FontWeight = 'bold';
            app.ProfilesLabel.FontColor = [1 1 1];
            app.ProfilesLabel.Position = [44 769 56 22];
            app.ProfilesLabel.Text = 'Profiles';

            % Create Panel_11
            app.Panel_11 = uipanel(app.InDepthResultsPanel);
            app.Panel_11.BackgroundColor = [0.651 0.651 0.651];
            app.Panel_11.Position = [0 0 1240 393];

            % Create UIAxes5
            app.UIAxes5 = uiaxes(app.Panel_11);
            zlabel(app.UIAxes5, 'Z')
            app.UIAxes5.XTick = [];
            app.UIAxes5.YTick = [];
            app.UIAxes5.Position = [9 92 376 293];

            % Create SourceProfileLabel
            app.SourceProfileLabel = uilabel(app.Panel_11);
            app.SourceProfileLabel.FontSize = 14;
            app.SourceProfileLabel.FontWeight = 'bold';
            app.SourceProfileLabel.FontColor = [1 1 1];
            app.SourceProfileLabel.Position = [393 362 100 22];
            app.SourceProfileLabel.Text = 'Source Profile';

            % Create AddRemoveButton
            app.AddRemoveButton = uibutton(app.Panel_11, 'push');
            app.AddRemoveButton.ButtonPushedFcn = createCallbackFcn(app, @AddRemoveButtonPushed, true);
            app.AddRemoveButton.Position = [71 22 91 23];
            app.AddRemoveButton.Text = 'Add / Remove';

            % Create ClassifyArtifactProfilesLabel
            app.ClassifyArtifactProfilesLabel = uilabel(app.Panel_11);
            app.ClassifyArtifactProfilesLabel.FontSize = 13;
            app.ClassifyArtifactProfilesLabel.FontWeight = 'bold';
            app.ClassifyArtifactProfilesLabel.FontColor = [1 1 1];
            app.ClassifyArtifactProfilesLabel.Position = [48 61 155 22];
            app.ClassifyArtifactProfilesLabel.Text = 'Classify Artifact Profiles';

            % Create Panel_14
            app.Panel_14 = uipanel(app.Panel_11);
            app.Panel_14.BorderType = 'none';
            app.Panel_14.Scrollable = 'on';
            app.Panel_14.Position = [501 21 728 364];

            % Create Panel_15
            app.Panel_15 = uipanel(app.Panel_14);
            app.Panel_15.BorderType = 'none';
            app.Panel_15.Position = [-56 1 1219 362];

            % Create ListBox_2
            app.ListBox_2 = uilistbox(app.Panel_11);
            app.ListBox_2.Multiselect = 'on';
            app.ListBox_2.ValueChangedFcn = createCallbackFcn(app, @ListBox_2ValueChanged, true);
            app.ListBox_2.FontColor = [1 1 1];
            app.ListBox_2.BackgroundColor = [0.902 0.902 0.902];
            app.ListBox_2.Position = [410 110 67 244];
            app.ListBox_2.Value = {'Item 1'};

            % Create TextArea_2
            app.TextArea_2 = uitextarea(app.Panel_11);
            app.TextArea_2.Editable = 'off';
            app.TextArea_2.HorizontalAlignment = 'center';
            app.TextArea_2.FontColor = [1 1 1];
            app.TextArea_2.Visible = 'off';
            app.TextArea_2.Position = [281 21 98 62];

            % Create ArtifactListLabel
            app.ArtifactListLabel = uilabel(app.Panel_11);
            app.ArtifactListLabel.FontColor = [1 1 1];
            app.ArtifactListLabel.Visible = 'off';
            app.ArtifactListLabel.Position = [206 22 68 22];
            app.ArtifactListLabel.Text = 'Artifact List:';

            % Create LeftClicktoSelectLabel
            app.LeftClicktoSelectLabel = uilabel(app.InDepthResultsPanel);
            app.LeftClicktoSelectLabel.HorizontalAlignment = 'center';
            app.LeftClicktoSelectLabel.FontAngle = 'italic';
            app.LeftClicktoSelectLabel.FontColor = [1 1 1];
            app.LeftClicktoSelectLabel.Position = [27 662 105 22];
            app.LeftClicktoSelectLabel.Text = 'Left-Click to Select';

            % Create TimeTracesButtonGroup
            app.TimeTracesButtonGroup = uibuttongroup(app.InDepthResultsPanel);
            app.TimeTracesButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @TimeTracesButtonGroupSelectionChanged, true);
            app.TimeTracesButtonGroup.ForegroundColor = [1 1 1];
            app.TimeTracesButtonGroup.TitlePosition = 'centertop';
            app.TimeTracesButtonGroup.Title = 'Time Traces';
            app.TimeTracesButtonGroup.BackgroundColor = [0.8 0.8 0.8];
            app.TimeTracesButtonGroup.Position = [13 557 115 78];

            % Create LineButton
            app.LineButton = uiradiobutton(app.TimeTracesButtonGroup);
            app.LineButton.Text = 'Line';
            app.LineButton.FontColor = [1 1 1];
            app.LineButton.Position = [11 32 45 22];
            app.LineButton.Value = true;

            % Create ImageButton
            app.ImageButton = uiradiobutton(app.TimeTracesButtonGroup);
            app.ImageButton.Text = 'Image';
            app.ImageButton.FontColor = [1 1 1];
            app.ImageButton.Position = [11 10 55 22];

            % Create CurrentPositionEditFieldLabel
            app.CurrentPositionEditFieldLabel = uilabel(app.InDepthResultsPanel);
            app.CurrentPositionEditFieldLabel.HorizontalAlignment = 'right';
            app.CurrentPositionEditFieldLabel.FontColor = [1 1 1];
            app.CurrentPositionEditFieldLabel.Position = [29 704 91 22];
            app.CurrentPositionEditFieldLabel.Text = 'Current Position';

            % Create CurrentPositionEditField
            app.CurrentPositionEditField = uieditfield(app.InDepthResultsPanel, 'text');
            app.CurrentPositionEditField.Editable = 'off';
            app.CurrentPositionEditField.FontColor = [1 1 1];
            app.CurrentPositionEditField.Position = [25 729 100 22];

            % Create Panel_12
            app.Panel_12 = uipanel(app.InDepthResultsPanel);
            app.Panel_12.BorderType = 'none';
            app.Panel_12.Scrollable = 'on';
            app.Panel_12.Position = [581 400 659 394];

            % Create UIAxes7
            app.UIAxes7 = uiaxes(app.Panel_12);
            zlabel(app.UIAxes7, 'Z')
            app.UIAxes7.XTick = [];
            app.UIAxes7.YTick = [];
            app.UIAxes7.Position = [7 10 653 382];

            % Create BackButton_3
            app.BackButton_3 = uibutton(app.InDepthResultsPanel, 'push');
            app.BackButton_3.ButtonPushedFcn = createCallbackFcn(app, @BackButton_3Pushed, true);
            app.BackButton_3.Position = [31 416 83 35];
            app.BackButton_3.Text = 'Back';

            % Create SaveButton_2
            app.SaveButton_2 = uibutton(app.InDepthResultsPanel, 'push');
            app.SaveButton_2.ButtonPushedFcn = createCallbackFcn(app, @SaveButton_2Pushed, true);
            app.SaveButton_2.Position = [31 469 83 35];
            app.SaveButton_2.Text = 'Save';

            % Create SaveChangesPanel
            app.SaveChangesPanel = uipanel(app.ResultsTab);
            app.SaveChangesPanel.ForegroundColor = [0.0745 0.6235 1];
            app.SaveChangesPanel.TitlePosition = 'centertop';
            app.SaveChangesPanel.Title = 'Save Changes';
            app.SaveChangesPanel.BackgroundColor = [0.651 0.651 0.651];
            app.SaveChangesPanel.FontWeight = 'bold';
            app.SaveChangesPanel.Position = [337 318 497 289];

            % Create ROIsCheckBox
            app.ROIsCheckBox = uicheckbox(app.SaveChangesPanel);
            app.ROIsCheckBox.Text = 'ROI''s';
            app.ROIsCheckBox.FontColor = [1 1 1];
            app.ROIsCheckBox.Position = [43 155 52 22];

            % Create NameEditFieldLabel
            app.NameEditFieldLabel = uilabel(app.SaveChangesPanel);
            app.NameEditFieldLabel.HorizontalAlignment = 'right';
            app.NameEditFieldLabel.FontColor = [1 1 1];
            app.NameEditFieldLabel.Position = [193 206 41 22];
            app.NameEditFieldLabel.Text = 'Name';

            % Create NameEditField
            app.NameEditField = uieditfield(app.SaveChangesPanel, 'text');
            app.NameEditField.Position = [249 206 233 22];

            % Create DirLabel
            app.DirLabel = uilabel(app.SaveChangesPanel);
            app.DirLabel.FontColor = [1 1 1];
            app.DirLabel.Position = [23 237 25 22];
            app.DirLabel.Text = 'Dir:';

            % Create Label3_2
            app.Label3_2 = uilabel(app.SaveChangesPanel);
            app.Label3_2.FontColor = [1 1 1];
            app.Label3_2.Position = [57 237 418 22];
            app.Label3_2.Text = 'Label3';

            % Create ChangeButton_3
            app.ChangeButton_3 = uibutton(app.SaveChangesPanel, 'push');
            app.ChangeButton_3.ButtonPushedFcn = createCallbackFcn(app, @ChangeButton_3Pushed, true);
            app.ChangeButton_3.Position = [23 206 76 23];
            app.ChangeButton_3.Text = 'Change';

            % Create GraFTResultsCheckBox
            app.GraFTResultsCheckBox = uicheckbox(app.SaveChangesPanel);
            app.GraFTResultsCheckBox.Text = 'GraFT Results';
            app.GraFTResultsCheckBox.FontColor = [1 1 1];
            app.GraFTResultsCheckBox.Position = [43 123 100 22];

            % Create BackButton_4
            app.BackButton_4 = uibutton(app.SaveChangesPanel, 'push');
            app.BackButton_4.ButtonPushedFcn = createCallbackFcn(app, @BackButton_4Pushed, true);
            app.BackButton_4.Position = [24 17 58 23];
            app.BackButton_4.Text = 'Back';

            % Create SaveButton_3
            app.SaveButton_3 = uibutton(app.SaveChangesPanel, 'push');
            app.SaveButton_3.ButtonPushedFcn = createCallbackFcn(app, @SaveButton_3Pushed, true);
            app.SaveButton_3.Position = [407 17 65 23];
            app.SaveButton_3.Text = 'Save';

            % Create TextArea_3
            app.TextArea_3 = uitextarea(app.SaveChangesPanel);
            app.TextArea_3.Editable = 'off';
            app.TextArea_3.FontColor = [1 1 1];
            app.TextArea_3.BackgroundColor = [0.9412 0.9412 0.9412];
            app.TextArea_3.Visible = 'off';
            app.TextArea_3.Position = [193 64 287 119];

            % Create GraFTanalysisLabel_2
            app.GraFTanalysisLabel_2 = uilabel(app.UIFigure);
            app.GraFTanalysisLabel_2.HorizontalAlignment = 'center';
            app.GraFTanalysisLabel_2.FontSize = 30;
            app.GraFTanalysisLabel_2.FontWeight = 'bold';
            app.GraFTanalysisLabel_2.Position = [43 933 221 39];
            app.GraFTanalysisLabel_2.Text = 'GraFT-analysis';

            % Create Label2_3
            app.Label2_3 = uilabel(app.UIFigure);
            app.Label2_3.HorizontalAlignment = 'center';
            app.Label2_3.WordWrap = 'on';
            app.Label2_3.Position = [37 13 1211 30];
            app.Label2_3.Text = 'The details of GraFT are described in: A.S. Charles, N. Cermak, R. Affan, B. Scott, J. Schiller & G. Mishne. GraFT: Graph Filtered Temporal Dictionary Learning for Functional Neural Imaging.';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GraFT_app_02

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