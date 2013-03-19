function X_pred = PredictMissingValues(X, nil)
% Predict missing entries in matrix X based on known entries. Missing
% values in X are denoted by the special constant value nil.

% 1. input missing values
X_pred = X;
X_pred(X_pred == nil) = NaN;
X_mean = nanmean(X_pred);

for i=1:size(X_pred,2)
    movie = X_pred(:,i);
    movie(isnan(movie)) = X_mean(1,i);
    X_pred(:,i) = movie;
end

% 2. SVD decomposition
[U,D,V] = svd(X_pred,0);


% 3. Prediction -- why do we have to do this???

%for i=1:size(X,1)
%    for j=1:size(X,2)
%        if(X(i,j)==nil)
%            X_pred(i,j) = U_prime(i,:)*V_prime(j,:)';
%        end
%    end
%end


% 4. Model Selection
% D_diag = sort(diag(D),'descend');
% k=0;
% %plot(D_diag)
% prev_delta = intmax;
% min_delta = intmax;
% for i=1:size(D_diag,1)-1
%     delta = D_diag(i) - D_diag(1+1);
%     if(min_delta > delta && abs(prev_delta-delta) > 20)
%         k = i;
%         min_delta = delta;
%     end
%     prev_delta = delta;
% end

% 5. Recommender System
best_k = 6;
% best_mse = intmax;
% diag(D)
% for k=1:size(diag(D))
%     X_pred = U(:,1:k)*D(1:k,1:k)*V(:,1:k)';
%     mse = sqrt(mean((X_tst(X_tst ~= nil) - X_pred(X_tst ~= nil)).^2));  % error on known test values
%     if (mse < best_mse)
%         best_mse = mse;
%         best_k = k;
%     end
% end

X_pred = U(:,1:best_k)*D(1:best_k,1:best_k)*V(:,1:best_k)';

end