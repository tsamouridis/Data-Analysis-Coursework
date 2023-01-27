clear variables; close all

%% question a

fprintf('(a)\n\n')
n = 10000;
lambda = rand();    % lambda is unknown. Here lambda belongs in (0, 1)
mu = 1/lambda; % mean of exponential distribution is 1/lambda

x_array = exprnd(mu, [1, n]); % random values of exponential distribution with parameter lambda

% finding lambda that gives max(logL)
% l stands for lambda
max_logL = -inf;    
estimator_of_l = 0;
% searching max till c*lambda, c integer. c = 10 is chosen here
for l = 0:0.01:10*lambda
    logL = sum(log( exppdf(x_array, 1/l )));   % L = log(Π f(xi;θ))
    if logL > max_logL
        max_logL = logL;
        estimator_of_l = l;
    end
end

mean_x = mean(x_array);

fprintf('Mean of observations = %f\n', mean_x);
fprintf('1/(Estimator of lambda) = %f\n', 1/estimator_of_l)

%% question b
fprintf('\n(b)\n\n')
clear variables

m_n_lambda = [10 15 1; 100 100 1; 100 100 10; 1000 1000 25];

for ii = 1:4
    m = m_n_lambda(ii, 1);
    n = m_n_lambda(ii, 2);
    lambda = m_n_lambda(ii, 3);
    
    mean_y = function_3_2(m, n, lambda);

    fprintf('=== Values: [m, n, lambda] = [%f, %f, %f]\n', m, n, lambda)
    fprintf('Mean of y = %f\n', mean_y)
    fprintf('1/lambda = %f\n\n', 1/lambda) 
end
fprintf('The results are accordant to the question a\n')



