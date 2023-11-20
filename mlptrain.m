function [net, error] = mlptrain(net, X, d, its)
% -------------------------------------------------------------------------
%MLPTRAIN Antrenarea unei retele neuronale de tipul MLP
%
%	Descriere
%
%	[NET, ERROR] = MLPTRAIN(NET, X, T, ITS) antreneaza o retea neuronala cu
%	structura NET utilizand algorimul de gradient negativ pentru un numar
%	de iteratii ITS pentru setul de data X, avand iesirea dorita D
% 
%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

options = optimset('MaxIter', its);
net.lambda = 0;

if strcmp(net.outfn,'logistic') == 1
    costFunction = @(p) nnCostFunction(p, net.nin, net.nlayer,...
                                                net.nhidden, net.nout, X, d,...
                                                net.alpha, net.lambda);
elseif strcmp(net.outfn,'tanh') == 1
    costFunction = @(p) nnCostFunctionTanh(p, net.nin, net.nlayer,...
                                                net.nhidden, net.nout, X, d,...
                                                net.alpha, net.lambda, net.outfn);
else
    error('This function is not implemented')
end

initial_weights = weightsPack(net);                           
[wpack, error] = fmincg(costFunction, initial_weights, options);         
##[wpack, error] = fminunc(costFunction, initial_weights, options);                    
[ net ] = weightsUnpack( net, wpack );

end


