clear variables; close all;

mu = 4;
sigma = 0.1; %var = 0.01
n = 1e6;

%% Finding probability P(x< 3.9)
upper_bound = 3.9;
probability_of_distraction = normcdf(upper_bound, mu, sigma);
fprintf('P(X < %.1f) = %f\n', upper_bound, probability_of_distraction)

%% Finding x that satisfies: P(X < x) = 1%
desired_probability = 0.01;
new_upper_bound = norminv(desired_probability, mu, sigma);
fprintf('P(X < x) = %.2f => x = %f\n', desired_probability, new_upper_bound)

