function g = sigmoid(z)
% -------------------------------------------------------------------------
% SIGMOID calculeaza functia sigmoidala
% 
% Descriere
% 
% g = SIGMOID(Z) calculeaza functia sigmoidala pentru intrarea Z
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

g = 1.0 ./ (1.0 + exp(-z));
end
