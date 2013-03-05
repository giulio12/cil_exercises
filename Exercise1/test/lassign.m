function a = lassign_reference_vec(X, mu0, Sigma0, mu1, Sigma1)

a = g(X, mu0, Sigma0) < g(X, mu1, Sigma1);
a = a + 1;
end

function p = g(X, mu, Sigma)

D = (X - repmat(mu,1,size(X,2)))';
p = -log(det(Sigma)) - sum((D/Sigma).*D,2)';

end

%WRONG SOLUTION :/

%function p = p1(X, mu, Sigma)

%p = (1/(((2*pi)^1/2)*det(Sigma)))*exp(-1/2*((X-mu)')*inv(X)*(X-mu));

%end


%function p = p2(X, mu, Sigma)

%p = (1/(((2*pi)^2/2)*det(Sigma)))*exp(-1/2*((X-mu)')*inv(X)*(X-mu));

%end