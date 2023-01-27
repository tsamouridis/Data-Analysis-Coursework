close all; clear all; clc;

resistance = [0.76 0.86 0.97 1.11 1.45 1.67 1.92 2.23 2.59 3.02 3.54 ...
    4.16 4.91 5.83 6.94 8.31 10.00 12.09 14.68 17.96 22.05 27.28 33.89...
    42.45 53.39 67.74 86.39 111.30 144.00 188.40 247.50 329.20];

temperature_celcius = [110 105 100 95 85 80 75 70 65 60 55 50 45 40 35 30 ...
    25 20 15 10 5 0 -5 -10 -15 -20 -25 -30 -35 -40 -45 -50];
temperature = temperature_celcius + 273.15; % in Kelvin

figure(1);
scatter(temperature, resistance);
title('Resistance in respect to temperature')
xlabel('Temperature (K)')
ylabel('Resistance ($ \Omega $)', 'interpreter', 'latex')
grid on

%% (a)
Y = 1./temperature;
X = log(resistance);
figure(2);
scatter(X, Y);
title('Tranformed Samples')
xlabel('X = $\frac{1}{T}$', 'interpreter', 'latex')
ylabel('Y = ln(R)')
grid on

% 1-st order
coefficients = polyfit(X, Y, 1);
b1 = coefficients(1);
b0 = coefficients(2);
y_values = b0+b1.*X;
hold on;
plot(X, y_values)

n = length(X);
r = corr2(X,Y);
S_x = std(X);
S_y = std(Y);
S_xy = r*S_x*S_y;
S_e = sqrt((n-1)/(n-2) * (S_y^2 - b1^2*S_x^2));

figure(3)
y_values = b0+b1.*X;
e_i = Y - y_values;
e_i_star = e_i/S_e;
plot(y_values, e_i_star, 'o')
title('Diagnostic plot - 1st order')
xlabel('y')
ylabel('e_i*')
grid on;
yline(-1.96)
yline(1.96)
yticks([-1.96, 1.96])

fprintf('1st order: y = %.8f + (%.8f)x\n', b0, b1)

% 2-nd order
coefficients = polyfit(X, Y, 2);
b2 = coefficients(1);
b1 = coefficients(2);
b0 = coefficients(3);
y_values = b0+b1.*X+b2.*X.^2;
figure(2)
hold on;
plot(X, y_values)

k = 2;
S_e = sqrt(1/(n-(k+1)) * sum((Y-y_values).^2));

figure(4)
e_i = Y - y_values;
e_i_star = e_i/S_e;
plot(y_values, e_i_star, 'o')
title('Diagnostic plot-2nd order')
xlabel('y')
ylabel('e_i*')
grid on;
yline(-1.96)
yline(1.96)
yticks([-1.96, 1.96])

fprintf('2nd order: y = %.8f + (%.8f)x + (%.8f)x^2\n', b0, b1, b2)

% 3rd order
coefficients = polyfit(X, Y, 3);
b3 = coefficients(1);
b2 = coefficients(2);
b1 = coefficients(3);
b0 = coefficients(4);
y_values = b0+b1.*X+b2.*X.^2+b3.*X.^3;
figure(2)
hold on;
plot(X, y_values)

k = 3;
S_e = sqrt(1/(n-(k+1)) * sum((Y-y_values).^2));

figure(5)
e_i = Y - y_values;
e_i_star = e_i/S_e;

plot(y_values, e_i_star, 'o')
title('Diagnostic plot-3rd order')
xlabel('y')
ylabel('e_i*')
grid on;
yline(-1.96)
yline(1.96)
yticks([-1.96, 1.96])

fprintf('3rd order: y = %.8f + (%.8f)x + (%.8f)x^2 + (%.8f)x^3\n', b0, b1, b2, b3)

% 4th order
coefficients = polyfit(X, Y, 4);
b4 = coefficients(1);
b3 = coefficients(2);
b2 = coefficients(3);
b1 = coefficients(4);
b0 = coefficients(5);
y_values = b0+b1.*X+b2.*X.^2+b3.*X.^3+b4.*X.^4;
figure(2)
hold on;
plot(X, y_values)
legend('', '1st order', '2nd order', '3rd order', '4th order')

k = 4;
S_e = sqrt(1/(n-(k+1)) * sum((Y-y_values).^2));

figure(6)
e_i = Y - y_values;
e_i_star = e_i/S_e;

plot(y_values, e_i_star, 'o')
title('Diagnostic plot-4th order')
xlabel('y')
ylabel('e_i*')
grid on;
yline(-1.96)
yline(1.96)
yticks([-1.96, 1.96])

fprintf('4th order: y = %.8f + (%.8f)x + (%.8f)x^2 + (%.8f)x^3 + (%.8f)x^4\n', b0, b1, b2, b3, b4)

%% (b)

% Steinhart-Hart
X = X';
Y = Y';
x = [ones(length(X),1) X X.^3];
b = regress(Y,x);
y_values = x*b;

k = 3;
S_e = sqrt(1/(n-(k+1)) * sum((Y-y_values).^2));

figure(7)
e_i = Y - y_values;
e_i_star = e_i/S_e;

plot(y_values, e_i_star, 'o')
title('Diagnostic plot - Steinhart-Hart')
xlabel('y')
ylabel('e_i*')
grid on;
yline(-1.96)
yline(1.96)
yticks([-1.96, 1.96])


fprintf('Steinhart-Hart: y = %.8f + (%.8f)x + (%.8f)x^3 \n', b(1), b(2), b(3))





