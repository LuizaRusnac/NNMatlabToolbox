function yhidden = rbfhddoutput(net, X)
% -------------------------------------------------------------------------
% RBFHDDOUTPUT calculeaza iesirea din stratul ascuns

% 
% YHIDDEN = RBFHDDOUTPUT(NET,X) - calculeaza iesirea din stratul ascuns
% pentru reteaua neuronala cu arhitectura NET
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------
for i=1:net.nhidden
    net_h = eucldist(X, net.c(i,:));
    yhidden(:,i) = exp(-(net_h.^2)/(2.*net.b.^2));
end
        
end
