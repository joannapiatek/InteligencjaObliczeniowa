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

%% Algorytm ALS
%% Inicjalizacja
U1 = randn(I1, J);
U2 = randn(I2, J);
U3 = randn(I3, J);

Y1 = reshape(permute(Y,[1,2,3]),size(Y,1),size(Y,2)*size(Y,3));
Y2 = reshape(permute(Y,[2,1,3]),size(Y,2),size(Y,1)*size(Y,3));
Y3 = reshape(permute(Y,[3,1,2]),size(Y,3),size(Y,1)*size(Y,2));

% Update
Y_2d = reshape(Y,size(Y,1),size(Y,2)*size(Y,3));

MaxIter = 30;
for k = 1: MaxIter
    
    A1 = max(0,(kr(U3,U2))');    
    U1 = max(0, (Y1*A1')/(A1*A1'));
    U1 = U1*(diag(1./sum(U1, 1)));
    
    A2 = max(0,(kr(U3, U1))');    
    U2 = max(0, (Y2*A2')/(A2*A2'));
    U2 = U2*(diag(1./sum(U2, 1)));

    A3 = max(0,(kr(U2,U1))');
    U3 = max(0, (Y3*A3')/(A3*A3'));
    
    Yk = ntimes(ntimes(ntimes(I,U1,1,2),U2,1,2),U3,1,2);
    Yk_2d = reshape(Yk,size(Yk,1),size(Yk,2)*size(Yk,3));
    
    % Blad residualny
    res(k) = norm(Y_2d - Yk_2d, 'fro')/norm(Y_2d, 'fro');
end

semilogy(res)

mse = immse(Y, Yk);
sir = CalcSIR(Y_2d, Yk_2d);