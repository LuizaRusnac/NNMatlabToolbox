function beta = computebeta(net, X)
% -------------------------------------------------------------------------
% COMPUTESTD calculeaza beta pentru fiecare centroid
% 
% BETA = COMPUTESTD(NET, X) calculeaza BETA pentru fiecare centroid
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

% [idx] = algkmeans(X, net.c);

for i=1:size(net.c,1)
    d(i,:) = eucldist(net.c,net.c(i,:));
end

beta = max(max(d))/sqrt(net.nhidden);

end
