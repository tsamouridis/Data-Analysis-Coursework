clear all; close all; clc;

distance = [2 3 8 16 32 48 64 80];
performance = [98.2 91.7 81.3 64.0 36.4 32.6 17.1 11.3]; 
alpha = 0.05;

%% (a)
scatter(distance, performance)
title('Performance of tyres based on the covered distance')
xlabel('Distance (x 1000 km)')
ylabel('Usage capability percentage')
grid on;

[b0, b1, S_e, b0_ci, b1_ci] = linear_regression(distance, performance, alpha);

% plot the linear regression model
x_min = min(distance);
x_max = max(distance);
x_values = [x_min,x_max];
y = b0+b1*x_values;
hold on;
plot(x_values, y);

% create diagnostic plot
y_values = b0+b1.*distance;
e_i = performance - y_values;
e_i_star = e_i/S_e;

figure;
plot(y_values, e_i_star, 'o')
title('Diagnostic plot')
xlabel('y (performance)')
ylabel('e_i*')
grid on;
yline(-1.96)
yline(1.96)
ylim([-2.5, 2.5])
yticks([-1.96, 1.96])

% Mean seems to be changing, so the linear model is not adequate

%% (b)

x = 25; % given distance
x_min = min(distance);
x_max = max(distance);

if x<x_max && x>x_min
    predicted_performance =  b0+b1*x;
    fprintf('Predicted Performance for %dx1000 km: %f\n', x, predicted_performance)
else
    fprintf('No prediction is possible\n')
end



