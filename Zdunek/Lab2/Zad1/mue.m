%% Algorytm MUE
%% Inicjalizacja
A_mue = rand(size(Y,1), J);
X_mue = rand(J, size(Y,2));
eps = 0.0000000001
%%B_x = A_mue'*Y;
%%C_x = A_mue'*(A_mue*X_mue);
%%D_a= Y*X_mue';
%%E_a = (A_mue*X_mue)*X_mue';


%% Update
MaxIter = 400;
for k = 1: MaxIter
    
   B_x = A_mue'*Y;
   C_x = A_mue'*(A_mue*X_mue);
   
   B_x( B_x==0 )= eps;
   C_x( C_x==0 )=eps;

   for j = 1 : J
       for t = 1: T
       
       quotientX = B_x(j, t)/C_x(j,t);
       nextX = X_mue(j, t) * quotientX;
       X_mue(j, t) = max(0, nextX);  
       end   
   end
  
   X_mue = X_mue*(diag(1./sum(X_mue, 1)));
   
   D_a= Y*X_mue';
   E_a = (A_mue*X_mue)*X_mue'; 
   E_a( E_a==0 )= eps;
   D_a( D_a==0 )= eps;
   
   for j = 1 : J   
       for i = 1: I
       quotientA = D_a(i, j) /E_a(i,j);
       nextA = A_mue(i , j) * quotientA;
       A_mue(i, j) = max(0, nextA);       
       end
    end
    
   % Blad residualny
   res_mue(k) = norm(Y - A_mue*X_mue, 'fro')/norm(Y, 'fro');
   
end
