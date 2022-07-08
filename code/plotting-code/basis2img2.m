function I = basis2img2(A, dimI, dims,varargin)

% function I = basis2img2(A, dims)
%
% A   - matrix of image patches
% dim - a 2x1 vector specifying number of rows and cols
%       for reshaping A
% dimI - a 2x1 vector specifying number of rows and cols
%       for reshaping each of the columns of A
% outputs I, an RGB image.  red dots indicate the relative max 
% pixel intensity level.


if nargin > 3
    nonneg = varargin{1};
else
    nonneg = false;
end
if nargin > 4
    mask = varargin{2};
end

N = size(A,1);
% M = size(A,2);

  
spacing = 5;
if nargin < 3
  a = floor(sqrt(size(A,2)));
  if size(A,2) > a*(a+1),  nrows = a+1;
  else                  ,  nrows = a; end
  ncols = ceil(sqrt(size(A,2)));
else
  nrows = dims(1); ncols = dims(2); 
end

if nargin < 2
    wx = sqrt(N);
    wy = sqrt(N);
else
    wx = dimI(1);
    wy = dimI(2);
end
  
if nonneg
    I = ones(wx*nrows+(nrows+1)*spacing, wy*ncols+(ncols+1)*spacing,3);
else
    I = zeros(wx*nrows+(nrows+1)*spacing, wy*ncols+(ncols+1)*spacing,3);
end

% maxrange = max(abs(A(:)));

for i = 1:size(A,2)
  if size(A,1) == wx*wy
        patch = reshape(A(:,i), wx, wy);
  else
      patch = zeros(wx, wy);
      patch(mask(:)) = A(:,i);
      [dx, dy] = gradient(mask);
      patch = patch + dx + dy;
  end
  sx    = (wy+spacing) * floor((i-1)/nrows)+1 + 1;
  sy    = (wx+spacing) * rem(i-1,nrows)+1 + 1; 

  prange = max(abs(patch(:)));
  if prange > .00001
      if nonneg
          patch = patch / prange; 
      else
          patch = .5 + .5*patch / prange; 
      end
  else
      if nonneg
          patch = patch; % + .5;
      else
      end
  end
%   I(sy+wx-1-floor((wx-1)*prange/maxrange), sx+wy,:) = [1 0 0];
  
  I(sy:sy+wx-1, sx:sx+wy-1,:) = repmat(patch,[1,1,3]);
end
