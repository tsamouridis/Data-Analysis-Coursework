% Implementation of the permutation method for the calculation of
% rejection area for the correlation coefficient. 
% Returns:
%   H: if the null hypothesis is rejected with (alpha*100)% confidence H
%      is 1, otherwise H = 0
% Parameters:
%   X, Y: the two samples
%   L: the number of permutation samples
%   alpha: the confidence interval for rho
function H = permutation_correlation_test(X, Y, L, alpha)
    n = length(X);
    X_star = nan(n, L);
    r_L = nan(1, L);
    for i = 1:L
        X_star(:, i) = X(randperm(n));
        
        r_matrix = corrcoef(X_star(:, i),Y);
        r_L(i) =  r_matrix(1,2);
        t_L(i) = r_L(i)*sqrt((n-2)/(1-r_L(i)^2));
    end
    
    r_matrix = corrcoef(X,Y);
    r =  r_matrix(1,2);
    t_0 = r*sqrt((n-2)/(1-r^2));
    
    t_L = sort(t_L);
    lower_limit_index = round(L*alpha/2);
    upper_limit_index = round(L*(1-alpha/2));
    lower_limit = t_L(lower_limit_index);
    upper_limit = t_L(upper_limit_index);
    if t_0 < lower_limit || t_0 > upper_limit
        H = 1;
    else
        H = 0;
    end
end
    
    
    
        
        