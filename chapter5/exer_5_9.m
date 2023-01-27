clear all; close all;

data = readmatrix("hospital.txt");
y = data(:, 1);
x1 = data(:, 2);
x2 = data(:, 3);
x3 = data(:, 4);

X = [ones(size(x1)) x1 x2 x3];
b = regress(y, X);

yfit = X*b;
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
stepwise(data(:,2:end), y);




