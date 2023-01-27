clear variables; close all; clc;

alpha = 0.05;
M = 1000;
n = 20;

mu_x = 0;
mu_y = 0;
mu = [mu_x, mu_y];

sigma_x = 1;
sigma_y = 1;

rho1 = 0;
rho2 = 0.5;

covariance1 = rho1*sigma_x*sigma_y;
covariance2 = rho2*sigma_x*sigma_y;
sigma1 = [sigma_x, covariance1; covariance1, sigma_y];
sigma2 = [sigma_x, covariance2; covariance2, sigma_y];

%% (a), (b)
% percentagei is the percentage the confidence interval contatins the real
% rho for the i-th sample
percentage1 = 0;
percentage2 = 0;

% rejection_percentagei is the percentage of rejection of the hypothesis
% that rho = 0 for the i-th sample
rejection_percentage1 = 0;
rejection_percentage2 = 0;

% the confidence interval limits for the i-th sample
lower_limit1 = nan(1, M);
lower_limit2 = nan(1, M);
upper_limit1 = nan(1, M);
upper_limit2 = nan(1, M);

fprintf('=== n = 20 ===\n')

for i = 1:M
    % sample1 with rho = 0
    sample1 = mvnrnd(mu, sigma1, n);
    [H1, confidence_interval1] = fisher_test(sample1(:, 1), sample1(:, 2), alpha);
    if rho1>confidence_interval1(1) && rho1<confidence_interval1(2)
        percentage1 = percentage1+1;
    end
    if H1
        rejection_percentage1 = rejection_percentage1 + 1;
    end
    lower_limit1(i) = confidence_interval1(1);
    upper_limit1(i) = confidence_interval1(2);

    %sample2 with rho = 0.5
    sample2 = mvnrnd(mu, sigma2, n);
    [H2, confidence_interval2]  = fisher_test(sample2(:, 1), sample2(:, 2), alpha);
    if rho2>confidence_interval2(1) && rho2<confidence_interval2(2)
        percentage2 = percentage2+1;
    end
    if H2
        rejection_percentage2 = rejection_percentage2 + 1;
    end
    lower_limit2(i) = confidence_interval2(1);
    upper_limit2(i) = confidence_interval2(2);
end

