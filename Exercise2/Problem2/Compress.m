function I_comp = Compress(I)

d = 8;
X = Extract(I,d);
[x_centered,lambda,U] = PCAanalysis(X);

% just for testing purposes
U_k = U(:,1:20);

size(U_k')
size(x_centered)

Z_k = U_k'*x_centered';


I_comp.color_dim = size(I,3); % 1 bw / 3 rgb
I_comp.d = d;
I_comp.Z_k = Z_k;
%I_comp.U_k = U_k;

end
