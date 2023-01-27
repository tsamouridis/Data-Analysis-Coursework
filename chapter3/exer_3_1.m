clear variables; close all

%% question a

fprintf('(a)\n\n')
n = 10000;
lambda = rand();    % lambda is unknown. Here lambda belongs in (0, 1)

x_array = poissrnd(lambda, [1, n]); % n random values of poisson distribution with parameter lambda

% maximum likelihood estimation
% finding lambda that gives max(logL)
% l stands for lambda
max_logL = -inf;    
estimator_of_l = 0;
% searching max till c*lambda, c integer. c = 10 is chosen here
for l = 0:0.01:10*lambda
    logL = sum(log( poisspdf(x_array, l )));   % L = log(Π f(xi;θ))
    if logL > max_logL
        max_logL = logL;
        estimator_of_l = l;
    end
end

mean_x = mean(x_array);

fprintf('Mean of observations = %f\n', mean_x);
fprintf('Estimator of lambda = %f\n', estimator_of_l)

%% question b

fprintf('\n(b)\n\n')
clear variables;

m_n_lambda = [10 15 1; 100 100 1; 100 100 10; 1000 1000 25];

for ii = 1:4
    m = m_n_lambda(ii, 1);
    n = m_n_lambda(ii, 2);
    lambda = m_n_lambda(ii, 3);
    
    mean_y = function_3_1(m, n, lambda);
    
    fprintf('=== Values: [m, n, lambda] = [%d, %d, %f]\n', m, n, lambda)
    fprintf('Mean of y = %f\n', mean_y)
    fprintf('lambda = %f\n\n', lambda) 
end
fprintf('The results are accordant to the question (a).\n')



