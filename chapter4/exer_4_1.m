close all; clear variables;

e_desired = 0.76;
alpha = 0.05;

%% (a)
fprintf('->Question A\n')
initial_height = 100;
bouncing_height = [60 54 58 60 56];
n = length(bouncing_height);

e = sqrt(bouncing_height./initial_height);
e_mean = mean(e);
e_std = std(e);

% orthotita
precision_uncertainty = abs(e_mean - e_desired);
fprintf('Precision Uncertainty [mu - mean(sample)]: %f\n', precision_uncertainty)

% akriveia epanalipsis
t = tinv(1-alpha/2, n-1);
accuracy_uncertainty_alpha = [e_mean-t*e_std, e_mean+t*e_std];

fprintf('Accuracy Uncertainty [s]: %f\n', e_std)
fprintf('Limit of Accuracy Uncertainty with alpha significance [s +- t*s]: [%f, %f]\n', accuracy_uncertainty_alpha(1), accuracy_uncertainty_alpha(2))

%% (b)
fprintf('\n->Question B\n')
M = 1000;
n = 5;
mu = 58;
s = 2;
h2_sample = normrnd(mu, s, [n, M]);

h2_sample_means = mean(h2_sample);
h2_sample_standard_deviations = std(h2_sample);
e_sample = sqrt(h2_sample ./ initial_height);

figure;
subplot(1,3, 1)
histogram(h2_sample_means)
title('Height h2 Sample Means')
hold on
xline(mu ,'-', {'mu'});
grid on

subplot(1, 3, 2)
histogram(h2_sample_standard_deviations)
title('Sample stds')
hold on
xline(s,'-', {'s'});
grid on

subplot(1,3, 3)
histogram(e_sample)
title('coefficient e from sample')
hold on
xline(e_desired,'-', {'Desired e'});
grid on

percentage = 0;
H = ttest(mean(e_sample), e_desired, 'alpha', alpha);

fprintf('Hypothesis that sample satisfies the desired e:\n')
if ~H
    fprintf('Hypothesis confirmed.\n')
else
    fprintf('Hypothesis rejected.\n')
end

%% (c)
fprintf('\n->Question C\n')
h1 = [80, 100, 90, 120, 95];
h2 = [48, 60, 50, 75, 56];

experiment_e = sqrt(h2 ./ h1); 
experiment_h1_uncertainty = std(h1);
experiment_h2_uncertainty = std(h2);
experiment_e_uncertainty = std(experiment_e);

fprintf('h1 uncertainty: %f\n', experiment_h1_uncertainty)
fprintf('h2 uncertainty: %f\n', experiment_h2_uncertainty)
fprintf('e uncertainty: %f\n', experiment_e_uncertainty)

H = ttest(experiment_e, e_desired);

if ~H
    fprintf('Ball is properly inflated.\n')
else
    fprintf('Ball is NOT properly inflated.\n')
end







