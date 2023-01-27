close all; clear variables;

n = 10;
mu = 0;
variance = 1;
sample_size = [1, n];

sample = normrnd(mu, variance, sample_size);
sample_mean = mean(sample);

%% (a)
B = 1000;
bootstrap_samples = create_bootstrap_samples(sample, B);
boostrap_samples_means = mean(bootstrap_samples);

histogram(boostrap_samples_means);
xline(sample_mean, 'linewidth', 3)
legend('Histogram', 'Mean of sample X')
title('Means of Bootstrap Samples [sample X]')
grid on

%% (b)

bootstrap_standard_error_of_mean = std(boostrap_samples_means);
standard_error_of_mean = std(sample)/sqrt(n);

fprintf('Bootstrap standard error of mean = %f\n', bootstrap_standard_error_of_mean);
fprintf('Standard error of mean of initial sample = %f\n', standard_error_of_mean);

%% (c)

sample2 = exp(1).^sample;
sample2_mean = mean(sample2);

% (c-a)
B = 1000;
bootstrap_samples2 = create_bootstrap_samples(sample2, B);
boostrap_samples_means2 = mean(bootstrap_samples2);

figure;
histogram(boostrap_samples_means2);
xline(sample2_mean, 'linewidth', 3)
legend('Histogram', 'Mean of sample Y')
title('Means of Bootstrap Samples [sample Y = e^X]')
grid on

% (c-b)

bootstrap_standard_error_of_mean2 = std(boostrap_samples_means2);
standard_error_of_mean2 = std(sample2)/sqrt(n);

fprintf('\n== Y = e^X ==\n')
fprintf('Bootstrap standard error of mean = %f\n', bootstrap_standard_error_of_mean);
fprintf('Standard error of mean of transformed sample= %f\n', standard_error_of_mean);