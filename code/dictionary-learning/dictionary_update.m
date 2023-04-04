function dict_new = dictionary_update(x_im, dict_old, coef_vals, step_s, opts)

% function dict_new = dictionary_update(x_im, dictionary_old, coef_vals,
% step_s, opts)
% 
% Takes a gradient step with respect to the sparsity inducing energy
% function.
% 
% Inputs:
%   x_im        - Data samples over which to average the gradient step
%   dict_old    - The previous dictionary (used to infer the coefficients)
%   coef_vals   - The inferred coefficients for x_im using dict_old
%   step_s      - The step size to take in the gradient direction
%   opts        - Options for the particular problem (outlined in
%                 learn_dictionary.m)
%
% Outputs:
%   dict_new    - The new dictionary after the gradient step
% 
% Last Modified 4/17/2018 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

if (~isfield(opts, 'grad_type'))||isempty(opts.grad_type)
    opts.grad_type = 'norm';
end

[l2, l3, l4] = getLambdas(opts);                                           % Parse out the values of lambda
qp_opts.Display     = 'off';                                               % Set the optimizers to minimally display info
qp_opts.UseParallel = true;                                                % Set the optimizers to use parallelization if possible

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Take a gradient step

if strcmp(opts.grad_type, 'norm')
    % Take a step in the negative gradient of the basis:
    % Minimizing the energy:    E = ||x-Da||_2^2 + lambda*||a||_1^2
    dict_new = update_GDiters(dict_old, coef_vals, x_im, step_s, opts);
elseif strcmp(opts.grad_type, 'forb')
    % Take a step in the negative gradient of the basis:
    % This time the Forbenious norm is used to reduce unused
    % basis elements. The energy function being minimized is
    % then:     E = ||x-Da||_2^2 + lambda*||a||_1^2 + lamForb||D||_F^2
    dict_new = update_GDwithForb(dict_old, coef_vals, x_im, step_s, l2, opts);
elseif strcmp(opts.grad_type, 'full_ls')
    % Minimizing the energy:
    % E = ||X-DA||_2^2 via D = X*pinv(A)
    dict_new = update_FullLS(dict_old, coef_vals, x_im, opts);
elseif strcmp(opts.grad_type, 'anchor_ls')
    % Minimizing the energy:
    % E = ||X-DA||_2^2 + lamCont*||D_old - D||_F^2 via D = [X;D_old]*pinv([A;I])
    dict_new = update_LSwithCont(dict_old, coef_vals, x_im, l3, opts);
elseif strcmp(opts.grad_type, 'anchor_ls_forb')
    % Minimizing the energy:
    % E = ||X-DA||_2^2 + lamCont*||D_old - D||_F^2 + lamForb*||D||_F^2 
    %                  via D = [X;D_old]*pinv([A;I])
    dict_new = update_LSwithContForb(dict_old, coef_vals, x_im, l2, l3, opts);
elseif strcmp(opts.grad_type, 'full_ls_forb')
    % Minimizing the energy:
    % E = ||X-DA||_2^2 + lamForb*||D||_F^2
    %              via  D = X*A^T*pinv(AA^T+lamForb*I)
    dict_new = update_LSwithForb(dict_old, coef_vals, x_im, l2, opts);
elseif strcmp(opts.grad_type, 'full_ls_cor')
    % E = ||X-DA||_2^2 + lamCorr*||D.'D-diag(D.'D)||_sav + lamForb*||D||_F^2
    %             + lamCont*||D-Dold||_F^2 
    if opts.nneg_dict == 1
        dict_new = zeros(size(dict_old));                                  % Initialize the dictionary
        Nneur    = size(dict_old,2);
        Ntime    = size(dict_old,1);   
        H = 2*double(coef_vals*coef_vals.' + l4.^2 + (l3.^2+l2.^2-l4.^2)*eye(Nneur));
        parfor ll = 1:Ntime
            dict_new(ll,:) = quadprog(H,...
                  -2*double(coef_vals*x_im(ll,:).' + l3.^2*dict_old(ll,:).'),...
                          [],[],[],[],zeros(size(dict_new(ll,:),2),1),[],dict_old(ll,:),qp_opts); % Solve the least-squares via a nonnegative program on a per-dictionary level
        end
    else
        dict_new = x_im*(coef_vals.')/(coef_vals*(coef_vals.') ...
                               + l4.^2*(1-eye(size(coef_vals,1)))); % Solve the least-squares via an inverse
    end
elseif strcmp(opts.grad_type, 'sparse_deconv')
    dict_new   = sparseDeconvDictEst(dict_old,x_im,coef_vals,opts.h,opts); % This is a more involved function and needs its own function
end

if ~opts.normalizeSpatial
    dict_new = normalizeDictionary(dict_new,1);                            % Normalize the dictionary
end
dict_new(isnan(dict_new)) = 0;

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
function [l2, l3, l4] = getLambdas(opts);
if isfield(opts,'lamForb')
    l2 = sqrt(opts.lamForb);
else
    l2 = 0;
end
if isfield(opts,'lamCont')
    l3 = sqrt(opts.lamCont);
else
    l3 = 0;
