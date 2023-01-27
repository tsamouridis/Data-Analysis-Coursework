function mean_y = function_3_1(M, n, lambda)

    poisson_random_values = poissrnd(lambda, [n, M]);
    y = mean(poisson_random_values);    % random variable y contains the mean of the M samples

    figure
    histogram(y)
    mean_y = mean(y);
    xline(mean_y, 'Color', 'r', 'LineWidth', 2)
    xline(lambda, 'Color', 'b', 'LineWidth', 2)
    
    title_string = sprintf('[m, n, lambda] = [%.0f, %.0f, %.2f]', M, n, lambda);
    title(title_string)
    legend('Histogram of y', 'mean(y)', 'lambda')
    grid on
end