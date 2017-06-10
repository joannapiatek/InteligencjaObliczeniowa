clear

% Dane
I1 = 10;
I2 = 20;
I3 = 30;
J = 5;

% Inicjalizacja
U1w = max(0, randn(I1, J));
U2w = max(0, randn(I2, J));
U3w = max(0, randn(I3, J));

%% Syntetyczne obserwacje Y - do sprawdzenia
% Operacje z petli maja sie zsumowac na zasadzie superpozycji
Y = [];

U12w = U1w*U2w';
for i = 1:I3
    Y(:, :, i) = U12w*U3w(i);
end

U13w = U1w*U3w';
for i = 1:I2
    Y(:, i, :) = U13w*U2w(i);
end

U23w = U2w*U3w';
for i = 1:I1
    Y(i, :, :) = U23w*U1w(i);
end

size(Y)

test = ntimes(U1w, U2w, 2, 2)
%% ALS