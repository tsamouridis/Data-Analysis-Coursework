close all; clear variables;

M = 100;
n = 10;
mu = 0;
sigma = 1;
sample_size = [n, M];

sample = normrnd(mu, sigma, sample_size);
sample_mean = mean(sample);

num_of_bootstrap_samples = 100;
%% (a)

[~, ~, parametric_confidence_intervals] = ttest(sample);
bootstrap_confidence_intervals = bootci(num_of_bootstrap_samples, @mean, sample);

[x1, x2] = define_xlim(bootstrap_confidence_intervals, parametric_confidence_intervals);

subplot(2,2,1)
histogram(bootstrap_confidence_intervals(1, :))
title('Lower bound - Bootstrap CI [X]')
xlim([x1, x2]);
grid on;

subplot(2,2,2)
histogram(bootstrap_confidence_intervals(2, :))
title('Upper bound - Bootstrap CI [X]')
xlim([x1, x2]);
grid on;

subplot(2,2,3)
histogram(parametric_confidence_intervals(1, :))
title('Lower bound - Parametric CI [X]')
xlim([x1, x2]);
grid on;

subplot(2,2,4)
histogram(parametric_confidence_intervals(2, :))
title('Upper bound - Parametric CI [X]')
xlim([x1, x2]);
grid on;
%% (b)

sample2 = sample.^2;
sample2_mean = mean(sample2);

[~, ~, parametric_confidence_intervals2] = ttest(sample2);
bootstrap_confidence_intervals2 = bootci(num_of_bootstrap_samples, @mean, sample2);

[x1, x2] = define_xlim(bootstrap_confidence_intervals2, parametric_confidence_intervals2);

figure
subplot(2,2,1)
histogram(bootstrap_confidence_intervals2(1, :))
title('Lower bound - Bootstrap CI [Y = X^2]')
xlim([x1, x2]);
grid on;

subplot(2,2,2)
histogram(bootstrap_confidence_intervals2(2, :))
title('Upper bound - Bootstrap CI [Y = X^2]')
xlim([x1, x2]);
grid on;

subplot(2,2,3)
histogram(parametric_confidence_intervals2(1, :))
title('Lower bound - Parametric CI [Y = X^2]')
xlim([x1, x2]);
grid on;

subplot(2,2,4)
histogram(parametric_confidence_intervals2(2, :))
title('Upper bound - Parametric CI [Y = X^2]')
xlim([x1, x2]);
grid on;