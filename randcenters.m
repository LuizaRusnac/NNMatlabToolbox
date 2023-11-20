function net = randcenters(net, X, k)
% -------------------------------------------------------------------------
% RANDCENTERS initializarea centroizilor cu vectori din setul de date
% 
% RANDCENTERS(NET,X,K) - initializarea centroizilor in stuctura NET cu
% vectori din setul de date X
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

idx = randperm(size(X,1));

net.c = X(idx(1:k),:);

end