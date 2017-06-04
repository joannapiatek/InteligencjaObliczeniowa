function [default_acc, pca_acc, default_time, pca_time] = getGroupingResults(images_arrays, pca_images_arrays, clusters)

tic;
groups = kmeans(images_arrays, clusters);
default_time = toc;
tic;
groups_pca = kmeans(pca_images_arrays', clusters);
pca_time = toc;

T = [];
for i = 1:clusters
    T =[T; ones(10,1).*i]; %;ones(10,1).*2;ones(10,1).*3;ones(10,1).*4;ones(10,1).*5];
end
default_acc = AccMeasure(T, groups);
pca_acc = AccMeasure(T, groups_pca);