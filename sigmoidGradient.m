function g = sigmoidGradient(z)
% -------------------------------------------------------------------------
% SIGMOIDGRADIENT returneaza gradientul functiei sigmoidale evaluat pentr z
% 
% Descriere
% 
%   g = SIGMOIDGRADIENT(z) calculeaza gradientul functiei sigmoidale
%   evaluat pentru z. 
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

g = zeros(size(z));

g = sigmoid(z) .* (1 - sigmoid(z));


end