function [net] = mthkmeansdemo(net, X)
% -------------------------------------------------------------------------
% MTHKMEANSDEMO realizeaza algoritmul kmeans cu posibilitatea vizualizarii
% centroizilor in timpul modificarii acestora
% 
% NET = MTHKMEANSDEMO(NET,X) -  realizeaza algoritmul kmeans cu posibilitatea
% vizualizarii centroizilor in timpul modificarii acestora
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------

figure, 
init_centers = net.c;
for v = 1:10
    [idx] = algkmeans(X, net.c);
    plotDataCenters(X, net.nhidden, idx)
    hold on
    color = 'k';
    plotCenters(net.c, color)
    pause(2)
    net = rbfcomputec(net, X, idx);
    
    for j=1:net.nhidden
        drawLine(init_centers(j, :), net.c(j, :));
    end

    init_centers = net.c;
    
    pause(1)
    
    plotCenters(net.c, color)
end

hold off
end