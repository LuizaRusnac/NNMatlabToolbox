function net = rbfcomputec(net, X, idx)
% -------------------------------------------------------------------------
% RBFCOMPUTEC recalculeaza centroidul dupa stabilirea apartenentei fiecarui vector de
% intrare la centroid
% 
% NET = RBFCOPUTEC(NET, X, IDX) - recalculeaza centroidul dupa stabilirea
% apartenentei fiecarui vector de intrare X la centroid. Functia are ca
% parametru de iesire structura net avand centroizii recalculati.
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

N = length(unique(idx));

for i=1:N
    net.c(i,:) = sum(X(find(idx==i),:))/sum(idx==i);
end

end
