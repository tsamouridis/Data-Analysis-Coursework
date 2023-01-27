clear variables; close all;

mu = 0;
variance = 1;
sigma = 1;

M = 100;
n = 10;
m = 12;

B = 1000; % number of bootstrap samples

X = normrnd(mu, sigma, n, M);
Y = normrnd(mu, sigma, m, M);

p_parametric = nan(1, M);
p_bootstrap = nan(1, M);
p_permutation = nan(1, M);

alpha = 0.05;

for i = 1:M
    % parametric
    p_parametric(i) = ttest2(X(:, i), Y(:, i));
    
    % bootstrap
    p_bootstrap(i) = mean_difference_bootstrap_test(X(:, i), Y(:, i), n, B, alpha);
    
    % permutation
    p_permutation(i) = mean_difference_permutation_test(X(:, i), Y(:, i), n, B, alpha);  
end

parametric_percentage = sum(p_parametric == 1);
bootstrap_percentage = sum(p_bootstrap == 1);
permutation_percentage = sum(p_permutation == 1);

fprintf('Percentage of rejection of the Ηypothesis: E[X] = E[Y]:\n')
fprintf('  Parametric: %d %%\n', parametric_percentage)
fprintf('  Bootstrap: %d %%\n', bootstrap_percentage)
fprintf('  Permutation: %d %%\n', permutation_percentage)

