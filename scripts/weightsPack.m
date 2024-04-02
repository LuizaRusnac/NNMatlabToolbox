function wpack = weightsPack(net)
% -------------------------------------------------------------------------
% WEIGHTSPACK compacteaza ponderile retelei intr-un vector wpack
% 
% Descriere
% 
%   wpack = WEIGHTSPACK(net) compacteaza ponderile retelei intr-un vector
% wpack. Primeste ca parametru de intrare o structura net
%  
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------
W1 = [];
for i = 1:net.nlayer
  temp = [net.b_h{i,1}' net.w_h{i,1}];
  W1 = [W1; temp(:)];
end

W2 = [net.b_o' net.w_o];

wpack = [W1(:); W2(:)];

end
