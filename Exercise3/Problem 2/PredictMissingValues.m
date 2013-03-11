function X_pred = PredictMissingValues(X, nil)
% Predict missing entries in matrix X based on known entries. Missing
% values in X are denoted by the special constant value nil.

% 1. input missing values
X_pred = X;
X_pred(X_pred == nil) = NaN;
X_mean = nanmean(X_pred);

for i=1:size(X_pred,1)
    for j=1:size(X_pred,2)
        if(isnan(X_pred(i,j)))
            X_pred(i,j) = X_mean(1,j);
        end
    end
end

% 2. SVD decomposition
[U,D,V] = svd(X_pred);

U_prime = U*sqrt(D);
V_prime = sqrt(D)*V;

% 3. Prediction -- why do we have to do this???

for i=1:size(X,1)
    for j=1:size(X,2)
        if(X(i,j)==nil)
            X_pred(i,j) = U_prime(i,:)*V_prime(j,:)';
        end
    end
end


% 4. Model Selection
k = 8;

U = U(:,1:k);
D = D(1:k,1:k);
V = V(:,1:k);

X_pred = U*D*V';



end