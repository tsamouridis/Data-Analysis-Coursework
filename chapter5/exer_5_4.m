clear all; close all; clc;

data = load('lightair.dat');

air_density = data(:,1);
light_speed = data(:,2);
alpha = 0.05;
n = length(air_density);

%% (a)

figure;
scatter(air_density, light_speed)
title('Speed of light in response to air density')
xlabel('Air Density ($ \frac{kg}{m^3} $)','Interpreter','latex')
ylabel('Speed of light ($ \frac{km}{sec} $)','Interpreter','latex')
grid on;

r = corr2(air_density, light_speed);
fprintf('Correlation Coefficient: r = %f\n', r)

%% (b)

[b0, b1, S_e, b0_ci, b1_ci] = linear_regression(air_density, light_speed, alpha);
fprintf('\nThe estimations of Linear Regression are:\n')
fprintf('b0 = %f\n', b0)
fprintf('b1 = %f\n', b1)
fprintf('y = %f + (%f)*x\n', b0, b1)
fprintf('b0 confidence interval: [%f, %f]\n', b0_ci(1), b0_ci(2))
fprintf('b1 confidence interval: [%f, %f]\n', b1_ci(1), b1_ci(2))

%% (c)

% regression plot
figure;
scatter(air_density, light_speed)

hold on
x_values = min(air_density): 0.1 :max(air_density); % values for the x axis
y = b0+b1*x_values;
plot(x_values, y);
title('Speed of light in response to air density')
xlabel('Air Density($ \frac{kg}{m^3} $)','Interpreter','latex')
ylabel('Speed of light($ \frac{km}{sec} $)','Interpreter','latex')
grid on;

% prediction for the mean of y
t = tinv(1-alpha/2, n-2);
X_mean = mean(air_density);
S_xx = var(air_density)*(n-1);
k = length(x_values);
y_mean_low = nan(1,k);  % for the lower limit
y_mean_up = nan(1,k);   % for the upper limit
for i = 1:k
    y_mean_low(i) = (b0+b1*x_values(i)) - t * S_e* sqrt(1/n + (x_values(i)-X_mean)^2/S_xx);
    y_mean_up(i) = (b0+b1*x_values(i)) + t * S_e* sqrt(1/n + (x_values(i)-X_mean)^2/S_xx);
end
plot(x_values, y_mean_up, 'color', 'green')
plot(x_values, y_mean_low, 'color', 'green')
    

% prediction for a future values of y
y_future_low = nan(1,k);    % for the lower limit
y_future_up = nan(1,k);     % for the upper limit
for i = 1:k
    y_future_low(i) = (b0+b1*x_values(i)) - t * S_e* sqrt(1 + 1/n + (x_values(i)-X_mean)^2/S_xx);
    y_future_up(i) = (b0+b1*x_values(i)) + t * S_e* sqrt(1 + 1/n + (x_values(i)-X_mean)^2/S_xx);
end
plot(x_values, y_future_up, 'color', 'blue')
plot(x_values, y_future_low, 'color', 'blue')
legend('data', 'regression', 'mean y prediction', '', 'future y prediction', '')

% predictions for air density = 1.29
x = 1.29;
fprintf('\nFor Air density %.2f:\n', x)
if x<max(air_density) && x>min(air_density)
    y_prediction = b0+b1*x;

    y_mean_prediction1 = (b0+b1*x_values(i)) - t * S_e* sqrt(1/n + (x_values(i)-X_mean)^2/S_xx);
    y_mean_prediction2 = (b0+b1*x_values(i)) + t * S_e* sqrt(1/n + (x_values(i)-X_mean)^2/S_xx);
    
    y_future_prediction1 = (b0+b1*x_values(i)) - t * S_e* sqrt(1+1/n + (x_values(i)-X_mean)^2/S_xx);
    y_future_prediction2 = (b0+b1*x_values(i)) + t * S_e* sqrt(1+1/n + (x_values(i)-X_mean)^2/S_xx);

    fprintf('Speed of light prediction: %f\n', y_prediction)
    fprintf('Mean prediction: [%f, %f]\n', y_mean_prediction1, y_mean_prediction2)
    fprintf('Future value prediction: [%f, %f]\n', y_future_prediction1, y_future_prediction2)
else
    fprintf('No predictions are possible for %f\n', x)
end

%% (d)
% real values of coefficients
b0_real = 299792.458;
b1_real = -299792.458*0.00029/1.29;

fprintf('\nReal equation: y = %f + (%f)*x\n', b0_real, b1_real)

if b1_ci(1) < b1_real && b1_real< b1_ci(2)
    fprintf('Real b1 is within b1 confidence interval from the samples.\n')
else
    fprintf('Real b1 is NOT within b1 confidence interval from the samples.\n')
end

if b0_ci(1) < b0_real && b0_real< b0_ci(2)
    fprintf('Real b0 is within b0 confidence interval from the samples.\n')
else
    fprintf('Real b0 is NOT within b0 confidence interval from the samples.\n')
end

% find if the real values are within the prediction of mean values
y_values_real = b0_real+b1_real*air_density;

count = 0;
for i = 1:length(y_values_real)
    mean_prediction_low = (b0+b1*air_density(i)) - t * S_e* sqrt(1/n + (air_density(i)-X_mean)^2/S_xx);
    mean_prediction_up = (b0+b1*air_density(i)) + t * S_e* sqrt(1/n + (air_density(i)-X_mean)^2/S_xx);
    
    if y_values_real(i) >=  mean_prediction_low && y_values_real(i) <= mean_prediction_up
        count = count + 1;
    end
end
percentage = count/length(y_values_real)*100;
fprintf('%f %% of real values are within the mean prediction interval\n', percentage)




