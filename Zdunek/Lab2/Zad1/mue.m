%% Algorytm MUE
%% Inicjalizacja
A_mue = rand(size(Y,1), J);
X_mue = rand(J, size(Y,2));
eps = 0.00000000001



%% Update
MaxIter = 400;
for k = 1: MaxIter
    
  
 
  
   A_mue = max(0, A_mue .* (Y*X_mue')./max(eps,(A_mue*X_mue*X_mue')));

    
     A_mue = A_mue*(diag(1./max(sum(A_mue, 1),eps)));
     
     
      X_mue = max(0, X_mue .* (A_mue'*Y)./max(eps,(A_mue'*A_mue*X_mue)));
     
     
     
   % Blad residualny
   res_mue(k) = norm(Y - A_mue*X_mue, 'fro')/norm(Y, 'fro');
   
end
