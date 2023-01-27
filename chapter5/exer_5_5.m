clear all; close all; clc;

data = load('lightair.dat');
air_density = data(:,1);
light_speed = data(:,2);

alpha = 0.05;
M = 1000;

[b0_ci_bootstrap, b1_ci_bootstrap] = bootstrap_linear_regression(air_density, light_speed, M, alpha);
[~, ~, ~, b0_ci_parametric, b1_ci_parametric] = linear_regression(air_density, light_speed, alpha);
model = fitlm(air_density, light_speed);
parametric_ci = coefCI(model);

% plot intervals for comparison
figure;

subplot(2,1,1)
plot(b0_ci_parametric, [2,2], '-o')
hold on
plot(b0_ci_bootstrap, [1,1], '-o')
ylim([0.5, 2.5])
set(gca,'ytick',[])
legend('parametric', 'bootstrap')
title('b_0 Confidence Intervals')
grid on

subplot(2,1,2)
plot(b1_ci_parametric, [2,2], '-o')
hold on
plot(b1_ci_bootstrap, [1,1], '-o')
ylim([0.5, 2.5])
set(gca,'ytick',[])
legend('parametric', 'bootstrap')
title('b_1 Confidence Intervals')
grid on

fprintf('Botstrap Confidence Interval:\t\t b0_ci = [%f, %f], b1_ci = [%f, %f]\n', b0_ci_bootstrap(1), b0_ci_bootstrap(2), b1_ci_bootstrap(1), b1_ci_bootstrap(2))
fprintf('Parametric Confidence Interval: \t b0_ci = [%f, %f], b1_ci = [%f, %f]\n', b0_ci_parametric(1), b0_ci_parametric(2), b1_ci_parametric(1), b1_ci_parametric(2))
fprintf('\n(MATLAB) Parametric Confidence Interval: b0_ci = [%f, %f], b1_ci = [%f, %f]\n', parametric_ci(1,1), parametric_ci(1,2), parametric_ci(2,1), parametric_ci(2,2))





