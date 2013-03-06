function I_comp = Compress(I)

d = 8;

I_comp.d = d;
I_comp.width = size(I,1);
I_comp.height = size(I,2);
I_comp.colors = size(I,3);

for i=1:size(I,3)
    X = Extract(I(:,:,i),d);
    [X_centered,lambda,U] = PCAanalysis(X);
    
    % just for testing purposes
    % use the first 20 dimension of the eigenmatrix
    U_k = U(:,1:50);
    
    Z_k = U_k'*X_centered;
    
    I_comp.Z_k{i} = Z_k;
    size(I_comp.Z_k{i})
    I_comp.U_k{i} = U_k;
    I_comp.X_centered{i} = X_centered;
end

end
