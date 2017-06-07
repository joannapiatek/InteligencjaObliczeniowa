clear

% Dane
I1 = 10;
I2 = 20;
I3 = 30;
J = 5;

% Generowanie (?) - trzea sie upewnic, czy II wymiar to J
U1w = max(0, randn(I1, J));
U2w = max(0, randn(I2, J));
U3w = max(0, randn(I3, J));


% Syntetyczne obserwacje Y - do sprawdzenia
Y = [];
U12w = U1w*U2w';

% Operacje takie jak ta w petli for nalezy powtorzyc dla innych wymiarow
% Zsumuja sie na zasadzie superpozycji
for i = 1:J
    Y(:, :, i) = U12w*U3w(i);
end