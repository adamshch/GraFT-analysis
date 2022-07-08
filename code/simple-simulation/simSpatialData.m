function [sim_cube,profile_set,temp_dict] = simSpatialData(sim_opts)

% function sim_cube = simSpatialData(sim_opts)
%
% Simulate some circles with temporal activity
%
% 2018 - Adam Charls

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

if isempty(sim_opts)                                                       % Make sure that sim_opts is a struct
    clear sim_opts
    sim_opts = struct;
end
if (~isfield(sim_opts,'dims'))||isempty(sim_opts.dims)
    sim_opts.dims = [100,100,50];
end
if (~isfield(sim_opts,'n_dict'))||isempty(sim_opts.n_dict)
    sim_opts.n_dict = 20;
end
if (~isfield(sim_opts,'p_evt'))||isempty(sim_opts.p_evt)
    sim_opts.p_evt = 0.8;
end
if (~isfield(sim_opts,'poles'))||isempty(sim_opts.poles)
    sim_opts.poles = 0.8;
end
if (~isfield(sim_opts,'circ_rad'))||isempty(sim_opts.circ_rad)
    sim_opts.circ_rad = 7;
end
if (~isfield(sim_opts,'noise_var'))||isempty(sim_opts.noise_var)
    sim_opts.noise_var = 0.1;
end
if (~isfield(sim_opts,'AR1'))||isempty(sim_opts.AR1)
    sim_opts.AR1 = true;
end
if (~isfield(sim_opts,'r0'))||isempty(sim_opts.r0)
    sim_opts.r0 = 0.9;
end
if (~isfield(sim_opts,'prof_type'))||isempty(sim_opts.prof_type)
    sim_opts.prof_type = 'donut';
end
if (~isfield(sim_opts,'nBG'))||isempty(sim_opts.nBG)
    sim_opts.nBG = 1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initialization

M1 = sim_opts.dims(1);                                                     % Extract dimensions of the simulated dataset 
M2 = sim_opts.dims(2);                                                     %  |
T  = sim_opts.dims(3);                                                     %  |
N  = sim_opts.n_dict;                                                      % ---


