function g = tanhFnc(z)
% -------------------------------------------------------------------------
% tanhFnc calculeaza functia sigmoidala
% 
% Descriere
% 
% g = tanhFnc(Z) calculeaza functia tanh pentru intrarea Z
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

g = (exp(z) - exp(-z)) ./ (exp(z) + exp(-z));
end
