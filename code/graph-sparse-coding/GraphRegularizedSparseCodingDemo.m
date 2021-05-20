clear;	
load('lights=27.mat');
nClass = length(unique(gnd));

%Normalize each data vector to have L2-norm equal to 1  
fea = NormalizeFea(fea);

%Clustering in the original space
rand('twister',5489);
label = litekmeans(fea,nClass,'Replicates',10);
MIhat = MutualInfo(gnd,label);
disp(['kmeans use all the features. MIhat: ',num2str(MIhat)]);
%kmeans in the original space. MIhat: 0.66064

options.ReducedDim = 64;
eigvector = PCA(fea, options);
newfea = fea*eigvector;
newfea = NormalizeFea(newfea);
%Clustering in 64-dim PCA subspace
rand('twister',5489);
label = litekmeans(newfea,nClass,'Replicates',10);
MIhat = MutualInfo(gnd,label);
disp(['kmeans in the 64-dim PCA subspace. MIhat: ',num2str(MIhat)]);
%kmeans in the 64-dim PCA subspace. MIhat: 0.65946

rand('twister',5489);
W = constructW(fea);

nBasis = 128;
alpha = 1;
beta = 0.1;
nIters = 15;
rand('twister',5489);
warning('off', 'all');
[B, S, stat] = GraphSC(newfea', W, nBasis, alpha, beta, nIters); %'
%Clustering in 128-dim GraphSC subspace
rand('twister',5489);
label = litekmeans(S',nClass,'Replicates',10); %'
MIhat = MutualInfo(gnd,label);
disp(['Clustering in the ',num2str(nBasis),'-dim GraphSC subspace with ',num2str(nIters),' iterations. MIhat: ',num2str(MIhat)]);
%Clustering in the 128-dim GraphSC subspace with 15 iterations. MIhat: 0.80253

nIters = 30;
rand('twister',5489);
warning('off', 'all');
[B, S, stat] = GraphSC(newfea', W, nBasis, alpha, beta, nIters); %'
rand('twister',5489);
label = litekmeans(S',nClass,'Replicates',10); %'
MIhat = MutualInfo(gnd,label);
disp(['Clustering in the ',num2str(nBasis),'-dim GraphSC subspace with ',num2str(nIters),' iterations. MIhat: ',num2str(MIhat)]);
%Clustering in the 128-dim GraphSC subspace with 30 iterations. MIhat: 0.86948

nIters = 100;
rand('twister',5489);
warning('off', 'all');
[B, S, stat] = GraphSC(newfea', W, nBasis, alpha, beta, nIters); %'
rand('twister',5489);
label = litekmeans(S',nClass,'Replicates',10); %'
MIhat = MutualInfo(gnd,label);
disp(['Clustering in the ',num2str(nBasis),'-dim GraphSC subspace with ',num2str(nIters),' iterations. MIhat: ',num2str(MIhat)]);
%Clustering in the 128-dim GraphSC subspace with 100 iterations. MIhat: 0.92865