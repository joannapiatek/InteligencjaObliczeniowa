function [groups, groups_pca] = groupImages(images_arrays, J)

[V, pca_images_arrays, D] = myPCA(images_arrays', J);
groups = kmeans(images_arrays, 5);
groups_pca = kmeans(pca_images_arrays', 5);

T=[ones(10,1);ones(10,1).*2;ones(10,1).*3;ones(10,1).*4;ones(10,1).*5];
groups_acc = AccMeasure(T, groups);
groups_pca_acc = AccMeasure(T, groups_pca);