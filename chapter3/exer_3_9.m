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

%% (a)
fprintf('-Question A:\n\n')

mu_difference_parametric_confidence_intervals = nan(2, M);

X_means_bootstrap = nan(1, B); % holds means from B bootsrap samples for X
Y_means_bootstrap = nan(1, B); % holds means from B bootsrap samples for Y
mu_difference__bootstrap_confidence_interval = nan(2, M);

for i = 1:M
    % parametric
    [~, ~, temp_confidence_interval] = ttest2(X(:, i), Y(:, i));
    mu_difference_parametric_confidence_intervals(1, i) = temp_confidence_interval(1);
    mu_difference_parametric_confidence_intervals(2, i) = temp_confidence_interval(2);

    % bootstrap
    X_means_bootstrap = bootstrp(B, @mean, X(:, i));
    Y_means_bootstrap = bootstrp(B, @mean, Y(:, i));
    mu_difference_bootstrap_sample = X_means_bootstrap - Y_means_bootstrap; %
    mu_difference__bootstrap_confidence_interval(1, i) = prctile(mu_difference_bootstrap_sample, 25);
    mu_difference__bootstrap_confidence_interval(2, i) = prctile(mu_difference_bootstrap_sample, 75);
end

figure(1)
subplot(1,2,1)
histogram(mu_difference_parametric_confidence_intervals(1, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(1, :))
xline(0, '-', {'\mu_X - \mu_Y'})
title('A) Lower Bounds')
legend('parametric', 'bootstrap')
grid on

subplot(1,2,2)
histogram(mu_difference_parametric_confidence_intervals(2, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(2, :))
xline(0, '-', {'\mu_X - \mu_Y'})
title('A) Upper Bounds')
legend('parametric', 'bootstrap')
grid on

% percentage calculations
parametric_percentage = 0;
for i = 1:M
    if mu_difference_parametric_confidence_intervals(1, i) < 0 && mu_difference_parametric_confidence_intervals(2, i) > 0
        parametric_percentage = parametric_percentage + 1;
    end
end
fprintf('0 belongs in the parametric confidence intervals with percentage: %.2f %%\n', parametric_percentage);

bootstrap_percentage = 0;
for i = 1:M
    if mu_difference__bootstrap_confidence_interval(1, i) < 0 && mu_difference__bootstrap_confidence_interval(2, i) > 0
        bootstrap_percentage = bootstrap_percentage + 1;
    end
end
fprintf('0 belongs in the bootstrap confidence intervals with percentage: %.2f %%', bootstrap_percentage);

%% (b)
fprintf('\n\n-Question B:\n\n')

X_transformed = X.^2;
Y_tranformed = Y.^2;

mu_difference_parametric_confidence_intervals = nan(2, M);

X_means_bootstrap = nan(1, B);
Y_means_bootstrap = nan(1, B);
mu_difference__bootstrap_confidence_interval = nan(2, M);

for i = 1:M
    % parametric
    [~, ~, temp_confidence_interval] = ttest2(X_transformed(:, i), Y_tranformed(:, i));
    mu_difference_parametric_confidence_intervals(1, i) = temp_confidence_interval(1);
    mu_difference_parametric_confidence_intervals(2, i) = temp_confidence_interval(2);

    % bootstrap
    X_means_bootstrap = bootstrp(B, @mean, X_transformed(:, i));
    Y_means_bootstrap = bootstrp(B, @mean, Y_tranformed(:, i));
    mu_difference_bootstrap_sample = X_means_bootstrap - Y_means_bootstrap;
    mu_difference__bootstrap_confidence_interval(1, i) = prctile(mu_difference_bootstrap_sample, 25);
    mu_difference__bootstrap_confidence_interval(2, i) = prctile(mu_difference_bootstrap_sample, 75);
    
end

figure(2)
subplot(1,2,1)
histogram(mu_difference_parametric_confidence_intervals(1, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(1, :))
xline(0, '-', {'\mu_X - \mu_Y'})
title('B) Lower Bounds')
legend('parametric', 'bootstrap')
grid on

subplot(1,2,2)
histogram(mu_difference_parametric_confidence_intervals(2, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(2, :))
xline(0, '-', {'\mu_X - \mu_Y'})
title('B) Upper Bounds')
legend('parametric', 'bootstrap')
grid on

% percentage calculations
parametric_percentage = 0;
for i = 1:M
    if mu_difference_parametric_confidence_intervals(1, i) < 0 && mu_difference_parametric_confidence_intervals(2, i) > 0
        parametric_percentage = parametric_percentage + 1;
    end
end
fprintf('0 belongs in the parametric confidence intervals with percentage: %.2f %%\n', parametric_percentage);

bootstrap_percentage = 0;
for i = 1:M
    if mu_difference__bootstrap_confidence_interval(1, i) < 0 && mu_difference__bootstrap_confidence_interval(2, i) > 0
        bootstrap_percentage = bootstrap_percentage + 1;
    end
end
fprintf('0 belongs in the bootstrap confidence intervals with percentage: %.2f %%', bootstrap_percentage);

%% c-A

fprintf('\n\n-Question C-A:\n\n')

new_mu_Y = 0.2;
Y = normrnd(new_mu_Y, sigma, m, M);

% (a)

mu_difference_parametric_confidence_intervals = nan(2, M);

X_means_bootstrap = nan(1, B);
Y_means_bootstrap = nan(1, B);
mu_difference__bootstrap_confidence_interval = nan(2, M);

for i = 1:M
    % parametric
    [~, ~, temp_confidence_interval] = ttest2(X(:, i), Y(:, i));
    mu_difference_parametric_confidence_intervals(1, i) = temp_confidence_interval(1);
    mu_difference_parametric_confidence_intervals(2, i) = temp_confidence_interval(2);

    % bootstrap
    X_means_bootstrap = bootstrp(B, @mean, X(:, i));
    Y_means_bootstrap = bootstrp(B, @mean, Y(:, i));
    mu_difference_bootstrap_sample = X_means_bootstrap - Y_means_bootstrap;
    mu_difference__bootstrap_confidence_interval(1, i) = prctile(mu_difference_bootstrap_sample, 25);
    mu_difference__bootstrap_confidence_interval(2, i) = prctile(mu_difference_bootstrap_sample, 75);
    
end

figure(3)
subplot(1,2,1)
histogram(mu_difference_parametric_confidence_intervals(1, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(1, :))
xline(-0.2, '-', {'\mu_X - \mu_Y'})
title('CA) Lower Bounds')
legend('parametric', 'bootstrap')
grid on

subplot(1,2,2)
histogram(mu_difference_parametric_confidence_intervals(2, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(2, :))
xline(-0.2, '-', {'\mu_X - \mu_Y'})
title('CA) Upper Bounds')
legend('parametric', 'bootstrap')
grid on

% percentage calculations
parametric_percentage = 0;
for i = 1:M
    if mu_difference_parametric_confidence_intervals(1, i) < -0.2 && mu_difference_parametric_confidence_intervals(2, i) > -0.2
        parametric_percentage = parametric_percentage + 1;
    end
end
fprintf('-0.2 belongs in the parametric confidence intervals with percentage: %.2f %%\n', parametric_percentage);

bootstrap_percentage = 0;
for i = 1:M

    if mu_difference__bootstrap_confidence_interval(1, i) < -0.2 && mu_difference__bootstrap_confidence_interval(2, i) > -0.2
        bootstrap_percentage = bootstrap_percentage + 1;
    end
end
fprintf('-0.2 belongs in the bootstrap confidence intervals with percentage: %.2f %%', bootstrap_percentage);

% (b)
fprintf('\n\n-Question C-B:\n\n')

X_transformed = X.^2;
Y_tranformed = Y.^2;

mu_difference_parametric_confidence_intervals = nan(2, M);

X_means_bootstrap = nan(1, B);
Y_means_bootstrap = nan(1, B);
mu_difference__bootstrap_confidence_interval = nan(2, M);

for i = 1:M
    % parametric
    [~, ~, temp_confidence_interval] = ttest2(X_transformed(:, i), Y_tranformed(:, i));
    mu_difference_parametric_confidence_intervals(1, i) = temp_confidence_interval(1);
    mu_difference_parametric_confidence_intervals(2, i) = temp_confidence_interval(2);

    % bootstrap
    X_means_bootstrap = bootstrp(B, @mean, X_transformed(:, i));
    Y_means_bootstrap = bootstrp(B, @mean, Y_tranformed(:, i));
    mu_difference_bootstrap_sample = X_means_bootstrap - Y_means_bootstrap;
    mu_difference__bootstrap_confidence_interval(1, i) = prctile(mu_difference_bootstrap_sample, 25);
    mu_difference__bootstrap_confidence_interval(2, i) = prctile(mu_difference_bootstrap_sample, 75);
    
end

figure(4)
subplot(1,2,1)
histogram(mu_difference_parametric_confidence_intervals(1, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(1, :))
xline(-0.04, '-', {'\mu_X - \mu_Y'})
title('B) Lower Bounds')
legend('parametric', 'bootstrap')
grid on

subplot(1,2,2)
histogram(mu_difference_parametric_confidence_intervals(2, :))
hold on
histogram(mu_difference__bootstrap_confidence_interval(2, :))
xline(-0.04, '-', {'\mu_X - \mu_Y'})
title('B) Upper Bounds')
legend('parametric', 'bootstrap')
grid on

% percentage calculations
parametric_percentage = 0;
for i = 1:M
    if mu_difference_parametric_confidence_intervals(1, i) < -0.04 && mu_difference_parametric_confidence_intervals(2, i) > -0.04
        parametric_percentage = parametric_percentage + 1;
    end
end
fprintf('-0.04 belongs in the parametric confidence intervals with percentage: %.2f %%\n', parametric_percentage);

bootstrap_percentage = 0;
for i = 1:M
    if mu_difference__bootstrap_confidence_interval(1, i) < -0.04 && mu_difference__bootstrap_confidence_interval(2, i) > -0.04
        bootstrap_percentage = bootstrap_percentage + 1;
    end
end
fprintf('-0.04 belongs in the bootstrap confidence intervals with percentage: %.2f %%\n', bootstrap_percentage);






