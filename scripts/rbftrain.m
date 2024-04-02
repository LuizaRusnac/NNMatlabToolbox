function [net] = rbftrain(net, x, t, smax)
% -------------------------------------------------------------------------
%RBFTRAIN Antrenarea retelei RBF in doua etape
%
%	Description
%	NET = RBFTRAIN(NET, X, T, SMAX) utilizeaza o antrenare in doua
%	etape pentru a obtine ponderile modelului RBF in structura NET. X
%	reprezinta o matrice care contine pe fiecare linie o observatie iar pe
%	fiecare coloana o trasatura. T reprezinta un vector ce contine iesirile
%   dorite pentru fiecare observatie din X. SMAX reprezinta numarul maxim de 
%   iteratii pentru calcularea ponderilor din startul de iesire.
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

net = randcenters(net, x, net.nhidden);

switch net.method
    case 'kmeans'
        net = mthkmeans(net, x);
    case 'bkp'
        error('Sorry... Not implemented yet');
    otherwise
        error('This method is not an option');
end
    
net.b = computebeta(net, x);

if nargin < 4
    smax = 100;
end

s=0;
while s<smax
    for i=1:size(x,1)
        y(i,:) = rbffwd(net, x(i,:));
        net = rbfbkd(net, x(i,:), y(i,:), t(i,:));
    end
s = s+1;
end

err = mse(t,y);
end



