function dict_out = dictInitialize(dict_init, T, N)

% dict_out = dictInitialize(dict_init, T, N)
%
% Function to initialize a TxN sized dictionary. The columns of the 
% dictionary are normalized to unit norm. If a matrix is fed in as the 
% first input, that dictionary is just normalized (no random 
% initialization performed).
%
% 2019 - Adam Charles

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 

if isempty(dict_init)                                                      % If no dictionary is provided:
    dict_out = rand(T,N);                                                  %  - Initialize dictionary randomly
    dict_out = dict_out*diag(1./sqrt(sum(dict_out.^2,1)));                 %  - Normlize each vector in the dictionary
else                                                                       % Otherwise:
    dict_out = dict_init;                                                  %  - Use given initial dicitonary
    dict_out = dict_out*diag(1./sqrt(sum(dict_out.^2,1)));                 %  - Normlize each vector in the dictionary
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
