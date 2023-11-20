function beta = computestd(net, X)
% -------------------------------------------------------------------------
% COMPUTESTD calculeaza beta pentru fiecare centroid
% 
% BETA = COMPUTESTD(NET, X) calculeaza BETA pentru fiecare centroid
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

[idx] = algkmeans(X, net.c);

for i = 1:net.nhidden
    stdev(i,:) = sqrt(sum((X(idx==i,:) - repmat(net.c(i,:),size(X(idx==i,:),1),1)).^2)/size(X(idx==i,:),1));
end

beta = 1 ./ (2 .* (stdev .^ 2));

end