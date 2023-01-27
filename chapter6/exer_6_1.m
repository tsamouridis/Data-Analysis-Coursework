clear all; close all;

n = 1000;
mu = [0 0];
x_var = 1;
y_var = 4;
covar = 0;

x_sigma = sqrt(x_var);
y_sigma = sqrt(y_var);
sigma = [x_sigma covar; covar y_sigma];
data = mvnrnd(mu, sigma, n)';

%inspect data
scatter(data(1,:), data(2,:));
title('Data Scatter plot')
xlabel('x')
ylabel('y')
grid on

% transform data in 3d using W
W = [0.2, 0.8; 0.4, 0.5; 0.7, 0.3];
data_3d = W*data;

% centralize with mean
data_3d_means = mean(data_3d, 2);
[~,columns] = size(data_3d);
data_3d_centered = nan(size(data_3d));
for i = 1:3
    data_3d_centered(i, :) = data_3d(i, :) - data_3d_means(i);
end
data_3d_centered = data_3d_centered';

% calculate covariance matrix
covariance_matrix = cov(data_3d_centered);

% eigen vaues calculations
[eigen_vectors, eigen_values] = eig(covariance_matrix);
eigen_values = diag(eigen_values);

% sort eigenvalues (and then the vectors accordingly) with descend order
[eigen_values, index] = sort(eigen_values,'descend');
eigen_vectors = eigen_vectors(:, index);

% scree plot
figure;
plot(eigen_values,'-o')
title('Scree plot')
ylabel('Eigenvalues')

% scores
scores = data_3d_centered*eigen_vectors;

% 3-d scores
figure
scatter3(scores(:,1),scores(:,2),scores(:,3))
title("PCA Scores [3 dimensions]")
xlabel("PC1")
ylabel("PC2")
zlabel("PC3")

% 2-d scores
figure
scatter(scores(:,1),scores(:,2))
title("PCA Scores [2 dimensions]")
xlabel("PC1")
ylabel("PC2")






