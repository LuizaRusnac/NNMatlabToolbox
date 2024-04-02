function g = softmax(z)
% -------------------------------------------------------------------------
% SOFTMAX calculeaza functia softmax
% 
% Descriere
% 
% g = SOFTMAX(Z) calculeaza functia softmax pentru intrarea Z
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

g = exp(z)/sum(exp(z))
end
