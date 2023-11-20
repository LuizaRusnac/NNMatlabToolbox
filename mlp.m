function net = mlp(nin, nhidden, nout, outfunc, alpha, lambda)
% -------------------------------------------------------------------------
%MLP	Creaza o retea neuronala de tipul feed-forward.
%
%	Descriere
% 
%	NET = MLP(NIN, NLAYER, NHIDDEN, NOUT, OUTFUNC) primeste ca parametrii de intrare
%   numarul de intrari in retea (NIN), numarul de straturi ascunse ale retelei MLP (NLAYER), 
%   numarul de neuroni pentru fiecare strat ascuns (NHIDDEN), numarul de iesiri
%   din retea (NOUT) si functia de activare a stratului ascuns (OUTFUNC). Functia returneaza
%   o structura cu denumirea NET. Ponderile sunt initializate avand o medie 0
%   si dupa o distributie Gaussiana. 
%
%   Campurile structurii NET sunt:
%         -	type = 'mlp'
%         -	nin = numarul neuronilor de intrare
%         - nlayer = numarul de straturi ascunse
%         -	nhidden = un vector numarul neuronilor din stratul ascuns
%         pentru fiecare strat ascuns
%         -	nout = numarul neuronilor din stratul de iesire
%         -	nwts = numarul total de ponderi si bias-uri
%         -	outfn = sir de caractere ce descrie functia de activare a
%         neuronilor din stratul de iesire:
%               'linear'
%               'tanh'
%               'softmax'
%               'sigmoid'
%         -	w1 = ponderile din stratul ascuns, dimensiune [nhidden x nin]
%         -	b1 = bias-urile neuronilor din stratul ascuns, dimensiune [1 x nhiddden]
%         -	w2 = ponderile neuronilor din stratul de ie?ire, dimensiune [nout x nhidden]
%         -	b2 = biasu-urile neuronilor din stratul de ie?ire, dimensiune [1 x nout]

%
%	NET = MLP(NIN, NHIDDEN, NOUT, FUNC, ALPHA), unde ALPHA permite
%	modificarea ratei de invatare a retelei, implicit este 0.1
%
%	NET = MLP(NIN, NHIDDEN, NOUT, FUNC, ALPHA, LAMBDA) permite modificarea
%	parametrului LAMBDA pentru regularizarea retelei

%	Copyright (c) Rusnac Ana-Luiza - 20.03.2020
% -------------------------------------------------------------------------

net.type = 'mlp';
net.nlayer = length(nhidden);
net.nin = nin;
net.nhidden = nhidden;
net.nout = nout;

if net.nlayer==1
    net.nwts = (nin + 1)*nhidden + (nhidden + 1)*nout;
else
    net.nwts = (nin + 1)*nhidden(1) + (nhidden(net.nlayer) + 1)*nout;
    for i=2:net.nlayer
        net.nwts = net.nwts + ((nhidden(i-1)+1)*nhidden(i));
    end
end

outfns = {'linear', 'tanh', 'softmax', 'logistic'};

if sum(strcmp(outfunc, outfns)) == 0
  error('Undefined output function. Exiting.');
else
  net.outfn = outfunc;
end

if nargin == 5
  if size(alpha) == [1 1]
    net.alpha = alpha;
  else
    error('Alpha must be a scalar');
  end  
else net.alpha = 0.1;
end

net.w_h{1,1} = randn(nhidden(1), nin);
net.b_h{1,1} = randn(1, nhidden(1));

for i=2:net.nlayer
  net.w_h{i,1} = randn(nhidden(i), nhidden(i-1));
  net.b_h{i,1} = randn(1, nhidden(i));
end
 
net.w_o = randn(nout, nhidden(net.nlayer));
net.b_o = randn(1, nout);
  
if nargin == 6
  net.lambda = lambda;
else
    net.lambda = 0;
end

end