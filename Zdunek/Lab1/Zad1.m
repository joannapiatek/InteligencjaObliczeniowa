X=[2.5 0.5 2.2 1.9 3.1 2.3 2 1 1.5 1.1; 2.4 0.7 2.9 2.2 3 2.7 1.6 1.1 1.6 0.9];

J = 2;

covX = cov(X');
[V, D] = eigs(covX,J);
Z = V'*X;


clf;
plot(X(1, :), (X(2, :)), '*');
hold on;
plot(Z(1, :), (Z(2, :)), '*');
hold on;
plot(V(1,:))
hold on;
plot(V(:,1))

