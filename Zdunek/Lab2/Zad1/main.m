%% Inicjalizacja
clear 

% Dane oryginalne
I = 100;
T = 1000;
J = 10;

% Bêdzie 50% el. ujemnych, trzeba je zamienic na zerowe
Aw = max(0, randn(I, J));
Xw = max(0, randn(J, T));

Y = Aw*Xw;

%% Algorytmy
als
hals

%% Bledy residualne
semilogy(res_als)
semilogy(res_hals)


%% Jakosc estymacji SIR
% Jak wychodzi ponad 200 to jest spoko
CalcSIR(Aw, A_als);
CalcSIR(Aw, A_hals);

%% MSE ?