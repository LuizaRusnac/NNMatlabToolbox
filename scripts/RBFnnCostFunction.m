function [J, grad] = RBFnnCostFunction(W, X, T, nout, nhidden, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(T); % number of training examples

W = reshape(W,nout,nhidden+1);
% You need to return the following variables correctly 
J = 0;
% grad = zeros(size(W));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% H = inputBias(X)*W';
% J = (sum(sum((H-T).^2))/(2*m))+((lambda/(2*m))*sum(sum(W(2:end,:).^2)));
% 
% deltao = H-T;
% W_grad = deltao'*inputBias(X);
% W_grad = W_grad./m;
% W_grad(:,2:end) = W_grad(:,2:end) + ((lambda/m).*W(:,2:end));   % regularizare

H = X*theta;
% J = sum((H - y).^2)/(2*m
J = (1/(2*m))*((H-y)'*(H-y));

% =========================================================================

grad = W_grad(:);

end
