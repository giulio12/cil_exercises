function X = Extract(I,d)

pad_x = mod(size(I,1),d);
pad_y = mod(size(I,2),d);

if(pad_x ~= 0)
    pad_x = d - pad_x;
end
if(pad_y ~= 0)
    pad_y = d - pad_y;
end

% new padded array with last column and last array
P = padarray(I,[pad_x pad_y],'replicate','post');

% d*d = d^2 is the length of each column
% size(P,1)/d)*(size(P,2)/d) is just the total number of squares we have
X = zeros(d*d,(size(P,1)/d)*(size(P,2)/d));

% iterate over all the sqaures 
for m = 0:(size(P,1)/d)-1
    for k = 0:(size(P,2)/d)-1
        % select the single squares
        T = P(1+(m*d) : d+(m*d) , 1+(k*d) : d+(k*d));
        X(:,m*(size(P,2)/d)+k+1) = reshape(T',d*d,1);
    end
end
end