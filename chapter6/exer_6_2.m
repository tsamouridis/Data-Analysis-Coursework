clear all; close all;

data = load('yeast.dat');

% centralize with mean
data = normalize(data, 'center');

% calculate covariance matrix
covariance_matrix = cov(data);

% eigen vaues calculations
[eigen_vectors, eigen_values] = eig(covariance_matrix);
eigen_values = diag(eigen_values);

[eigen_values, index] = sort(eigen_values,'descend');
eigen_vectors = eigen_vectors(:, index);

scores = data*eigen_vectors;

% Decision for d
explained_variance = nan(1, length(eigen_values));
total_eigenvalue_sum = sum(eigen_values);
d = 1;
d_selected = nan;
td = 90; % explained variance threshold
for i = 1:length(eigen_values)
    eigenvalues_1_d_sum = 0;
    for j = 1:d
        eigenvalues_1_d_sum = eigenvalues_1_d_sum + eigen_values(j);
    end
    explained_variance(i) = 100*eigenvalues_1_d_sum/total_eigenvalue_sum;
    if explained_variance(i) >= td && isnan(d_selected)
        d_selected = d;
    end
    d = d+1;
end

%plots
subplot(2,1,1)
plot(eigen_values,'-o')
title('Scree plot')
ylabel('Eigenvalues')
xlabel('index')
grid on
subplot(2,1,2)
plot(explained_variance, '-o')
title('Explained Variance plot')
xlabel('index')
ylabel('Explained Variance')

fprintf('The selected dimesion (with td = %f %%) is %d', td, d_selected)

%scores in 3d and 2d
figure
scatter(scores(:,1),scores(:,2))
title("PCA Scores [e dimensions]")
xlabel("PC1")
ylabel("PC2")
zlabel("PC3")
grid on

figure
scatter3(scores(:,1),scores(:,2),scores(:,3))
title("PCA Scores [3 dimensions]")
xlabel("PC1")
ylabel("PC2")
zlabel("PC3")
grid on


