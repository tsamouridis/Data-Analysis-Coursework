close all; clear variables

M = 100;
n = 10;
mu = 0;
variance = 1;
sigma = 1;
B = 1000;

X = normrnd(mu, sigma, n, M);

%% (a)
fprintf('Question A:\n')

mu_hypothesis1 = 0;
mu_hypothesis2 = 0.5;

p_parametric_hypothesis1 = nan(1, M);
p_parametric_hypothesis2 = nan(1, M);

p_bootstrap_hypothesis1 = nan(1, M);
p_bootstrap_hypothesis2 = nan(1, M);
for i = 1:M
    % parametric
    p_parametric_hypothesis1 = ttest(X);
    p_parametric_hypothesis2 = ttest(X, mu_hypothesis2);

    % bootstrap
    X_mean = mean(X(:, i));
    X_tilde = X(:, i) - X_mean + mu_hypothesis1;
    bootstrap_means = bootstrp(B , @mean, X_tilde);
    ci_lower = prctile(bootstrap_means, 2.5);
    ci_upper = prctile(bootstrap_means, 97.5);
    if X_mean > ci_lower && X_mean < ci_upper
        p_bootstrap_hypothesis1(i) = 0;
    else
        p_bootstrap_hypothesis1(i) = 1;
    end

    X_tilde = X(:, i) - X_mean + mu_hypothesis2;
    bootstrap_means = bootstrp(B , @mean, X_tilde);
    bootstrap_means = [bootstrap_means; X_mean];
    ci_lower = prctile(bootstrap_means, 2.5);
    ci_upper = prctile(bootstrap_means, 97.5);
    if X_mean > ci_lower && X_mean < ci_upper
        p_bootstrap_hypothesis2(i) = 0;
    else
        p_bootstrap_hypothesis2(i) = 1;
    end
end

parametric_percentage_hypothesis1 = sum(p_parametric_hypothesis1 == 1);
parametric_percentage_hypothesis2 = sum(p_parametric_hypothesis2 == 1);

bootstrap_percentage_hypothesis1 = sum(p_bootstrap_hypothesis1 == 1);
bootstrap_percentage_hypothesis2 = sum(p_bootstrap_hypothesis2 == 1);

fprintf('Percentage of rejection of Ηypothesis E[X] = 0:\n')
fprintf('  Parametric: %d %%\n', parametric_percentage_hypothesis1)
fprintf('  Bootstrap: %d %%\n', bootstrap_percentage_hypothesis1)

fprintf('Percentage of rejection of Ηypothesis E[X] = 0.5:\n')
fprintf('  Parametric: %d %%\n', parametric_percentage_hypothesis2)
fprintf('  Bootstrap: %d %%\n', bootstrap_percentage_hypothesis2)


%% (b)
fprintf('\n - Question B:\n')

Y = X.^2;

mu_hypothesis1 = 0;
mu_hypothesis2 = 0.5;

p_parametric_hypothesis1 = nan(1, M);
p_parametric_hypothesis2 = nan(1, M);

p_bootstrap_hypothesis1 = nan(1, M);
p_bootstrap_hypothesis2 = nan(1, M);
for i = 1:M
    % parametric
    p_parametric_hypothesis1 = ttest(Y);
    p_parametric_hypothesis2 = ttest(Y, mu_hypothesis2);

    % bootstrap
    Y_mean = mean(Y(:, i));
    Y_tilde = Y(:, i) - Y_mean + mu_hypothesis1;
    bootstrap_means = bootstrp(B , @mean, Y_tilde);
    ci_lower = prctile(bootstrap_means, 2.5);
    ci_upper = prctile(bootstrap_means, 97.5);
    if Y_mean > ci_lower && Y_mean < ci_upper
        p_bootstrap_hypothesis1(i) = 0;
    else
        p_bootstrap_hypothesis1(i) = 1;
    end

    Y_tilde = Y(:, i) - Y_mean + mu_hypothesis2;
    bootstrap_means = bootstrp(B , @mean, Y_tilde);
    bootstrap_means = [bootstrap_means; Y_mean];
    ci_lower = prctile(bootstrap_means, 2.5);
    ci_upper = prctile(bootstrap_means, 97.5);
    if Y_mean > ci_lower && Y_mean < ci_upper
        p_bootstrap_hypothesis2(i) = 0;
    else
        p_bootstrap_hypothesis2(i) = 1;
    end
end

parametric_percentage_hypothesis1 = sum(p_parametric_hypothesis1 == 1);
parametric_percentage_hypothesis2 = sum(p_parametric_hypothesis2 == 1);

bootstrap_percentage_hypothesis1 = sum(p_bootstrap_hypothesis1 == 1);
bootstrap_percentage_hypothesis2 = sum(p_bootstrap_hypothesis2 == 1);

fprintf('Percentage of rejection of the Ηypothesis: E[X^2] = 0:\n')
fprintf('  Parametric: %d %%\n', parametric_percentage_hypothesis1)
fprintf('  Bootstrap: %d %%\n', bootstrap_percentage_hypothesis1)

fprintf('Percentage of rejection of the Ηypothesis: E[X^2] = 0.5:\n')
fprintf('  Parametric: %d %%\n', parametric_percentage_hypothesis2)
fprintf('  Bootstrap: %d %%\n', bootstrap_percentage_hypothesis2)

