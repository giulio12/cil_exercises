function I_rec = Decompress(I_comp)

X_rebuilt = I_comp.U_k*I_comp.Z_k;
X_rebuilt = X_rebuilt + I_comp.X_centered;

for i=1:size(X_rebuilt,2)
    I_rec = vec2mat(X_rebuilt(:,i), I_comp.d);
end

imshow(I_rec)

end