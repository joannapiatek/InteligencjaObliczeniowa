%% Algorytm HALS
%% Inicjalizacja
A_hals = rand(size(Y,1), J);
X_hals = rand(J, size(Y,2));

%% Update
MaxIter = 400;
res_hals = zeros(1,MaxIter);
for k = 1: MaxIter
    XXT = X_hals*X_hals';
    YXT = Y*X_hals';
    ATA = A_hals'*A_hals;
    ATY = A_hals'*Y;
    
    for j = 1 : J
       % Update A       
       nextA = A_hals(:,j) + (YXT(:,j) - A_hals*XXT(:,j))./max(eps,XXT(j,j));
       A_hals(:, j) = max(0, nextA);  
                    
       % Update X
       nextX = X_hals(j,:) + (ATY(j,:) - ATA(j,:)*X_hals)./max(eps,ATA(j,j));
       X_hals(j, :) = max(0, nextX);       
   end
   
   % Normalizacja
   A_hals = A_hals*(diag(1./max(eps, sum(A_hals, 1))));
   
   % Blad residualny
   res_hals(k) = norm(Y - A_hals*X_hals, 'fro')/norm(Y, 'fro');
end