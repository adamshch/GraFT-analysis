function viewMovAndRes(mov,S,D)


recon = reshape(reshape(S,[],size(D,2))*D', size(mov));
res   = mov-recon;

MovieSlider(cat(1, mov, recon, 1+res))