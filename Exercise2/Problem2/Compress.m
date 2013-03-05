function I_comp = Compress(I)

d = 8;
X = Extract(I,d);
[X_centered,lambda,U] = PCAanalysis(X);

% just for testing purposes
% use the first 20 dimension of the eigenmatrix
U_k = U(:,1:40);

% obtain the Z matrix
Z_k = U_k'*X_centered;


I_comp.d = d;
I_comp.width = size(I,1);
I_comp.height = size(I,2);
I_comp.Z_k = Z_k;
I_comp.U_k = U_k;
I_comp.X_centered =X_centered;

end
