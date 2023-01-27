close all; clear variables;

data = importdata('eruption.dat');
waiting_time_1989 = data(:, 1);
duration_1989 = data(:, 2);
waiting_time_2006 = data(:, 3);

%% waiting time in 1989

fprintf('\n==Waiting time in 1989==\n\n')

fprintf('-> a\n')

hypothetical_std = 10;
hypothetical_variance = hypothetical_std^2;
[H, ~, confidence_interval] = vartest(waiting_time_1989, hypothetical_variance);

fprintf('Variance Confidence Interval is: [%f, %f].\n', confidence_interval(1), confidence_interval(2));
if ~H
    fprintf('Based on the sample, the Hypothesis that variance = 100 cannot be eliminated.\n')
else
    fprintf('Based on the sample, the Hypothesis that variance = 100 can be eliminated.\n')
end

fprintf('-> b\n')

hypothetical_mean = 75;
[H, ~, confidence_interval] = ttest(waiting_time_1989, hypothetical_mean);

fprintf('Mean Confidence Interval is: [%f, %f].\n', confidence_interval(1), confidence_interval(2));
if ~H
    fprintf('Based on the sample, the Hypothesis that mean = 75 cannot be eliminated.\n')
else
    fprintf('Based on the sample, the Hypothesis that variance = 75 can be eliminated.\n')
end

fprintf('-> c\n')

[H, p] = chi2gof(waiting_time_1989);

if ~H
    fprintf('The Hypothesis that the sample follows Normal Distribution cannot be eliminated.\n')
else
    fprintf('The Hypothesis that the sample follows Normal Distribution can be eliminated.\n')
end

fprintf('\tp-value = %f.\n', p)

%% waiting time in 2006

fprintf('\n==Waiting time in 2006==\n\n')

fprintf('-> a\n')

hypothetical_variance = 10;
[H, ~, confidence_interval] = vartest(waiting_time_2006, hypothetical_variance);

fprintf('Variance Confidence Interval is: [%f, %f].\n', confidence_interval(1), confidence_interval(2));
if ~H
    fprintf('Based on the sample, the Hypothesis that variance = 10 cannot be eliminated.\n')
else
    fprintf('Based on the sample, the Hypothesis that variance = 10 can be eliminated.\n')
end

fprintf('-> b\n')

hypothetical_mean = 75;
[H, ~, confidence_interval] = ttest(waiting_time_2006, hypothetical_mean);

fprintf('Mean Confidence Interval is: [%f, %f].\n', confidence_interval(1), confidence_interval(2));
if ~H
    fprintf('Based on the sample, the Hypothesis that mean = 75 cannot be eliminated.\n')
else
    fprintf('Based on the sample, the Hypothesis that variance = 75 can be eliminated.\n')
end

fprintf('-> c\n')

[H, p] = chi2gof(waiting_time_2006);

if ~H
    fprintf('The Hypothesis that the sample follows Normal Distribution cannot be eliminated.\n')
else
    fprintf('The Hypothesis that the sample follows Normal Distribution can be eliminated.\n')
end

fprintf('\tp-value = %f.\n', p)


%% duration in 1989

fprintf('\n==Duration in 1989==\n\n')

fprintf('-> a\n')

hypothetical_variance = 1;
[H, ~, confidence_interval] = vartest(duration_1989, hypothetical_variance);

fprintf('Variance Confidence Interval is: [%f, %f].\n', confidence_interval(1), confidence_interval(2));
if ~H
    fprintf('Based on the sample, the Hypothesis that variance = 1 cannot be eliminated.\n')
else
    fprintf('Based on the sample, the Hypothesis that variance = 1 can be eliminated.\n')
end

fprintf('-> b\n')

hypothetical_mean = 2.5;
[H, ~, confidence_interval] = ttest(duration_1989, hypothetical_mean);

fprintf('Mean Confidence Interval is: [%f, %f].\n', confidence_interval(1), confidence_interval(2));
if ~H
    fprintf('Based on the sample, the Hypothesis that mean = 2.5 cannot be eliminated.\n')
else
    fprintf('Based on the sample, the Hypothesis that variance = 2.5 can be eliminated.\n')
end

fprintf('-> c\n')

[H, p] = chi2gof(duration_1989);

if ~H
    fprintf('The Hypothesis that the sample follows Normal Distribution cannot be eliminated.\n')
else
    fprintf('The Hypothesis that the sample follows Normal Distribution can be eliminated.\n')
end

fprintf('\tp-value = %f.\n', p)


