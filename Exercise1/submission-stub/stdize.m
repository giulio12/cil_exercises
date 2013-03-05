function Y = stdize(X)
S = std(X);
M = mean(X);
Y = (X-repmat(M,size(X,1),1))./repmat(S,size(X,1),1);
end

%m = mean(X)
%s= 1./std(X)
%Y=(X-repmat(m,size(X,1),1))./repmat(s,size(X,1),1);