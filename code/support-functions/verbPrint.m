function verbPrint(verbLvl, verbCut, messOut)

% verbPrint(verbLvl, verbCut, messOut)
% 
% Function to output messages at a given level of verbosity
% 
% 2019 - Adam Charles

if verbLvl >= verbCut
    fprintf('%s\n',messOut)
end


end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%