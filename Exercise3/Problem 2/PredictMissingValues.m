function X_pred = PredictMissingValues(X, nil)
% Predict missing entries in matrix X based on known entries. Missing
% values in X are denoted by the special constant value nil.

X_pred = X;

X_pred(X_pred == nil) = NaN;
X_mean = nanmean(X_pred);

% need to find a faster way for that
for i=1:size(X_pred,1)
    for j=1:size(X_pred,2)
        if(isnan(X_pred(i,j)))
            X_pred(i,j) = X_mean(1,j);
        end
    end
end