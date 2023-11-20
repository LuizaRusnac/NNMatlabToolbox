function net = rbf(nin, nhidden, nout, rbfunc, outfunc, method)
% -------------------------------------------------------------------------
%RBF	Creaza o retea de tipul RBF cu arhitectura specifica
%
%	Descriere
%	NET = RBF(NIN, NHIDDEN, NOUT, RBFUNC) construieste si initializeaza o
%	o retea neuronala de tipul RBF si returneaza o structura NET.
% 
%	Campurile din NET sunt:
%	- type = `rbf`
%   - nin = numarul neuronilor de intrare
%   - nhidden = numarul neuronilor din stratul ascuns
%   - nout = numarul neuronilor din stratul de iesire
%   - actfn = sir de caractere ce descrie functia de activare a neuronilor din stratul ascuns
%         "gaussian"
%         "tps"
%         "r4logr"
%   - outfn = sir de caractere ce descrie functia de activare a neuronilor din stratul de iesire
%         "linear"
%         "neuroscale"
%   - method = sir de caractere ce descrie metoda de antrenare
%         "kmeans"
%         "bkp"
%   - c = ponderile din stratul ascuns, reprezentate de centroizi, dimensiune [nin x nhidden]
%   - b = deviatia standard pentru fiecare neuron, dimensiune [1 x nhiddden]
%   - wo = ponderile neuronilor din stratul de ie?ire, impreun? cu biasul, dimensiune [nhidden+1 x nout]
% 
%	NET = RBF(NIN, NHIDDEN, NOUT, RBFUNC, OUTFUNC) permite utilizatorului sa specifice functia 
%   de activare a stratului de iesire.
% 
%	NET = RBF(NIN, NHIDDEN, NOUT, RBFUNC, OUTFUNC, METHOD) permite
%	specificarea metodei de antrenare: Kmeans sau Backpropagation
% 
%	Copyright (c) Rusnac Ana-Luiza - 26.03.2020
% -------------------------------------------------------------------------
%

net.type = 'rbf';
net.nin = nin;
net.nhidden = nhidden;
net.nout = nout;

% Se verifica functiile de activare
actfns = {'gaussian', 'tps', 'r4logr'};
outfns = {'linear', 'neuroscale'};
if (strcmp(rbfunc, actfns)) == 0
  error('Undefined activation function.')
else
  net.actfn = rbfunc;
end
if nargin <= 4
   net.outfn = outfns{1};
elseif (strcmp(outfunc, outfns) == 0)
   error('Undefined output function.')
else
   net.outfn = outfunc;
end

 methods = {'kmeans','bkp'};
if nargin < 5
    method = 'kmeans';
 elseif (strcmp(method, methods) == 0)
   error('Undefined output function.')
else
   net.method = method;
end

net.c = rand(nhidden,nin);

if strcmp(rbfunc, 'gaussian')
  net.b = ones(1, nhidden);
end

net.wo = rand(nhidden+1,nout);
end