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

%% Syntetyczne obserwacje Y 
I = zeros(J,J,J);
for i = 1 : J
    I(i,i,i) = 1;   
end

Y = ntimes(ntimes(ntimes(I, U1w, 1, 2), U2w, 1, 2), U3w, 1, 2);

size(Y)

%% ALS 
% ntimes(U1w, U2w', 1, 2)