% nrows = sim_opts.dims(1);                                                     % Extract dimensions of the simulated dataset
% ncols = sim_opts.dims(2);                                                     %  |
% T     = sim_opts.dims(3);                                                     %  |
% N     = sim_opts.n_dict;                                                      % ---
sig_r = sim_opts.circ_rad;
r0    = sim_opts.r0 ;
margin = floor([M1 * 0.1, M2* 0.1]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create temporal basis 
p = rand(T, N);
thresh = 1-(1-sim_opts.p_evt)*rand(1,N);
thresh = min(max(p),thresh);
temp_dict = bsxfun(@ge, p, thresh);       % Initialize dictionary to a bunch of spikes
temp_dict = temp_dict.*(1+2*rand(size(temp_dict)));                        % Modulate the event strengths 
if sim_opts.AR1
    temp_dict = filter([1 sim_opts.poles],1,temp_dict);                    % Pass though an AR-1 filter
else
    temp_dict = filter(1,[1 sim_opts.poles],temp_dict);   
end
temp_dict = temp_dict(1:T,:);                                              % Truncate to remove extra entries added by 'filter'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create spatial shapes

profile_set =  zeros(M1,M2,N);

if strcmp(sim_opts.prof_type,'donut')
    n_y = floor(sqrt(N));
    n_x = ceil(N / n_y);
    
    height = M1 - 2*margin(1);
    width  = M2 - 2*margin(2);
    Y0 = margin(1) + floor(height/n_y)*(0:n_y-1);
    X0 = margin(2) + floor(width/n_x)*(0:n_x-1);
    
    inds = randperm(n_x*n_y,N);
    [x0,y0] = meshgrid(X0,Y0);
    x0 = x0(inds) + randn(size(inds))*margin(2)/3;
    y0 = y0(inds) + randn(size(inds))*margin(1)/3;
    
    [x,y] = meshgrid(1:M2,1:M1);
    for kk = 1:N
        xscale  = max(1,1.2*rand(1));
        yscale  = 1/xscale; 
        off_tmp = max(-1,min(1,randn(1)));
        sig_tmp = (1+0.1*randn(1))*(sig_r/2)^2;
        data = exp(-(((x-x0(kk))/xscale).^2+((y-y0(kk))/yscale).^2+off_tmp*(x-x0(kk)).*(y-y0(kk)))/sig_tmp);
        tf = 0.7;
        data = data - r0*exp(-(((x-x0(kk))/(xscale)).^2+((y-y0(kk))/(yscale)).^2+off_tmp*(x-x0(kk)).*(y-y0(kk)))/(tf*sig_tmp));
        profile_set(:,:,kk) = reshape(data(:).*(data(:) > 0.1),M1,M2);
    end
    
else  % strcmp(sim_opts.prof_type,'blob')
    circ = -ceil(sim_opts.circ_rad):ceil(sim_opts.circ_rad);
    circ = bsxfun(@plus, circ.^2, (circ.^2).')<=(sim_opts.circ_rad).^2;
    
    n_y = floor(sqrt(N));
    n_x = ceil(N / n_y);
    
    height = M1 - margin(1);
    width  = M2 - margin(2);
    Y0 = 2*margin(1) + floor(height/n_y)*(0:n_y-1);
    X0 = margin(2) + floor(width/n_x)*(0:n_x-1);
    
    inds = randperm(n_x*n_y,N);
    [x0,y0] = meshgrid(X0,Y0);
    x0 = round(x0(inds) + randn(size(inds))*margin(2)/3);
    y0 = round(y0(inds) + randn(size(inds))*margin(1)/3);
%     figure;scatter(x0,y0)
%     xlim([0 M2])
%     ylim([0 M1])
    for kk = 1:size(profile_set,3)
        profile_set(x0(kk),y0(kk),kk) = 1;
        profile_set(:,:,kk) = convn(profile_set(:,:,kk), circ, 'same');
        profile_set(:,:,kk) = profile_set(:,:,kk) + profile_set(:,:,kk).*randn(size(profile_set(:,:,kk)));
    end

    gk_ext = 5;
    gk_var = 5;
    gk     = exp(- bsxfun(@plus,vec(-gk_ext:gk_ext).^2,...
                                         (-gk_ext:gk_ext).^2)/(2*gk_var));
    gk     = gk./norm(gk(:));

    % profile_set(profile_set>0) = abs(randn(sum(profile_set(:)>0)));
    for kk = 1:size(profile_set,3)
        profile_set(:,:,kk) = abs(convn(profile_set(:,:,kk), gk, 'same'));
        profile_set(:,:,kk) = profile_set(:,:,kk).*(profile_set(:,:,kk) > 0.1);
    end
    
end

profile_set = bsxfun(@times,profile_set,...
                  20*(1+5*rand(1,1,N))./sqrt(sum(sum(profile_set.^2,1),2)));  % Add variation in SNR

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Optional background components

if sim_opts.nBG>0
    
    bg_dict = rand(T, sim_opts.nBG) > 0.8;                                 % Initialize background time-course dictionary to a bunch of spikes
    bg_dict = bg_dict.*(1+2*rand(size(bg_dict)));                          % Modulate the event strengths 
    bg_dict = filter(1,[1 0.9*sim_opts.poles],bg_dict);   
    bg_dict = bg_dict(1:T,:);                                              % Truncate to remove extra entries added by 'filter'
    
    profile_bg = zeros(M1,M2,sim_opts.nBG);
    gk_ext = 20;
    gk_var = 15;
    gk     = exp(- bsxfun(@plus,vec(-gk_ext:gk_ext).^2,...
                                         (-gk_ext:gk_ext).^2)/(2*gk_var)); % Create kernel for background GP
    gk     = 0.1*gk./norm(gk(:));
    for kk = 1:sim_opts.nBG
        profile_bg(:,:,kk) = randn(size(profile_bg(:,:,kk)));
        profile_bg(:,:,kk) = abs(convn(profile_bg(:,:,kk), gk, 'same'));
    end
    profile_bg = bsxfun(@times,profile_bg,...
                  10./sqrt(sum(sum(profile_bg.^2,1),2)));  % Add variation in SNR
              
    temp_dict   = cat(2,temp_dict,bg_dict);
    profile_set = cat(3,profile_set,profile_bg);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create data

sim_cube = zeros(M1,M2,T);                                                 % Initialize data cube
for kk = 1:M1
    for ll = 1:M2
        sim_cube(kk,ll,:) = temp_dict*vec(profile_set(kk,ll,:));% ...
%                                        + bg_dict*vec(profile_bg(kk,ll,:)); % Generate the full time-trace at each location in the image
    end
end
sim_cube = sim_cube + sqrt(sim_opts.noise_var)*randn(size(sim_cube));      % Add some noise

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
