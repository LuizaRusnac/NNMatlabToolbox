function [ y, z ] = nnFeedForward( wpack,X,nin,nlayer,nhidden,nout)
% -------------------------------------------------------------------------
% NNFEEDFORWARD calculeaza iesirea din retea
% 
% Descriere
% 
% [y, z] = NNFEEDFORWARD(WPACK, X, NIN, NLAYER, NHIDDEN, NOUT) calculeaza
% iesirea din retea utilizand setul de date X si ofera o celula y care
% contine iesirile tuturor straturilor retelei si o celula z, care contine
% doar suma dintre intrare si ponderi (fara aplicarea functiei de activare)
% pentru toate straturile retelei
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

##v = [nhidden nout; nin+1 nhidden+1];

v = [nhidden(1); nin + 1];
for i = 2:nlayer
  v = [v [nhidden(i); nhidden(i - 1) + 1]];
end

v = [v [nout; nhidden(nlayer) + 1]];

[m, n] = size(X);

start = 1;
stop = v(1,1)*v(2,1);
y{1,1} = round(10000.*sigmoid(inputBias(X)*reshape(wpack(start:stop),v(1,1),v(2,1))'))./10000;

start = stop+1;
for i=2:nlayer+1
    stop = start-1 + v(1,i)*v(2,i);
    y{i,1} = round(10e6.*sigmoid(inputBias(y{i-1,1})*reshape(wpack(start:stop),v(1,i),v(2,i))'))./10e6;
    y{i,1}(find(y{i,1}==0)) = 0.0001;
    y{i,1}(find(y{i,1}==1)) = 0.9999;
    z{i,1} = round(10e6.*inputBias(y{i-1,1})*reshape(wpack(start:stop),v(1,i),v(2,i))')./10e6;
    start = stop+1;
end



end

