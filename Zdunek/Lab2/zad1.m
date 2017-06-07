clear 

% Dane oryginalne
I = 100;
T =1000;
J = 10;
% Bêdzie 50% el. ujemnych, trzeba je zamienic na zerowe
Aw = max(0, randn(I, J));
Xw = max(0, randn(J, T));

Y = Aw*Xw;

% Mamy estymowaæ A i W (?)

% Inicjalizacja
A = rand(size(Y,1), J);
X = rand(J, size(Y,2));

%% Algorytm ALS

MaxIter = 100;
for k = 1: MaxIter
    % Update A i X naprzemiennie
    A = max(0, Y*X'*inv(X*X'));
    % Normalizacja
    A = A*(diag(1./sum(A, 1)));
    
    X = max(0, inv(A'*A)*A'*Y);
    % ^^ rozwiazania najmniejszych kwadratow, trzeba zrobic poprawke    
    % blad residualny??
    res(k) = norm(Y - A*X, 'fro')/norm(Y, 'fro');
end
plot(res)

% CalcSIR sciagnac
% CalcSIR(Aw, A)
% Jak wychodzi ponad 200 to jest spoko

Aws = Aw*diag(1./sum(Aw, 1));
As = A*diag(1./sum(A, 1));
% Jak porownamy Aws i As to maj¹ te same kolumny, ale czasem w innej
% kolejnosci


%% Jeszcze do zrobienia: jakosc estymacji - MSE



%% Algorytm HALS - trudny jest xD


