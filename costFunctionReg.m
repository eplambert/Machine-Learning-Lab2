function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

c = 1/m;

for i = 1:m
    J =(-y(i).*log(sigmoid(X(i,:)*theta))-(1-y(i)).*log(1-(sigmoid(X(i,:)*theta))))+J;
    grad = ((sigmoid(X(i,:)*theta) - y(i))'*X(i,:))'+grad;
end
grad = grad*c;
grad(2:end) = grad(2:end)+((lambda*c)*theta(2:end));

J = J*c;
theta = theta(2:end)'*theta(2:end);

J = J + (lambda/(2*m))*theta;



% =============================================================

end