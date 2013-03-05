function [ x_centered, lambda, U ] = PCAanalysis( X )

mu = mean(X,2);
x_centered = (X - repmat(mu, 1, size(X,2)));
X_cov = cov(x_centered);

[U, lambda] = eig(X_cov); 
lambda = diag(lambda);

[sorted_lambda, index] = sort(lambda,1,'descend'); % not clear why we have to do this
U = U(:,index); % just follows from the previous step
lambda = sorted_lambda;

end