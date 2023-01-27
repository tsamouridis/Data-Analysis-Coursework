clear variables; close all;

n = 100;
N = 10000;
y = zeros(1, N);
x = rand(N, n);

for ii = 1:N
    y(ii) = mean(x(ii, :));
end

% The height of each bar is, (number of observations in bin) /
% / (total number of observations * width of bin).
histogram(y, 'Normalization','pdf') 

mean_y = mean(y);
sigma_y = std(y);
t = 0:0.001:1;
pdf_chart = normpdf(t, mean_y, sigma_y);

hold on
plot(t, pdf_chart, 'Linewidth', 1.5);
grid on;
legend('Histogram of y', 'N(mean(y), Var(y))')
title('CLT simulation')