function dictionary_initial = initialize_dictionary(varargin)

% dictionary_initial = initialize_dictionary(varargin)
% 
% Function to generate a random initial dictionary, or to load a dictionary
% from a file.
%  
% Use: 
%       - initialize_dictionary(n_elem, v_size) creates a radom matrix with
%       zero mean and unit variance of size (v_size)x(n_elem). The columns 
%       (the dictionary elements) are normalized to the unit circle.
%       - initialize_dictionary(n_elem, v_size, nneg) where nneg is a
%       scalar generates the dictionary from a uniform distribution, then
%       normalizes the columns to the unit circle (for non-negativity
%       constraints)
%       - initialize_dictionary(n_elem, v_size, save_name) loads the
%       dictionary from the string specified in save_name, and checks the
%       dictionary dimensions against the desired dimensions.
% 
%
% Last Modified 6/3/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Parse Inputs


if nargin == 2
    n_elem = varargin{1};
    v_size = varargin{2};
    new_basis = 1;
    nneg_opt = 0;
elseif nargin == 3
    n_elem = varargin{1};
    v_size = varargin{2};
    save_name = varargin{3};
    if isscalar(save_name)
        new_basis = 1;
        nneg_opt = save_name;
    elseif ischar(save_name)
        new_basis = 0;
    else
        error('Third input must be a string for the dictionary to load, or a scalar nonegativity indicator!')
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Generate initial dictionary

fprintf('Using %d dictionary elements...\n', n_elem)
% Initialize Elements
if new_basis == 1
    if nneg_opt == 1;
        dictionary_initial = abs(rand(v_size, n_elem));
    else
        dictionary_initial = randn(v_size, n_elem);
    end
    % Normalize the initial basis
    dictionary_initial = (dictionary_initial./(ones(v_size, 1)*...
        sqrt(sum(dictionary_initial.^2, 1))));
    fprintf('Starting with random initial Dictionary Elements.\n')
else
    load(save_name)
    fprintf('Starting with older Basis Elements.\n')
    dictionary_initial = basic_cell.basis;
    % Test loaded image size for compatability
    if (size(dictionary_initial, 1) ~= v_size) || (size(dictionary_initial, 2) ~= n_elem)
        error('Loaded dictionary size does not match required numbers!!')
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
