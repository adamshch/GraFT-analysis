function paramsOut = setParams(dParams, paramsIn)

% paramsOut = setParams(dParams, paramsIn)
%
%  paramsOut = setParams(dParams, paramsIn)
%
%  The output params struct will include the fields of dParams and paramsIn.
%  If the same field exists in both of them, the value will be taken from 'paramsIn'
%
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

paramsOut = dParams;
if isempty(paramsIn)
    return;
end

fnames = fieldnames(paramsIn);
for f=1:length(fnames)
    if isfield(paramsOut, fnames{f})
        if isstruct(paramsOut.(fnames{f}))
            val = setParams(paramsOut.(fnames{f}), paramsIn.(fnames{f}));
        else
            val = paramsIn.(fnames{f});
        end
        paramsOut.(fnames{f}) = val;
    else
        paramsOut.(fnames{f}) = paramsIn.(fnames{f});
    end
end

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%