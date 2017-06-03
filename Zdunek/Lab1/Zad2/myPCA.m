function [V, newX, D] = myPCA(X, J)
    X = bsxfun(@minus, X, mean(X,2));
    C = (X*X')./(size(X,2)-1);
    [V, D] = eigs(C,J);
    [D, order] = sort(diag(D), 'descend');
    V = V(:, order);
    newX = V'*X;
end