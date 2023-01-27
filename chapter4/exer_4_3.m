clear variables; close all; 

% V: voltage
% I: current
% f: phase difference between V and I

M = 1000;

V_mean = 77.78;
V_std = 0.71;

I_mean = 1.21;
I_std = 0.071;

f_mean = 0.283;
f_std = 0.017;

%% (a) and (b)
fprintf('-> Questions A and B\n')
correlation_V_f = 0;
P_std_formula = calculate_power_uncertainty(V_mean, I_mean, f_mean, V_std, I_std, f_std, correlation_V_f);

voltages = normrnd(V_mean, V_std, [1 M]);
currents = normrnd(I_mean, I_std, [1 M]);
frequencies = normrnd(f_mean, f_std, [1 M]);

powers = voltages.*currents.*cos(frequencies);
power_std = std(powers);

fprintf('For uncorrelated V and f:\n')
fprintf('* Standard Deviation of power in simulation: %f\n', power_std);
fprintf('* Standard Deviation of power by formula: %f\n', P_std_formula);

H = vartest(powers, P_std_formula^2);
if H == 0
    fprintf('The simulation confirms the formula.\n')
else
    fprintf('The simulation does NOT confirm the formula.\n')
end

%% (c)
fprintf('\n-> Question C \n')

currents = normrnd(I_mean, I_std, [1 M]);

correlation_V_f = 0.5;
covariance_V_f = correlation_V_f*V_std*f_std;
SIGMA = [V_std, covariance_V_f; covariance_V_f, f_std];
mu = [V_mean, f_mean];
voltages_and_frequencies = mvnrnd(mu, SIGMA, M);
voltages = voltages_and_frequencies(:, 1)';
frequencies = voltages_and_frequencies(:, 2)';

powers = voltages.*currents.*cos(frequencies);
power_std = std(powers);

P_std_formula = calculate_power_uncertainty(V_mean, I_mean, f_mean, V_std, I_std, f_std, correlation_V_f);
fprintf('For correlated V and f:\n')
fprintf('* Standard Deviation of power in simulation: %f\n', power_std);
fprintf('* Standard Deviation of power by formula:%f\n', P_std_formula);

H = vartest(powers, P_std_formula^2);
if H == 0
    fprintf('The simulation confirms the formula.\n')
else
    fprintf('The simulation does NOT confirm the formula.\n')
end








