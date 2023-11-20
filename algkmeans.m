function [idx] = algkmeans(X, c)
% -------------------------------------------------------------------------
% ALGKMEANS Calculeaza distanta euclidiana de la fiecare vector X la
% fiecare centroid si ofera apartenenta acestora la centroid
% 
% IDX = ALGKMEANS(X, C) - calculeaza distanta euclidiana de la fiecare
% vector de intrare X la fiecare centroid C si ofera un vector IDX in care
% este specificat centroidul de apartenenta a fiecarui vector de intrare. X
% este un set de date in care fiecare linie corespunde unei observatii iar
% fiecare coloana reprezinta o trasatura.
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

for i=1:size(c,1);
    dist(:,i) = eucldist(X, c(i,:));
end

[c, idx] = min(dist,[],2);

end