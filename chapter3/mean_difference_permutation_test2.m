% Performs a permutation test for the difference of means for samples X and Y.
% X, Y samples are considered to *not follow the same distribution*.
% Parameters:
%   X, Y: vector column-shaped samples
%   B: number of bootstrap samples used
%   alpha: the significance level
% Returns:
%   H = 0: indicates that the null hypothesis ("means are the same") cannot 
%          be rejected at the 5% significance level
%   H = 1: null hypothesis can be rejected
function H = mean_difference_permutation_test2(X, Y, B, alpha)
    n = length(X);
    Z = [X; Y];
    X_mean = mean(X);
    Y_mean = mean(Y);
    Z_mean = mean(Z);
   
    X_tilde = X - X_mean + Z_mean;
    Y_tilde = Y - Y_mean + Z_mean;

    W = [X_tilde; Y_tilde];
    W_star = create_permutation_samples(W, B);
  
    X_star = W_star(1:n, :);
    Y_star = W_star(n+1:end, :);

    X_star_means = mean(X_star);
    Y_star_means = mean(Y_star);
    statistical_to_check = mean(X) - mean(Y);
    
    permutation_means = X_star_means - Y_star_means;

    rank = find_rank(permutation_means, statistical_to_check);

    if rank < (B+1)*alpha/2 || rank > (B+1)*(1-alpha/2)
        H = 1;
    else
        H = 0;
    end
end