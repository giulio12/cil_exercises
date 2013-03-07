function [X_mean, mu, lambda, U ] = PCAanalysis( X )

mu = mean(X,2);
X_mean = repmat(mu, 1, size(X,2));
X_centered = X - X_mean;
X_cov = cov(X_centered');

[U, lambda] = eig(X_cov);
lambda = diag(lambda);

[sorted_lambda, index] = sort(lambda,'descend');
U = U(:,index); 
lambda = sorted_lambda;

end