%% Implements logistic regression with regularization
clear all; close all; clc;

%% This code is for 3 different characterisitcs using only two attributes to predict the outcome

% column 1 contains the x1 parmaeter
% column 2 contains the x2 parameter
% column 3 contains either a 1 or 0. A 1 is used to signify that you want
% to distinguish between one characterisitic and the others.
%example: running=1 walking =0 resting =0   This would look to classify run
%versus all

%load whatever text file you desire
data = load('differential_run.txt');    
X = data(:, [1, 2]); y = data(:, 3);


%% mapping features
% maps the features to a polynomial
X1 = X(:,1);
X2 = X(:,2);

degree = 5;
out = ones(size(X1(:,1)));
for i = 1:degree
    for j = 0:i
        out(:, end+1) = (X1.^(i-j)).*(X2.^j);
    end
end
X = out;
%Initial theta values selected to be zeros
initial_theta = zeros(size(X, 2), 1);

%Parameter in which regularization occurs
%set lambda = 0 for no regulaization
lambda = 1;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

%% Logistic Regression using the fminunc to minimize cost to find optimize thetas
% theta is optimized parameters and J is the cost
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, lambda)), initial_theta, options);

disp(theta)
