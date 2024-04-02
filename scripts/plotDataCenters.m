function plotDataCenters(X, k, idx)
% -------------------------------------------------------------------------
% PLOTDATACENTERS reprezentarea grafica a centroizilor avand culori
% diferite
% 
% PLOTDATACENTERS(X,K,IDX) - reprezentarea grafica a centroizilor X avand
% culori diferite
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

colors = 'rgbcmy';
hold on
for i=1:k
    plot(X(idx==i,1),X(idx==i,2),['*' colors(i)])
end

end
