% Performs a parametric test for the means of the samples X and Y
% considering that they do not follow the same distribution.
% Parameters:
%   X, Y: vector shaped samples
%   alpha: the significance
% Returns:
%   H = 0: indicates that the null hypothesis ("means are the same") cannot 
%          be rejected at the 5% significance level
%   H = 1: null hypothesis can be rejected
function H = ttest3(X, Y, alpha)
    n = length(X);
    m = length(Y);

    X_mean = mean(X);
    Y_mean = mean(Y);

    X_var = var(X);
    Y_var = var(Y);
    
    t_tilde = (X_mean - Y_mean)/sqrt(X_var/n + Y_var/m);
    
    degrees_of_freedom = ((X_var + Y_var)^2) / ((X_var/n)/(n-1) + (Y_var/m)/(m-1));
    t = tinv((1-alpha/2), degrees_of_freedom);
    lower_limit = -t;
    upper_limit = t;

    if t_tilde<lower_limit || t_tilde > upper_limit
        H = 1;
    else
        H = 0;
    end
end

