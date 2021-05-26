
function [U,S,V] = pcafast(A,k,raw,its,l)
%pcafast  Principal component analysis
%
%
%   [U,S,V] = pcafast(A)  constructs a nearly optimal rank-6 approximation
%             USV' to C(A), where C(A) refers to A after centering its
%             columns, using 2 normalized power iterations, with block
%             size 6+2=8, started with a min(m,n) x 8 random matrix,
%             when A is m x n; the reference below explains "nearly
%             optimal." The smaller dimension of A must be >= 6 when A
%             is the only input to pcafast.
%
%   [U,S,V] = pcafast(A,k)  constructs a nearly optimal rank-k approximation
%             USV' to C(A), where C(A) refers to A after centering its
%             columns, using 2 normalized power iterations, with block
%             size k+2, started with a min(m,n) x (k+2) random matrix,
%             when A is m x n; the reference below explains "nearly
%             optimal." k must be a positive integer <= the smaller
%             dimension of A.
%
%   [U,S,V] = pcafast(A,k,raw)  constructs a nearly optimal rank-k
%             approximation USV' to A, centering the columns of A first
%             when raw is false, using 2 normalized power iterations,
%             with block size k+2, started with a min(m,n) x (k+2)
%             random matrix, when A is m x n; the reference below
%             explains "nearly optimal." k must be a positive integer
%             <= the smaller dimension of A.
%
%   [U,S,V] = pcafast(A,k,raw,its)  constructs a nearly optimal rank-k
%             approximation USV' to A, centering the columns of A first
%             when raw is false, using its normalized power iterations,
%             with block size k+2, started with a min(m,n) x (k+2)
%             random matrix, when A is m x n; the reference below
%             explains "nearly optimal." k must be a positive integer
%             <= the smaller dimension of A, and its must be a
%             nonnegative integer.
%
%   [U,S,V] = pcafast(A,k,raw,its,l)  constructs a nearly optimal rank-k
%             approximation USV' to A, centering the columns of A first
%             when raw is false, using its normalized power iterations,
%             with block size l, started with a min(m,n) x l random
%             matrix, when A is m x n; the reference below explains
%             "nearly optimal." k must be a positive integer <= the
%             smaller dimension of A, its must be a nonnegative integer,
%             and l must be a positive integer >= k.
%
%
%   The low-rank approximation USV' comes in the form of a singular
%   value decomposition (SVD) -- the columns of U are orthonormal, as
%   are the columns of V, the entries of S are all nonnegative, and all
%   nonzero entries of S appear in non-increasing order on its diagonal.
%   U is m x k, V is n x k, and S is k x k, when A is m x n.
%
%   Increasing its or l improves the accuracy of the approximation USV';
%   the reference below describes how the accuracy depends on its and l.
%   Please note that even its=1 guarantees superb accuracy, whether or
%   not there is any gap in the singular values of the matrix A being
%   approximated, at least when measuring accuracy as the spectral norm
%   ||A-USV'|| of A-USV' (relative to the spectral norm ||A|| of A).
%
%
%   Note: pcafast invokes RAND. To obtain repeatable results, reset the seed
%         for the pseudorandom number generator.
%
%   Note: The user may ascertain the accuracy of the approximation USV'
%         to A by invoking DIFFSNORM(A,U,S,V,raw)
%
%
%   inputs (the first is required):
%   A -- matrix being approximated
%   k -- rank of the approximation being constructed;
%        k must be a positive integer <= the smaller dimension of A,
%        and defaults to 6
%   raw -- centers A when raw is false but does not when raw is true;
%          raw must be a Boolean and defaults to false
%   its -- number of normalized power iterations to conduct;
%          its must be a nonnegative integer, and defaults to 2
%   l -- block size of the normalized power iterations;
%        l must be a positive integer >= k, and defaults to k+2
%
%   outputs (all three are required):
%   U -- m x k matrix in the rank-k approximation USV' to A or C(A),
%        where A is m x n, and C(A) refers to A after centering its
%        columns; the columns of U are orthonormal
%   S -- k x k matrix in the rank-k approximation USV' to A or C(A),
%        where A is m x n, and C(A) refers to A after centering its
%        columns; the entries of S are all nonnegative, and all nonzero
%        entries appear in nonincreasing order on the diagonal
%   V -- n x k matrix in the rank-k approximation USV' to A or C(A),
%        where A is m x n, and C(A) refers to A after centering its
%        columns; the columns of V are orthonormal
%
%
%   Example:
%     A = rand(1000,2)*rand(2,1000);
%     A = A/normest(A);
%     [U,S,V] = pcafast(A,2,true);
%     diffsnorm(A,U,S,V,true)
%
%     This example produces a rank-2 approximation USV' to A such that
%     the columns of U are orthonormal, as are the columns of V, and
%     all entries of S are nonnegative and are zero off the diagonal.
%     diffsnorm(A,U,S,V,true) outputs an estimate of the spectral norm
%     of A-USV', which should be close to the machine precision.
%
%
%   Reference:
%   Nathan Halko, Per-Gunnar Martinsson, and Joel Tropp,
%   Finding structure with randomness: probabilistic algorithms
%   for constructing approximate matrix decompositions,
%   arXiv:0909.4061 [math.NA; math.PR], 2009
%   (available at http://arxiv.org).
%
%

%   Copyright 2016 Huamin Li, George C. Linderman, Kelly Stanton

%
% Check the number of inputs and
% set k, raw, its, and l to default values, if necessary.
%
if(nargin < 1)
    error('MATLAB:pcafast:TooFewIn',...
        'There must be at least 1 input.')
end
if(nargin < 2)
    k=6;
end
if(nargin < 3)
    raw = false;
end
if(nargin < 4)
    its = 2;
end
if(nargin < 5)
    l = k+2;
end


%
% Check the number of outputs.
%
if(nargout ~= 3)
    error('MATLAB:pcafast:WrongNumOut',...
        'There must be exactly 3 outputs.')
end

%
% Check the first input argument.
%
if(~isfloat(A))
    error('MATLAB:pcafast:In1NotFloat',...
        'Input 1 must be a floating-point matrix.')
end

if(isempty(A))
    error('MATLAB:pcafast:In1Empty',...
        'Input 1 must not be empty.')
end

%
% Retrieve the dimensions of A.
%
[m n] = size(A);

%
% Check the remaining input arguments.
%
if(~isscalar(k))
    error('MATLAB:pcafast:In2Not1x1',...
        'Input 2 must be a scalar.')
end

if(~isscalar(raw))
    error('MATLAB:pcafast:In3Not1x1',...
        'Input 3 must be a scalar.')
end

if(~isscalar(its))
    error('MATLAB:pcafast:In4Not1x1',...
        'Input 4 must be a scalar.')
end

if(~isscalar(l))
    error('MATLAB:pcafast:In5Not1x1',...
        'Input 5 must be a scalar.')
end

if(~(k > 0))
    error('MATLAB:pcafast:In2NonPos',...
        'Input 2 must be > 0.')
end

if (k>min(m,n))
    if nargin ==1
        error('MATLAB:pcafast:InTooTiny',...
            'The smaller dimension of the input must be >= 6.')
    else
        error('MATLAB:pcafast:In2TooBig',...
            'Input 2 must be <= the smaller dimension of Input 1.')
    end
end

if(~(its >= 0))
    error('MATLAB:pcafast:In4Bad',...
        'Input 4 must be >= 0.')
end

if(l < k)
    error('MATLAB:pcafast:In5ltIn2',...
        'Input 5 must be >= Input 2.')
end

if raw
    % Do not normalize
    applyA = @(X) A*X;
    applyAT = @(X) A'*X;
else
    % Normalize by the average of the entries in every column.
    c = mean(A,1);
    applyA = @(X) bsxfun(@minus,A*X,c*X);
    applyAT = @(X) A'*X-c'*sum(X,1);
end

% SVD the centered A directly if l >= m/1.25 or l >= n/1.25.
if((l >= m/1.25) || (l >= n/1.25))
    if raw
        [U,S,V] = svd(full(A),'econ');
    else
        [U,S,V] = svd(full(A)-ones(m,1)*c,'econ');
    end
    %   Retain only the leftmost k columns of U,
    %   the leftmost k columns of V, and the
    %   uppermost leftmost k x k block of S.
    U = U(:,1:k);
    V = V(:,1:k);
    S = S(1:k,1:k);
    return
end


if (m<n)
    R = 2*rand(l,m)-1 + ~isreal(A)*1i*(2*rand(l,m)-1);
    %   Apply the adjoint of A to a random matrix, obtaining Q.
    Q = applyAT(R');
else
    R = 2*rand(n,l)-1 + ~isreal(A)*1i*(2*rand(n,l)-1);
    %   Apply A to a random matrix, obtaining Q.
    Q = applyA(R);
end

%   Form a matrix Q whose columns constitute a well-conditioned basis
%   for the columns of the earlier Q.
if(its == 0)
    [Q,~,~] = qr(Q,0);
else
    [Q,~] = lu(Q);
end


if (m<n)
    %   Conduct normalized power iterations.
    for it = 1:its
        Q = applyA(Q);
        [Q,~] = lu(Q);
        Q = applyAT(Q);
        if(it < its)
            [Q,~] = lu(Q);
        else
            [Q,~,~] = qr(Q,0);
        end
    end
    
    %   SVD the A applied to Q to obtain approximations
    %   to the singular values and left singular vectors of the A;
    [U,S,R] = svd(applyA(Q),'econ');
    %   Adjust the right singular vectors to approximate
    %   the right singular vectors of A.
    V = Q*R;
else
    %   Conduct normalized power iterations.
    for it = 1:its
        Q = applyAT(Q);
        [Q,~] = lu(Q);
        Q = applyA(Q);
        if(it < its)
            [Q,~] = lu(Q);
        else
            [Q,~,~] = qr(Q,0);
        end
        
    end
    %   SVD Q' applied to the centered A to obtain approximations
    %   to the singular values and right singular vectors of the A;
    R = Q';
    [R,S,V] = svd(applyAT(R')','econ');
    
    %   Adjust the left singular vectors to approximate
    %   the left singular vectors of A.
    U = Q*R;
end

%   Retain only the leftmost k columns of U,
%   the leftmost k columns of V,
%   and the uppermost leftmost k x k block of S.
U = U(:,1:k);
V = V(:,1:k);
S = S(1:k,1:k);
