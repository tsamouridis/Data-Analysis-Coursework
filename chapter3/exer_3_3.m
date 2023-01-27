close all; clear variables;

mu = 15;
lamda = 1/mu;

%% (a)

M = 1000;
n = 5;
alpha = 0.05;
samples1 = exprnd(mu, [n, M]);  % M samples of n observations

[~, ~, confidence_interval] = ttest(samples1, mu, 'Alpha', alpha); %t-test along each column

percentage_100 = 100*sum(mu >= confidence_interval(1, :) & mu <= confidence_interval(2, :)) / M;

fprintf('The real mean is within the confidence interval with percentage: %.2f %% \t [n=%d]\n', percentage_100, n)

%% (b)

M = 1000;
n = 10;
alpha = 0.05;
samples2 = exprnd(mu, [n, M]);

[~, ~, confidence_interval] = ttest(samples2, mu, 'Alpha', alpha);

percentage_100 = 100* sum(mu >= confidence_interval(1, :) & mu <= confidence_interval(2, :)) / M;

fprintf('The real mean is within the confidence interval with percentage: %.2f %% \t [n=%d]\n', percentage_100, n)

%%
% Δεν παρατηρείται σημαντική απόκλιση για n=10 ή n=5