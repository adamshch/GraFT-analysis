function [data,profile_set,Ca] = simSpatialData2(sim_opts)

if nargin < 1 || isempty(sim_opts)                                                       % Make sure that sim_opts is a struct
    clear sim_opts
    sim_opts = struct;
end
%%
if (~isfield(sim_opts,'dims'))||isempty(sim_opts.dims)
    sim_opts.dims = [50,50,100];
end
if (~isfield(sim_opts,'n_dict'))||isempty(sim_opts.n_dict)
    sim_opts.n_dict = 20;
end
if (~isfield(sim_opts,'p_evt'))||isempty(sim_opts.p_evt)
    sim_opts.p_evt = 0.8;
end
if (~isfield(sim_opts,'circ_rad'))||isempty(sim_opts.circ_rad)
    sim_opts.circ_rad = 5;
end
if (~isfield(sim_opts,'noise_var'))||isempty(sim_opts.noise_var)
    sim_opts.noise_var = 0.1;
end
if (~isfield(sim_opts,'gamma'))||isempty(sim_opts.gamma)
    sim_opts.gamma = 0.9;
end
if (~isfield(sim_opts,'r0'))||isempty(sim_opts.r0)
    sim_opts.r0 = 0.4;
end

%% Initialization

nrows = sim_opts.dims(1);                                                     % Extract dimensions of the simulated dataset
ncols = sim_opts.dims(2);                                                     %  |
T     = sim_opts.dims(3);                                                     %  |
N     = sim_opts.n_dict;                                                      % ---
sig_r = sim_opts.circ_rad;
r0    = sim_opts.r0 ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
G = toeplitz(0:(T-1), zeros(1,T));
G_gam = tril(sim_opts.gamma.^G,0);
%%
margin = floor([nrows * 0.1, ncols * 0.1]);
%%
% [x0,y0] = meshgrid(margin(1):10:30,10:10:30);
% x0 = x0(:);
% y0 = y0(:);
% x0 = x0 + 3*randn(N,1);
% y0 = y0 + 3*randn(N,1);
%
x0 = margin(2) + randsample((ncols-2*margin(2)) ,N) + 3*randn(N,1);
y0 = margin(1) + randsample((nrows-2*margin(1)) ,N) + 3*randn(N,1);
%
[x,y] = meshgrid(1:ncols,1:nrows);
Atruth = zeros(nrows*ncols,N);
profile_set =  zeros(nrows,ncols,N);
for i = 1:N
    xscale = max(1,1.2*rand(1));
    yscale = 1/xscale; %max(1,1.3*rand(1));
    data = exp(-(sqrt(((x-x0(i))/xscale).^2+max(-1,min(1,randn(1)))*(x-x0(i)).*(y-y0(i)) +((y-y0(i))/yscale).^2) - r0*(1+0.1*randn(1))).^2/(2*(1+0.1*randn(1))*sig_r^2));
    %Atruth(:,i) = ceil((0.5*rand(1)+0.5)*10)/10*data(:).*(data(:) > 0.1);
    Atruth(:,i) = data(:).*(data(:) > 0.1);
    profile_set(:,:,i) = reshape(Atruth(:,i),nrows,ncols);
end
figure;imagesc(reshape(sum(Atruth,2),nrows,ncols));axis image
%%
p = 1-sim_opts.p_evt;
t = rand(N,T) < p;
Ca = G_gam*double(t');
%%
data = zeros(size(Atruth,1),size(Ca,1));
for i =1:N
    data = data + Atruth(:,i)*Ca(:,i)';
end
data = reshape(data,nrows, ncols,T);
%%
data = data + sim_opts.noise_var * randn(size(data));
data(data(:) < 0) = 0;
%%
if nargout < 1
    figure;
    subplot(131)
    imagesc(max(data,[],3));axis image;colorbar
    subplot(132)
    imagesc(mean(data,3));axis image;colorbar
    subplot(133)
    imagesc(std(data,0,3));axis image;colorbar
    %%
    figure;for i =1:T;imagesc(data(:,:,i),[0 max(Ca(:))]);pause(0.1);end
end