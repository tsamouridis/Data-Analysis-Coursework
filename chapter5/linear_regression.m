function [b0, b1, S_e, b0_ci, b1_ci] = linear_regression(X, Y, alpha)
% Returns a linear fitting model for data in X and Y vectors.
% Parameters:
%   X, Y: vectors with the same number of data
%   alpha: confidence level for the confidence intervals of coefficients
% Returns:
%   b0, b1: linear regression coefficients
%   S_e: error standard deviation
%   b0_ci, b1_ci: confidence intervals for the coefficients
    n = length(X);

    r = corr2(X,Y);
    S_x = std(X);
    S_y = std(Y);
    S_xy = r*S_x*S_y;
    X_mean = mean(X);
    Y_mean = mean(Y);
    
    b1 = S_xy/(S_x)^2;
    b0 = Y_mean - b1*X_mean;
    S_e = sqrt((n-1)/(n-2) * (S_y^2 - b1^2*S_x^2));

    % confidence intervals
    S_xx = S_x^2*(n-1);

    t = tinv(1-alpha/2, n-2);
    S_b1 = S_e/(sqrt(S_xx));
    b1_ci = [b1 - t*S_b1, b1 + t*S_b1];

    S_b0 = S_e * sqrt(1/n + X_mean^2/S_xx);
    b0_ci = [b0 - t*S_b0, b0 + t*S_b0];
end



