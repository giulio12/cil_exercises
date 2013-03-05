function [ Y ] = stdize( X )

% Fast solution
X_std = std(X);
X_mean = mean(X);
Y = (X - repmat(X_mean,size(X,1),1))./(repmat(X_std,size(X,1),1));

%% Slow solution
%Y = zeros(size(X,1),size(X,2));

%for i=1:size(X,1)
%    for j=1:size(X,2)
%        Y(i,j) = (X(i,j) - X_mean(j))/X_std(j);
%    end
%end

end

