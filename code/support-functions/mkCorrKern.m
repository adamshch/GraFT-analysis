function corr_kern = mkCorrKern(kern_opts)

% corr_kern = mkCorrKern(kern_opts)
%
% Create a convolutional correlation kernel that relates neighboring
% points. 
%
% 2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check parameters


if nargin < 1 || isempty(kern_opts)                                                       % Make sure that sim_opts is a struct
    clear kern_opts
    kern_opts = struct;
end
if (~isfield(kern_opts,'w_space'))||isempty(kern_opts.w_space)
    w_space = 3;
else
    w_space = kern_opts.w_space ;
end
if (~isfield(kern_opts,'w_scale'))||isempty(kern_opts.w_scale)
    w_scale = 4;
else
    w_scale = kern_opts.w_scale ;
end
if (~isfield(kern_opts,'w_scale2'))||isempty(kern_opts.w_scale2)
    w_scale2 = 0.5;
else
    w_scale2 = kern_opts.w_scale2 ;
end
if (~isfield(kern_opts,'w_power'))||isempty(kern_opts.w_power)
    w_power = 2;
else
    w_power = kern_opts.w_power ;
end
if (~isfield(kern_opts,'w_time'))||isempty(kern_opts.w_time)
    w_time = 0;
else
    w_time = kern_opts.w_time ;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make the kernel

range_vec  = vec(linspace(-w_scale,w_scale,1+2*w_space));
range_vec2 = vec(linspace(-w_scale2,w_scale2,1+2*w_time));
corr_kern  = exp(-0.5*(1/w_space)*(abs(range_vec*ones(size(range_vec'))).^w_power ...
    +abs(ones(size(range_vec))*(range_vec.')).^w_power));
corr_kern  = bsxfun(@times,corr_kern,exp(-0.5*(1/max(w_time,1))*reshape(range_vec2.^2,[1,1,numel(range_vec2)])));
corr_kern(w_space+1,w_space+1,w_time+1) = 0;
corr_kern  = corr_kern/(sum(corr_kern(:)) + eps);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%