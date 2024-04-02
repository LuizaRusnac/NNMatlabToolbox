function [net] = mthkmeans(net, X)
% -------------------------------------------------------------------------
% MTHKMEANS algoritmul kmeans
% 
% NET = MTHKMEANS(NET,X) - algoritmul kmeans pentru reteauea NET si setul
% de date X
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

[idx, net.c] = kmeans(X,net.nhidden);
end
