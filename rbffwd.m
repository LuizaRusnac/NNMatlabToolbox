function y = rbffwd(net, X)
% -------------------------------------------------------------------------
% RBFFWR calculeaza iesirea din retea
% 
% Y = RBFFWR(NET,X) calculeaza iesirea din retea pentru reteaua neuronala
% de tip RBF avand structura NET si setul de date X.
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

switch net.actfn
    case 'gaussian'
        yhidden = rbfhddoutput(net, X);
    case 'tps'
        error('Sorry... Not implemented yet')
    case 'r4logr'
        error('Sorry... Not implemented yet')
    otherwise
        error('Not a valid function')
end

switch net.outfn
    case 'linear'
        y = [ones(size(yhidden,1),1) yhidden] * net.wo;
    case 'neuroscale'
        error('Sorry... Not implemented yet')
    otherwise
        error('Not a valid function')
end

end