function coef_vals = gen_multi_infer(dictionary_n, x_im, infer_hand, opts)

% coef_vals = multi_l1ls(dictionary_n, x_im, infer_type, opts)
%
% Function to perform inference on a multitude of test vectors. The
% inference algorithm given by infer_type is run on each column of x_im
% with repect to dictionary_n. 
%
% Inputs: 
%       dictionary_n    - The dictionary to decompose the data into
%       x_im            - A matrix with the columns as data to decompose
%       infer_hand      - Handle for a wrapper that calls an inference
%                         function. Included in the package is the default
%                         conjugate gradient descent method (both wrapper
%                         and function) as well as wrappers for some
%                         recommended inference functions easily available
%                         online. Some included wrappers are The 'MP' and
%                         'OOMP' from the SparseLab100 library available at
%                         http://sparselab.stanford.edu, the OMP_qr from
%                         the sparsify package (v4 or later) available at 
%                         http://www.personal.soton.ac.uk/tb1m08/sparsify/s
%                         parsify.html, and the L1-regularized functions
%                         l1_ls and l1_ls_nonneg available at
%                         http://www.stanford.edu/~boyd/l1_ls/. To use a
%                         different inference function, simply create a
%                         wrapper as per the examples for the functions
%                         above.
%       opts            - A struct of options needed for the optimization
%                         program selected. 
%
% Outputs: 
%       coef_vals       - optimized coefficients
% 
% Last Modified 6/3/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Initializations

% Initialize coefficients
coef_vals = zeros(size(dictionary_n, 2), opts.in_iter);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Perform the L1-regulized optimization on the data


parfor index_in = 1:opts.in_iter
    coef_vals(:, index_in) = feval(infer_hand, dictionary_n, x_im(:,index_in),...
        opts);
end


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
