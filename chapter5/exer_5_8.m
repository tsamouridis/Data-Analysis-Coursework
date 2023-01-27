clear all; close all;

data = readmatrix("physical.txt");
y = data(:, 1);
x1 = data(:, 2);
x2 = data(:, 3);
x3 = data(:, 4);
x4 = data(:, 5);
x5 = data(:, 6);
x6 = data(:, 7);
x7 = data(:, 8);
x8 = data(:, 9);
x9 = data(:, 10);
x10 = data(:, 11);

% multiple linear regression

X = [ones(size(x1)) x1 x2 x3 x4 x5 x6 x7 x8 x9 x10];
% [~, bci, residuals, residualsInt, stats] = regress(y,X);
b = regress(y,X);

yfit = X*b; % == residuals

e = y - yfit;
RSS = sum(e.^2); % Residual sum of squares
TSS = sum((y - mean(y)).^2); % Total Sum of Squares == TSS = (n-1)*var(y)
Rsq = (TSS-RSS)/TSS; % == stats(1)
k = length(b)-1;
n = length(x1);
adjRsq = 1 - (RSS/TSS) * (n-1)/(n-k-1);
fprintf('Multiple Linear Regression:\n')
fprintf('R-square: %f\n', Rsq);
fprintf('Adjusted-R-square: %f\n\n', adjRsq);

%% stepwise
% b_stepwise = stepwisefit(data(:,2:end), y)
stepwise(data(:,2:end), y);
