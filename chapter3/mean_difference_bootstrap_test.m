% performs a bootstrap test for the difference of means for samples X and Y.
% X, Y samples are considered to *follow the same distribution*.
% Parameters:
%   X, Y: vector shaped samples
%   n: length of X
%   B: number of bootstrap samples used
%   alpha: the significance
% Returns:
%   p = 0: indicates that the null hypothesis ("means are the same") cannot 
%          be rejected at the 5% significance level
%   p = 1: null hypothesis can be rejected
function p = mean_difference_bootstrap_test(X, Y, n, B, alpha)
    statistical_to_check = mean(X) - mean(Y);
    
    W = [X; Y];
    W_star = create_bootstrap_samples(W, B);
  
    X_star = W_star(1:n, :);
    Y_star = W_star(n+1:end, :);

    X_star_means = mean(X_star);
    Y_star_means = mean(Y_star);

    bootstrap_means = X_star_means - Y_star_means;

    rank = find_rank(bootstrap_means, statistical_to_check);

    if rank < (B+1)*alpha/2 || rank > (B+1)*(1-alpha/2)
        p = 1;
    else
        p = 0;
    end