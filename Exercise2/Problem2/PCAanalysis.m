function [ X_centered, lambda, U ] = PCAanalysis( X )

mu = mean(X,2);
X_centered = (X - repmat(mu, 1, size(X,2)));
X_cov = cov(X_centered');

[U, lambda] = eig(X_cov);
lambda = diag(lambda);

[sorted_lambda, index] = sort(lambda,1,'descend');
U = U(:,index); % just follows from the previous step
lambda = sorted_lambda;

end