function [J, grad] = nnCostFunctionTanh(nnweights, nin, nlayer,...
                                            nhidden, nout, X, T,...
                                            alpha, lambda)
% -------------------------------------------------------------------------
%NNCOSTFUNCTION implementeaza functia cost a retelei neuronale
% 
%   [J grad] = NNCOSTFUNCTON(nnweights, nin, nlayer, nhidden, nout, X, d, lambda)
% calculeaza costul si gradientul retelei neuronale.
% 
%   Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

% Initializarea unor variabile utile
m = size(X, 1);

v = [nhidden(1); nin + 1];
for i = 2:nlayer
  v = [v [nhidden(i); nhidden(i - 1) + 1]];
end

v = [v [nout; nhidden(nlayer) + 1]];

J = 0;

% Calcularea iesirii din retea utilizand ponderile nnweights si retinerea
% acesteia pentru fiecare strat
[y] = nnFeedForwardTanh(nnweights,X,nin,nlayer,nhidden,nout);

% Modificarea iesirii dorite d a. i. sa corespunda stratului de iesire
% T = zeros(size(y{nlayer+1,1}));
% for i=1:nout
%     T(d==i,i) = 1;
% end

% Calcularea functiei cost J
J = sum(sum(((-T).*log(y{nlayer+1,1}))-((1-T).*log(1-y{nlayer+1,1}))))/m
##J = sum(sum(((-T).*log((y{nlayer+1,1}+1)/2))-((1-T).*log(1-((y{nlayer+1,1}+1)/2)))))/m
##J = sum(sum(((1 - T).*log(1 - y{nlayer + 1,1})) + ((1 + T).*log(1 + y{nlayer + 1,1})) + log(2)))/m
##J = sum(sum(((-T).*log(softmax(y{nlayer+1,1})))-((1-T).*log(1-softmax(y{nlayer+1,1})))))/m

% Regularizarea functiei cost
start = 1;
for i=1:nlayer+1
    stop = start-1 + v(1,i)*v(2,i);
    W = reshape(nnweights(start:stop),v(1,i),v(2,i));
    J = J + ((lambda/(2*m))*(sum(sum(W(:,2:end).^2))));
    start = stop+1;
end

% Calcularea erorii delta pt stratul de iesire
deltao = (T - y{nlayer+1,1});

% Refacerea ponderilor din stratul de iesire sub forma de matrice
start = length(nnweights) - v(1,nlayer+1)*v(2,nlayer+1) + 1;
stop = length(nnweights);
W = reshape(nnweights(start:stop),v(1,nlayer+1),v(2,nlayer+1));

% Calcularea gradientului pt ponderile stratului de iesire
W_grad = alpha*deltao'*inputBias(y{nlayer,1});
W_grad = W_grad./m;
W_grad(:,2:end) = W_grad(:,2:end) + (lambda/m).*W(:,2:end);   % regularizare

% Salvarea gradientului pt ponderile de iesire in grad
grad = W_grad(:);

% Calcularea erorii delta si a gradientului pentru stratul/straturile ascunse
for i=nlayer:-1:2
    
    stop = start-1;
    start = stop - v(1,i)*v(2,i) + 1;
    
    deltah = deltao*W(:,2:end);
    gz = (1 - y{i,1}.^2);
    deltah = deltah .* gz;
    
    W = reshape(nnweights(start:stop),v(1,i),v(2,i)); 
    
    W_grad = alpha*deltah'*inputBias(y{i-1,1});
    W_grad = W_grad./m;
    W_grad(:,2:end) = W_grad(:,2:end) + (lambda/m).*W(:,2:end);
    
    deltao = deltah;
    
    grad = [W_grad(:); grad];
end

i=1;
start = 1;
stop = sum(v(1,i).*v(2,i));

% Calcularea erorii delta pentru stratul de intrare
deltah = deltao*W(:,2:end);
gz = (1 - y{i,1}.^2);  
deltah = deltah .* gz;

% Refacerea ponderilor din stratul de intrare sub forma de matrice
W = reshape(nnweights(start:stop),v(1,i),v(2,i));

% Calcularea gradientului pentru ponderile de intare
W_grad = alpha*deltah'*inputBias(X);   
W_grad = W_grad./m;
W_grad(:,2:end) = W_grad(:,2:end) + ((lambda/m).*W(:,2:end));

grad = [W_grad(:); grad];
    
end
