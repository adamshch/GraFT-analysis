function S = reCalcCoefSparse(data, D, S, lambda, varargin)

% S = recalcCoefSparse(data, D, S)
%
% Function to recalulate the sparse coefficients given a dictionary D and 
% data "data". The current coefficeints S are used to identify support. 
% This function is not designed to be used instead of the inference step, 
% and instead to be used only after the merging of dictionary elements
% in post-processing.
%
% 2020 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Input parsing

if nargin > 4; nonneg = varargin{1};                                       % If provided, set non-negativity flag
else           nonneg = false;                                             % Default flag is 'false'
end

if nargin > 5; solverOpt = varargin{2};                                    % If provided, set the option of what solver to use.
else         ; solverOpt = 'OMP';                                          % Default to OMP
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
classS = class(S);                                                         % Record the data type that the coefficients were initially stored as    

if ndims(S)==3                         
    S3D   = true;                                                          % Set flag to reshape array back to 3D array at the end
    Sdim  = size(S);                                                       % Get full size of coefficients
    nPix  = size(S,1)*size(S,2);                                           % get number of pixels
    nCoef = size(S,3);                                                     % Get number of coefficients
    S     = reshape(S,nPix,nCoef);                                         % Reshape array to be pixels-by-coefficients
else
    S3D   = false;                                                         % Do not trigger the flag to 
    nPix  = size(S,1);                                                     % get number of pixels
    nCoef = size(S,2);                                                     % Get number of coefficients
end

if ndims(data) == 3; data = reshape(data,nPix,[]); end                     % Ensure that the data is a 2D array (reshape if a 3D array)

if strcmp(lower(solverOpt),'lasso')                                        % Solve using the convex LASSO optimization
    if nonneg                                                              % This is the case for non-negative inference
	fprintf('Nonnegative LASSO chosen.\n')                             % Inform the user of their choice
        qp_opts.Display = 'off';                                           % Turn off the display option for output sanity
        DtD             = double(2*D.'*D);                                 % Pre-compute the D^T*D matrix
        parfor ll = 1:nPix                                                 % Loop through all the pixels (in parallel because why not)
            fprintf('.')
            f       = double(-2*(D.')*vec(data(ll,:)) + lambda);           % Precompute the offset vector
            S_out   = cast(quadprog(DtD, f, [], [], [], [],...
                          zeros(nCoef,1), Inf*ones(nCoef,1), S(ll,:),...
                                                        qp_opts), classS); % Use quadratic programming to solve the non-negative LASSO
            max_val                  = max(S_out);                         % Compute the max coefficient value
            S_out(S_out<0.1*max_val) = 0;                                  % Threshold the output since LASSO often returns silly small values
            S(ll,:)                  = S_out;                              % Save the coefficients for this pixel. 
            fprintf('.')
        end
	fprintf('done.\n')
    else
	fprintf('Regular LASSO chosen.\n')
        parfor ll = 1:nPix                                                 % Loop through all the pixels
            S(ll,:) = cast(lasso(D, vec(data(ll,:)), 'lambda', ...
                                                        lambda), classS);  % Use the standard LASSO inference
        end
        S(S(:)<0.1*max(S(:))) = 0;                                         % Threshold the output since LASSO often retuens silly small values
    end
elseif strcmp(lower(solverOpt),'omp')                                      % Solve using OMP
    if nonneg
        % Does not exist yet
        S = reCalcCoefSparse(data, D, S, lambda, nonneg, 'lasso');         % Run with LASSO nonneg
    else
        DtD    = double(D.'*D);                                            % Pre-compute the D^T*D matrix
        parfor ll = 1:nPix                                                 % Loop through all the pixels
	    S(ll,:) = cast(omp(D, vec(data(ll,:)), DtD), classS);          % Run OMP on the ll^th pixel's time-trace
        end
    end		    
end

if S3D;     S = reshape(S,Sdim);  end                                      % Reshape S back into a 3D array

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%elseif ndims(S)==2
%    nPix  = size(S,1);
%    nCoef = size(S,2);
%    parfor ll = 1:nPix
%	idxCoef = squeeze(S_on(ll,:))'==1;
%        TMP = cast(zeros(nCoef,1),classS);
%        TMP(idxCoef) = cast(lsqnonneg(double(D(:,idxCoef)),...
%	                            double(squeeze(data(ll,:))).'),classS); % Compute the least-squares solution for the coefficient
%        S(ll,:) = TMP;
%    end
%else
%    error('Bad format for coefficient array')


%            S(ll,:) = singleGaussNeuroInfer(tau_mat(ll,:), ...
%                                  mov(ll,:), D, lambda, 1e-4, nonneg, S(ll,:)); % Perform column-wise Gaussian de-mixing - calls a LASSO solver that can be non-negative
