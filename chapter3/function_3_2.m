function mean_y = function_3_2(M, n, lambda)
    mu = 1/lambda;
    exp_random_values = exprnd(mu, [n, M]);
    y = mean(exp_random_values);    % random variable y contains the mean values of the m samples

    figure
    histogram(y)
    mean_y = mean(y);
    xline(mean_y, 'Color', 'r', 'LineWidth', 2)
    xline(1/lambda, 'Color', 'b', 'LineWidth', 2)
    title_string = sprintf('[m, n, lambda] = [%.0f, %.0f, %.2f]', M, n, lambda);
    title(title_string)
    legend('Histogram of y', 'mean(y)', '1/lambda')
    grid on
end