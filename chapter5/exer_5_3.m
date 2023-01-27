clear all; close all; clc;

temperature = load('tempThes59_97.dat');
rain = load('rainThes59_97.dat');

[years, months] = size(rain);

alpha = 0.05;
L = 1000;
H_parametric = nan(1, months);
H_permutation = nan(1, months);

figure;
sgtitle('Temperature in respect to Rain')

for i = 1:months
    sample_temperature = temperature(:, i);
    sample_rain = rain(:, i);
    
    subplot(4, 3, i)
    plot(sample_rain, sample_temperature, 'o')
    temp_title = sprintf('Month: %d', i);
    title(temp_title)
    xlabel('Rain')
    ylabel('Temperature')
    grid on
    
    H_parametric(i) = fisher_test(sample_rain, sample_temperature, alpha);
    H_permutation(i) = permutation_correlation_test(sample_rain, sample_temperature, L, alpha);
end

fprintf('Correlation test for every month. H = 0 indicates correlation with 0.05 confidence.\n')
fprintf('Month - H(parametric) - H(permutation)\n')
for i = 1:months
    fprintf('%d \t\t', i)
    fprintf('%d \t\t', H_parametric(i))
    fprintf('%d \t\t\n', H_permutation(i))
end





