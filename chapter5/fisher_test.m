% Implementation of the Fisher tranformation for the calculation of
% rejection area and confidence interval for the correlation coefficient. 
% Returns:
%   H: if the null hypothesis is rejected with (alpha*100)% confidence 
%      level, H is 1, otherwise H = 0
%   CI: Confidence interval for the correlation coefficient
% Parameters:
%   X, Y: the two samples
%   alpha: the confidence level
function [H, CI] = fisher_test(X, Y, alpha)
    n = length(X);
    r_matrix = corrcoef(X,Y);
    r = r_matrix(1,2);

    z = 0.5*log((1+r)/(1-r));
    temp = norminv(1-alpha/2, 0, 1);
    z_I = z-temp*sqrt(1/(n-3));
    z_U = z+temp*sqrt(1/(n-3));

    lower_limit = (exp(2*z_I)-1)/(exp(2*z_I)+1);
    upper_limit = (exp(2*z_U)-1)/(exp(2*z_U)+1);
    CI = [lower_limit, upper_limit];

    H = 0;
    t = abs(r*sqrt((n-2)/(1-r^2)));
    p = 2*(1 - tcdf(t, n-2));
    if p <= alpha
        H = 1;
    end
end
