function plotCenters( x, color)
% -------------------------------------------------------------------------
% PLOTCENTERS reprezentarea grafica a centroizilor
% 
% PLOTCENTERS(X,COLOR) reprezinta grafic sub forma de puncte in spatiu
% centroizii X avand culori diferite
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

plot(x(:,1),x(:,2),['*' color],'MarkerSize',10)

end

