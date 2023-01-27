close all; clear variables;

sample = [41 46 47 47 48 50 50 50 50 50 50 50 48 50 50 50 50 50 50 50 52 52 53 55 50 50 50 50 52 52 53 53 53 53 53 57 52 52 53 53 53 53 53 53 54 54 55 68];

%% (a)

s2 = var(sample);
[~, ~, confidence_interval] = vartest(sample, s2);

fprintf('a)The confidence interval of variance is: [%f, %f]\n', confidence_interval(1,1), confidence_interval(1,2))

%% (b)

previously_measured_variance = 5^2;

H = vartest(sample, previously_measured_variance);

if ~H
    fprintf('b)Based on the sample, the Hypothesis that variance = 5^2 cannot be eliminated.\n')
else
    fprintf('b)Based on the sample, the Hypothesis that variance = 5^2 can be eliminated.\n')
end

%% (c)
hypothetical_mu = 52;
alpha = 0.05;
[H, ~, confidence_interval] = ttest(sample, hypothetical_mu, 'alpha', alpha);

fprintf('c)The confidence interval of mean is: [%.2f, %.2f]\n', confidence_interval(1,1), confidence_interval(1,2))

%% (d)

if ~H
    fprintf('d)Based on the sample, the Hypothesis that mean = 52 cannot be eliminated.\n')
else
    fprintf('d)Based on the sample, the Hypothesis that mean = 52 can be eliminated.\n')
end

%% (e)

[H, p] = chi2gof(sample);

if ~H
    fprintf('e)The Hypothesis that the sample follows Normal Distribution cannot be eliminated.\n')
else
    fprintf('e)The Hypothesis that the sample follows Normal Distribution can be eliminated.\n')
end

fprintf('  p-value = %f.\n', p)