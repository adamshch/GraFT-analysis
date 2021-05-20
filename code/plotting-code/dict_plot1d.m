function dict_plot1d(varargin)

% function dict_plot1d(varargin)
% 
% Function to plot Dictionary elements for 'vector' types. Each column is
% one dictionary element, and is plotted in its own subplot. The subplots
% are placed in an array with dimensions given by plot_dims. The x-axis is
% given by either a vector x_vect, or simply indexed to the size of the
% dictionary elements.
% 
% Inputs:
%   dictionary_n    - dictionary to plot
%   plot_dims       - 2-element vector with dimensions of the subplots
%                     within the figure 
%   x_vect          - vector of x-axis positions
%   fig_no          - optional figure number (to keep overwriting the same
%                     figure
%
% Use:
%       dict_plot1d(dictionary_n, plot_dims) 
%                   Plot the columns of dictionary_n in a subplot array
%                   with dimensions plot_dims(1)Xplot_dims(2).
%       dict_plot1d(dictionary_n, x_vect, plot_dims) 
%                   Plot the columns of dictionary_n in a subplot array
%                   with dimensions plot_dims(1)Xplot_dims(2). The x-axis
%                   domain is given by x_vect.
%       dict_plot1d(dictionary_n, x_vect, plot_dims, fig_no) 
%                   Plot the columns of dictionary_n in a subplot array
%                   with dimensions plot_dims(1)Xplot_dims(2). The x-axis
%                   domain is given by x_vect. The figure number to plot in
%                   is given by fig_no.
%
% Last Modified 6/12/2010 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Check Inputs
if nargin == 2
	dictionary_n = varargin{1};
	plot_dims = varargin{2};
	x_vect = 1:size(dictionary_n, 1);
elseif nargin == 3
	dictionary_n = varargin{1};
	x_vect = varargin{2};
	plot_dims = varargin{3};
elseif nargin == 4
	dictionary_n = varargin{1};
	x_vect = varargin{2};
	plot_dims = varargin{3};
	fig_no = varargin{4};
end

if prod(plot_dims) < size(dictionary_n, 2)
    warning('Input:DimensionMismatch', ['Warning, the plotting '...
        'dimensions do not match the number of dictionary elements! '...
        'Not all dictionary elements will be plotted!'])
elseif prod(plot_dims) > size(dictionary_n, 2)
    warning('Input:DimensionMismatch', ['Warning, the plotting '...
        'dimensions do not match the number of dictionary elements! '...
        'There will be blank plots in the figure!'])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Plot Dictionary
if nargin == 4
	figure(fig_no);
else
	figure;
end

for index = 1:min(prod(plot_dims),size(dictionary_n, 2))
    subplot(plot_dims(1), plot_dims(2), index), ...
        plot(x_vect, dictionary_n(:, index))
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
