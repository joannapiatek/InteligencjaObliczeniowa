clear all

% Dane
I1 = 10;
I2 = 20;
I3 = 30;
J = 5;
iter = 3;
% Inicjalizacja
U1w = max(0, randn(I1, J));
U2w = max(0, randn(I2, J));
U3w = max(0, randn(I3, J));

I = zeros(J,J,J);
for i=1:J
    I(i,i,i) = 1;
end
Y = ntimes(I,U1w,1,2);
Y = ntimes(Y,U2w,1,2);
Y = ntimes(Y,U3w,1,2);

U1 =  max(0, rand(I1, J));
U2 =  max(0, rand(I2, J));
U3 =  max(0, rand(I3, J));

% Matrycyzacja tensora Y
Y1 = reshape(permute(Y,[1,2,3]),size(Y,1),size(Y,2)*size(Y,3));
Y2 = reshape(permute(Y,[2,1,3]),size(Y,2),size(Y,1)*size(Y,3));
Y3 = reshape(permute(Y,[3,1,2]),size(Y,3),size(Y,1)*size(Y,2));

% Update faktorow
for i = 1:iter
    X1 = max(0,(kr(U2,U3))');    
    U1 = max(0, (Y1*X1')/(X1*X1'));

    X2 = max(0,(kr(U1,U3))');    
    U2 = max(0, (Y2*X2')/(X2*X2'));

    X3 = max(0,(kr(U1,U2))');
    U3 = max(0, (Y3*X3')/(X3*X3'));
end