figure;
subplot(2,1,1)
histogram(lower_limit1)
grid on
hold on
histogram(lower_limit2)
title('Lower Limit [n=20]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

subplot(2,1,2)
histogram(upper_limit1)
grid on
hold on
histogram(upper_limit2)
title('Upper Limit [n = 20]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

fprintf('The confidence interval includes real rho with percentage:\n')
fprintf('-For rho = 0: %f %%\n', percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', percentage2/10)

fprintf('The null Hypothesis(rho = 0) is rejected with percentage:\n')
fprintf('-For rho = 0: %f %%\n', rejection_percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', rejection_percentage2/10)

    
%% (c)
n = 200;

fprintf('\n=== n = 200 ===\n')

percentage1 = 0;
percentage2 = 0;
rejection_percentage1 = 0;
rejection_percentage2 = 0;
for i = 1:M
    % sample1 with rho = 0
    sample1 = mvnrnd(mu, sigma1, n);
    [H1, confidence_interval1] = fisher_test(sample1(:, 1), sample1(:, 2), alpha);
    if rho1>confidence_interval1(1) && rho1<confidence_interval1(2)
        percentage1 = percentage1+1;
    end
    if H1
        rejection_percentage1 = rejection_percentage1 + 1;
    end
    lower_limit1(i) = confidence_interval1(1);
    upper_limit1(i) = confidence_interval1(2);

    %sample2 with rho = 0.5
    sample2 = mvnrnd(mu, sigma2, n);
    [H2, confidence_interval2]  = fisher_test(sample2(:, 1), sample2(:, 2), alpha);
    if rho2>confidence_interval2(1) && rho2<confidence_interval2(2)
        percentage2 = percentage2+1;
    end
    if H2
        rejection_percentage2 = rejection_percentage2 + 1;
    end
    lower_limit2(i) = confidence_interval2(1);
    upper_limit2(i) = confidence_interval2(2);
end
figure;
subplot(2,1,1)
histogram(lower_limit1)
grid on
hold on
histogram(lower_limit2)
title('Lower Limit [n=200]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

subplot(2,1,2)
histogram(upper_limit1)
grid on
hold on
histogram(upper_limit2)
title('Upper Limit [n = 200]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

fprintf('The confidence interval includes real rho with percentage:\n')
fprintf('-For rho = 0: %f %%\n', percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', percentage2/10)

fprintf('The null Hypothesis(rho = 0) is rejected with percentage:\n')
fprintf('-For rho = 0: %f %%\n', rejection_percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', rejection_percentage2/10)

%% (d)
fprintf('\n====== X^2, Y^2 ======\n\n')

percentage1 = 0;
percentage2 = 0;
rejection_percentage1 = 0;
rejection_percentage2 = 0;
n = 20;

fprintf('=== n = 20 ===\n')

for i = 1:M
    % sample1 with rho = 0
    sample1 = mvnrnd(mu, sigma1, n);
    sample1 = sample1.^2;
    [H1, confidence_interval1] = fisher_test(sample1(:, 1), sample1(:, 2), alpha);
    if rho1>confidence_interval1(1) && rho1<confidence_interval1(2)
        percentage1 = percentage1+1;
    end
    if H1
        rejection_percentage1 = rejection_percentage1 + 1;
    end
    lower_limit1(i) = confidence_interval1(1);
    upper_limit1(i) = confidence_interval1(2);

    %sample2 with rho = 0.5
    sample2 = mvnrnd(mu, sigma2, n);
    sample2 = sample2.^2;
    [H2, confidence_interval2]  = fisher_test(sample2(:, 1), sample2(:, 2), alpha);
    if rho2>confidence_interval2(1) && rho2<confidence_interval2(2)
        percentage2 = percentage2+1;
    end
    if H2
        rejection_percentage2 = rejection_percentage2 + 1;
    end
    lower_limit2(i) = confidence_interval2(1);
    upper_limit2(i) = confidence_interval2(2);
end

figure;
subplot(2,1,1)
histogram(lower_limit1)
grid on
hold on
histogram(lower_limit2)
title('Lower Limit [n=20][samples^2]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

subplot(2,1,2)
histogram(upper_limit1)
grid on
hold on
histogram(upper_limit2)
title('Upper Limit [n = 20][samples^2]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

fprintf('The confidence interval includes real rho with percentage:\n')
fprintf('-For rho = 0: %f %%\n', percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', percentage2/10)

fprintf('The null Hypothesis(rho = 0) is rejected with percentage:\n')
fprintf('-For rho = 0: %f %%\n', rejection_percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', rejection_percentage2/10)

n = 200;

fprintf('\n=== n = 200 ===\n')

percentage1 = 0;
percentage2 = 0;
rejection_percentage1 = 0;
rejection_percentage2 = 0;
for i = 1:M
    % sample1 with rho = 0
    sample1 = mvnrnd(mu, sigma1, n);
    [H1, confidence_interval1] = fisher_test(sample1(:, 1), sample1(:, 2), alpha);
    if rho1>confidence_interval1(1) && rho1<confidence_interval1(2)
        percentage1 = percentage1+1;
    end
    if H1
        rejection_percentage1 = rejection_percentage1 + 1;
    end
    lower_limit1(i) = confidence_interval1(1);
    upper_limit1(i) = confidence_interval1(2);

    %sample2 with rho = 0.5
    sample2 = mvnrnd(mu, sigma2, n);
    [H2, confidence_interval2]  = fisher_test(sample2(:, 1), sample2(:, 2), alpha);
    if rho2>confidence_interval2(1) && rho2<confidence_interval2(2)
        percentage2 = percentage2+1;
    end
    if H2
        rejection_percentage2 = rejection_percentage2 + 1;
    end
    lower_limit2(i) = confidence_interval2(1);
    upper_limit2(i) = confidence_interval2(2);
end

figure;
subplot(2,1,1)
histogram(lower_limit1)
grid on
hold on
histogram(lower_limit2)
title('Lower Limit [n=200][samples^2]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

subplot(2,1,2)
histogram(upper_limit1)
grid on
hold on
histogram(upper_limit2)
title('Upper Limit [n = 200][samples^2]')
legend('\rho = 0', '\rho = 0.5')
xlim([-1,1])

fprintf('The confidence interval includes real rho with percentage:\n')
fprintf('-For rho = 0: %f %%\n', percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', percentage2/10)

fprintf('The null Hypothesis(rho = 0) is rejected with percentage:\n')
fprintf('-For rho = 0: %f %%\n', rejection_percentage1/10)
fprintf('-For rho = 0.5: %f %%\n', rejection_percentage2/10)
