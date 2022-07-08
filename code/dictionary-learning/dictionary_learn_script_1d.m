%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% dictionary_learn_script.m 
% This scrips it an example script for basic sparse dictionary learning
% based on the Olshausen and Field, 1997 paper 'Sparse Coding with
% an Overcomplete Basis Set: a Strategy Employed by V1?'
% 
% Deviations from the model presented are: 
%   - use of L1 regularized BPDN solvers as well as options to use
%     hard-sparse MP-type solvers for the inference step. This allows
%     faster and more accurate solvutions for the sparse coefficients.
%   - Normalization of the dictionary elements to have unit norm at each
%     step rather than normalizing the variance of the coefficients. This
%     is the default. Also included is a method that normalizes the
%     dictionary elements by a Forbeneous norm.
%   
% Other optimizations:
% 
%   - Parallel for loops are used in the inference step to speed up
%     run-time. If the script is to be run on a cluster, ust the
%     createMatlabPoolJob() function to allow for this speedup. 
% 
% 
% Last Updated 6/3/2010 - Adam Charles
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Set Options

% Set multithreading to Ncores - 1 threads
% This speeds up matrix multiplication etc.
poolobj = gcp('nocreate');
if ~isempty(poolobj)
    delete(gcp);
end
parpool();

% Random number seed
RandStream.setGlobalStream (RandStream('mt19937ar','seed',sum(100*clock)));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options

% Algorithm options
opts.data_type = 'vector';          % Type of data (vector, square or cube)
opts.grad_type = 'norm';            % Choose weather to include the Forb norm in E(a,D)
opts.n_elem   = 144;                % Number of dictionary elements
opts.iters    = 400;                % Number of learning iterations
opts.in_iter  = 75;                 % Number of internal iterations
% Specify Parameters
opts.step_size = 2;                 % Initial Step Size for Gradient Descent
opts.decay     = 0.9995;            % Step size decay factor
opts.lambda    = 0.6;               % Lambda Value for Sparsity
opts.tol       = 0.001;             % Sparsification Tolerance
% Plotting Options
opts.bshow     = 0;                 % Number of iterations to show basis
opts.disp_size = [8, 8];            % Basis display dimensions

opts.div_samp = 1;

%% Create Training Data

S = 5;
N = 144;
P = 1e4;
data_obj = zeros(N,P);
for kk = 1:P 
    tmp = zeros(N,1);
    tmp(randsample(N, S)) = 5*(rand(S,1)-0.5);
    data_obj(:,kk) = dct(tmp);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Run Learning Algorithm

% Actually run the learning algorithm
tic
[dictionary_out] = learn_dictionary(data_obj, [], @cg_l2l1_wrapper, opts);
toc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Closing time

delete(gcp);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
