function W = randInitW(L_in, L_out)
% -------------------------------------------------------------------------
% RANDINITW initializeaza aleator pondrile unui strat cu L_in
% intrari si L_out iesiri
% 
% Descriere
% 
%   W = RANDINITW(L_in, L_out) initializeaza aleator pondrile 
% unui strat cu L_in intrari si L_out iesiri
%   
%   Dimensiunea matricii W: [L_out, L_int + 1] deoarece se introduce si
%   biasul
% 
%   Nota: Prima coloana din W corespunde bias-ului (W0)
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

W = zeros(L_out, 1 + L_in);

epsilon_init = 0.12;
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;

end
