function net = rbfbkd(net, x, y, t, eta)
% -------------------------------------------------------------------------
% RBFBKD calcularea ponderilor din stratul de iesire utilizand algoritmul
% backpropagation
% 
% NET = RBFBKD(NET,X,Y,T) calculearea ponderilor din stratul de iesire
% utilizand algoritmul backpropagation. X reprezinta un set de date care pe
% fiecare linie prezinta un vector de intrare si pe fiecare coloana o
% trasatura. Y reprezinta iesirea din retea. T reprezinta iesirea dorita.
% 
% NET = RBFBKD(NET,X,Y,T,ETA) calculearea ponderilor din stratul de iesire
% utilizand algoritmul backpropagation. X reprezinta un set de date care pe
% fiecare linie prezinta un vector de intrare si pe fiecare coloana o
% trasatura. Y reprezinta iesirea din retea. T reprezinta iesirea dorita.
% ETA reprezinta rata de invatare, care implicit este 0.1.
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------
if nargin < 5
    eta = 0.1;
end

switch net.outfn
    case 'linear'
        err = (t - y);
        yh = rbfhddoutput(net, x);
        net.wo = net.wo + eta.*repmat(err,net.nhidden+1,1).*repmat([1 yh]',1,net.nout);
    case 'neuroscale'
        error('Sorry... Not implemented yet')
    otherwise
        error('Not a valid function')
end

end
