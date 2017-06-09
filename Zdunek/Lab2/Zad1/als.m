%% Algorytm ALS
%% Inicjalizacja
A_als = rand(size(Y,1), J);
X_als = rand(J, size(Y,2));

%% Update
MaxIter = 400;
for k = 1: MaxIter
    % Update A i X naprzemiennie
    A_als = max(0, Y*X_als'*inv(X_als*X_als'));
    % Normalizacja
    A_als = A_als*(diag(1./sum(A_als, 1)));
    
    X_als = max(0, inv(A_als'*A_als)*A_als'*Y);
        
    % Blad residualny
    res_als(k) = norm(Y - A_als*X_als, 'fro')/norm(Y, 'fro');
end

%% Porownanie Aws i As_als
Aws = Aw*diag(1./sum(Aw, 1));
As_als = A_als*diag(1./sum(A_als, 1));
% Jak porownamy Aws i As_als to maj¹ te same kolumny, ale czasem w innej
% kolejnosci
