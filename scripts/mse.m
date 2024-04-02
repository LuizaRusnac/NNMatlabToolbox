function err = mse(t, y)
% -------------------------------------------------------------------------
% MSE calculeaza eroarea medie patratica
% 
% ERR = MSE(T,Y) calcuelaza eroarea medie patratica dintre vectorul tinta T
% si iesirea din retea Y
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

err = (0.5*sum(sum((t-y).^2)))/size(t,1);

end
