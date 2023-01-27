function [b0_ci, b1_ci] = bootstrap_linear_regression(X,Y, M, alpha)
% Returns confidence intervals for the coefficients of linear regression using 
% Bootstrap method.
% Parameters:
%   X, Y: vectors with the same number of data
%   M: number of bootstrap samples created in the algorithm
%   alpha: confidence level for the confidence intervals of coefficients
% Returns:
%   b0_ci, b1_ci: confidence intervals for the coefficients
    b0 = nan(1, M);
    b1 = nan(1,M);
    n = length(X);
    new_sample = nan(n, 2);
    % shuffle the X-Y data pairs with replacement
    for j = 1:M
        indices = randi([1,n], [1, n]);
        for i = 1:length(indices)
            new_sample(i, 1) = X(indices(i));
            new_sample(i, 2) = Y(indices(i));
        end
        model = fitlm(new_sample(:, 1), new_sample(:, 2));
        beta = model.Coefficients.Estimate;
        b0(j) = beta(1);
        b1(j) = beta(2);
    end
    b0 = sort(b0);
    b1 = sort(b1);
    
    index_low = M*alpha/2;
    index_high = M*(1-alpha/1);

    b0_low = b0(index_low);
    b0_high = b0(index_high);
    b0_ci = [b0_low, b0_high];

    b1_low = b1(index_low);
    b1_high = b1(index_high);
    b1_ci = [b1_low, b1_high];
end

