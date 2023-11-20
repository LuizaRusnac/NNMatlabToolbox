function X = inputBias(X)
% -------------------------------------------------------------------------
% INPUTBIAS concatenarea intrarii pentru ponerile w0 cu itrarea X
% 
% Descriere
% 
% X = INPUTBIAS(X) concateneaza vectroul sau matricea X cu o coloana de
% dimensiune egala cu numarul de linii a intrarii.
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

X = [ones(size(X,1),1) X];

end