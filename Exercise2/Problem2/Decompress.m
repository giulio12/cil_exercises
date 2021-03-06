function I_rec = Decompress(I_comp)

d = I_comp.d;


I_rec = zeros(I_comp.width, I_comp.height, I_comp.colors);


for c=1:I_comp.colors
    
    X_rebuilt = I_comp.U_k{c}*I_comp.Z_k{c};
    X_rebuilt = X_rebuilt + repmat(I_comp.X_centered{c},1,size(I_comp.Z_k{c},2));
       
    x_patch = 0;
    y_patch = 0;
    
    for i=1:size(X_rebuilt,2)
        I_rec(x_patch*d+1:x_patch*d+d, y_patch*d+1:y_patch*d+d,c) = vec2mat(X_rebuilt(:,i), d); 
        y_patch = y_patch + 1;
        
        if(ceil(I_comp.height / d) <= y_patch)
            y_patch = 0;
            x_patch = x_patch + 1;
            
            if(ceil(I_comp.width / d) <= x_patch)
                break;
            end
        end
    end
end


I_rec = I_rec(1:I_comp.width, 1:I_comp.height,:);
imshow(I_rec);

end