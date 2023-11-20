function plotdata( x, d )
% -------------------------------------------------------------------------
% PLOTDATA reprezentarea grafica a setului de date avand culori diferite
% pentru fiecare clasa
% 
% PLOTDATA(X,D) - reprezentarea grafica a setului de date X avand culori
% diferite pentru clasele din D
% 
% Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

%[maxim, d] = max(d,[],2);

figure, plot(x(find(d==1),1),x(find(d==1),2),'xr')
hold on, plot(x(find(d==2),1),x(find(d==2),2),'xb')
hold off

end
