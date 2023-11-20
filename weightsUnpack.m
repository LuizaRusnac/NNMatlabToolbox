function [ net ] = weightsUnpack( net, wpack )
% -------------------------------------------------------------------------
% WEIGHTSUNPACK reface ponderile W ale structurii net
% 
% Descriere
% 
%   net = WEIGHTSUNPACK(net) reface ponderile retelei ale structurii
% net. Primeste ca parametru de intrare o structura net si ponderile
% compacte, wpack si ofera structura net avand ponderile deja modificate.
%  
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------        

##v = [net.nhidden net.nout; net.nin+1 net.nhidden+1];
v = [net.nhidden(1); net.nin + 1];
for i = 2:net.nlayer
  v = [v [net.nhidden(i); net.nhidden(i - 1) + 1]];
end

v = [v [net.nout; net.nhidden(net.nlayer) + 1]];

start = 1;
for i=1:net.nlayer
    stop = start-1 + v(1,i)*v(2,i);
    net.b_h{i,1} = wpack(start : (start - 1 + net.nhidden(i)))';
    start = start + net.nhidden(i);
    net.w_h{i,1} = reshape(wpack(start:stop),v(1,i),v(2,i)-1);
    start = stop + 1;
end

stop = start-1 + v(1,i+1)*v(2,i+1);
net.b_o = wpack(start : (start - 1 + net.nout))';
start = start + net.nout;
net.w_o = reshape(wpack(start:stop),v(1,i+1),v(2,i+1)-1);

##start = 1;
##net.b_h{1,1} = wpack(start:net.nhidden(1));
##start = start + net.nhidden(1);
##stop = net.nhidden(1) * (net.nin + 1);
##net.w_h{1,1} = 
##
##for i=2:net.nlayer - 1  
##  start = stop;
##  net.b_h{i,1} = wpack(start : start + net.hidden(i));
##  start = start + net.hidden(i)
##  net.w_h{i,1} = reshape(wpack(start + net.nhidden(i):stop),

##W1 = reshape(wpack(1:net.nhidden*(net.nin+1)),net.nhidden,net.nin+1);
##W2 = reshape(wpack(net.nhidden*(net.nin+1)+1:end),net.nout,net.nhidden+1);
##
##net.w1 = W1(:,2:end);
##net.b1 = W1(:,1)';
##net.w2 = W2(:,2:end);
##net.b2 = W2(:,1)';

end

