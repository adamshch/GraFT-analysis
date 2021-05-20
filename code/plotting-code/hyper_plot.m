function hyper_plot(basis, wl_vect, plot_dims, fig_no)

% function hyper_plot(basis, size)
% 
% Function to plot Hyperspectral Basis Funcitons
% 
% Inputs:
%   basis   - basis of images

figure(fig_no);
for index = 1:size(basis, 2)
    subplot(plot_dims(1), plot_dims(2), index), plot(wl_vect, basis(:, index))
end

end
