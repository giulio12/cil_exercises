function D = pairdist(P, Q)
%D = zeros(size(P,1),size(Q,1));

% Fast solution
[X1, X2] = meshgrid(P(:,1), Q(:,1));
[Y1, Y2] = meshgrid(P(:,2), Q(:,2));
D = sqrt((X1 - X2).^2 + (Y1 - Y2).^2)';

% Slow solution
%for i=1:size(P,1)
%    for j=1:size(Q,1)
%        D(i,j) = sqrt((P(i,1)-Q(j,1))^2 + (P(i,2)-Q(j,2))^2);
%    end
%end

end