end
if isfield(opts,'lamCorr')
    l4 = sqrt(opts.lamCorr);
else
    l4 = 0;
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function D = normalizeDictionary(D, varargin)

if nargin > 1
    cutoff = varargin{1};
else
    cutoff = 1;
end
D_norms = sqrt(sum(D.^2));                                                 % Get the norms of the dictionary elements 
D       = D*diag(1./(D_norms.*(D_norms>cutoff)/cutoff+(D_norms<=cutoff))); % Re-normalize the basis

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function dict_new = update_GDiters(dict_old, coef_vals, x_im, step_s, opts)
for index2 = 1:opts.GD_iters
    % Take a step in the negative gradient of the basis:
    % Minimizing the energy:
    % E = ||x-Da||_2^2 + lambda*||a||_1^2
    % Update The basis matrix
    dict_new = dict_old + (step_s/size(coef_vals,1))*...
        (x_im - dict_old*coef_vals)*coef_vals';

    % This part is basically the same, only for the
    % hyperspectral, care needs to be taken to saturate at 0,
    % so that no negative relflectances are learned. 
    if opts.nneg_dict == 1
        dict_new(dict_new < 0) = 0;
    end
end     
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function dict_new = update_GDwithForb(dict_old, coef_vals, x_im, step_s, l2, opts)
for index2 = 1:opts.GD_iters
    % Take a step in the negative gradient of the basis:
    % This time the Forbenious norm is used to reduce unused
    % basis elements. The energy function being minimized is
    % then:
    % E = ||x-Da||_2^2 + lambda*||a||_1^2 + lamForb||D||_F^2

    % Update The basis matrix
    dict_new = dict_old + (step_s)*(...
        (x_im - dict_old*coef_vals)*coef_vals' -...
        l2.^2*2*dict_old)*diag(1./(1+sum(coef_vals ~= 0, 2)));

    % For some data sets, the basis needs to be non-neg as well
    if opts.nneg_dict == 1
        dict_new(dict_new < 0) = 0;
    end
end  
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function dict_new = update_FullLS(dict_old, coef_vals, x_im, opts)

if opts.nneg_dict == 1
    dict_new = zeros(size(dict_old));                                  % Initialize the dictionary
    for ll = 1:size(dict_new,1)
        dict_new(ll,:) = lsqnonneg(double(coef_vals.'), x_im(ll,:).'); % Solve the least-squares via a nonnegative program on a per-dictionary level
    end
else
    dict_new = x_im/coef_vals;                                         % Solve the least-squares via an inverse
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function dict_new = update_LSwithCont(dict_old, coef_vals, x_im, l3, opts)

% Minimizing the energy:
% E = ||X-DA||_2^2 + lamCont*||D_old - D||_F^2 via D = [X;D_old]*pinv([A;I])

if opts.nneg_dict == 1
    dict_new = zeros(size(dict_old));                                  % Initialize the dictionary
    for ll = 1:size(dict_new,1)
        dict_new(ll,:) = lsqnonneg([double(coef_vals).';...
                                       l3*eye(size(dict_old,2))],...
                                  [x_im(ll,:).';l3*dict_old(ll,:).']); % Solve the least-squares via a nonnegative program on a per-dictionary level
    end
else
    dict_new = [x_im,l3*dict_old]/[coef_vals,l3*eye(size(dict_old,2))];% Solve the least-squares via an inverse
end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function dict_new = update_LSwithForb(dict_old, coef_vals, x_im, l2, opts)

% Minimizing the energy:
% E = ||X-DA||_2^2 + lamForb*||D||_F^2
%              via  D = X*A^T*pinv(AA^T+lamForb*I)
if opts.nneg_dict == 1                                                                                           %
        warning('Regularized non-negative ls is not implemented yet! Solving without non-negative constraints...\n') % NEED TO IMPLEMENT NON-NEGATIVE LS HERE
end                                                                                                              % 
dict_new = x_im*(coef_vals.')/(coef_vals*(coef_vals.') ...
                                          + l2.^2*eye(size(coef_vals,1))); % Solve the least-squares via an inverse
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%

function dict_new = update_LSwithContForb(dict_old, coef_vals, x_im, l2, l3, opts)

% Minimizing the energy:
% E = ||X-DA||_2^2 + lamCont*||D_old - D||_F^2 + lamForb*||D||_F^2 
%                  via D = [X;D_old]*pinv([A;I])
if opts.nneg_dict == 1
    dict_new = zeros(size(dict_old));                                      % Initialize the dictionary
    for ll = 1:size(dict_new,1)
        dict_new(ll,:) = lsqnonneg([double(coef_vals).';...
            l3*eye(size(dict_old,2));zeros(size(dict_old,2))],...
              [x_im(ll,:).';l3*dict_old(ll,:).';l2*dict_old(ll,:).']);     % Solve the least-squares via a nonnegative program on a per-dictionary level
    end
else
    dict_new = [x_im,l3*dict_old,l2*dict_old]\...
     [double(coef_vals),l3*eye(size(dict_old,2)),zeros(size(dict_old,2))]; % Solve the least-squares via an inverse
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
