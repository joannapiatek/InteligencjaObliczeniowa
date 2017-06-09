%% Algorytm HALS
%% Inicjalizacja
A_hals = rand(size(Y,1), J);
X_hals = rand(J, size(Y,2));
B = A_hals'*A_hals;
C = A_hals'*Y;
D = X_hals*X_hals';
E = Y*X_hals';

%% Update
MaxIter = 400;
for k = 1: MaxIter
   for j = 1 : J
       quotientX = (C(j, :) - B(j, :)*X_hals)/B(j,j);
       nextX = X_hals(j, :) + quotientX;
       X_hals(j, :) = max(0, nextX);
       
       quotientA = (E(:, j) - A_hals*D(:, j))/D(j,j);
       nextA = A_hals(:, j) + quotientA;
       A_hals(:, j) = max(0, nextA);       
   end
   
   % Blad residualny
   res_hals(k) = norm(Y - A_hals*X_hals, 'fro')/norm(Y, 'fro');
end

semilogy(res_hals)
