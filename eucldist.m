function dist = eucldist(data, centers)
% -------------------------------------------------------------------------
% EUCLDIST calculeaza distanta euclidiana
% 
% DIST = EUCLDIST(DATA, CENTERS) - calculeaza distanta euclidiana de la
% DATA la centroizii CENTERS
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

dist = sqrt(sum((data-repmat(centers,size(data,1),1)).^2,2));

end