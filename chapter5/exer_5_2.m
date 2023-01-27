clear variables; close all; clc;

alpha = 0.05;
M = 1000;
n = 20;
L = 1000;

mu_x = 0;
mu_y = 0;
mu = [mu_x, mu_y];

sigma_x = 1;
sigma_y = 1;

rho1 = 0;
rho2 = 0.5;

covariance1 = rho1*sigma_x*sigma_y;
covariance2 = rho2*sigma_x*sigma_y;
sigma1 = [sigma_x^2, covariance1; covariance1, sigma_y^2];
sigma2 = [sigma_x^2, covariance2; covariance2, sigma_y^2];

%% (a)

% rejection_percentagei is the percentage of rejection of the hypothesis
% that rho = 0 for the i-th sample
rejection_percentage1 = 0;
rejection_percentage2 = 0;

for i = 1:M
    % sample1 with rho = 0
    sample1 = mvnrnd(mu, sigma1, n);
    H1 = permutation_correlation_test(sample1(:, 1), sample1(:, 2), L, alpha);
    if H1
        rejection_percentage1 = rejection_percentage1 + 1;
    end
    
    %sample2 with rho = 0.5
    sample2 = mvnrnd(mu, sigma2, n);
    H2  = permutation_correlation_test(sample2(:, 1), sample2(:, 2), L, alpha);
    if H2
        rejection_percentage2 = rejection_percentage2 + 1;
    end
end

fprintf('The null Hypothesis(rho = 0) is rejected with percentage:\n')
fprintf('-For rho = 0: %f %%\n', rejection_percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', rejection_percentage2/10)

%% (b)

rejection_percentage1 = 0;
rejection_percentage2 = 0;

for i = 1:M
    % sample1 with rho = 0
    sample1 = mvnrnd(mu, sigma1, n);
    sample1 = sample1.^2;
    H1 = permutation_correlation_test(sample1(:, 1), sample1(:, 2), L, alpha);
    if H1
        rejection_percentage1 = rejection_percentage1 + 1;
    end
    
    %sample2 with rho = 0.5
    sample2 = mvnrnd(mu, sigma1, n);
    sample2 = sample2.^2;
    H2  = permutation_correlation_test(sample2(:, 1), sample2(:, 2), L, alpha);
    if H2
        rejection_percentage2 = rejection_percentage2 + 1;
    end
end

fprintf('The null Hypothesis(rho = 0) is rejected with percentage:\n')
fprintf('-For rho = 0: %f %%\n', rejection_percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', rejection_percentage2/10)









