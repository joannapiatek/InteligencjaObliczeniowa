function result = getGroupingResults(images_arrays, pca_images_arrays, clusters, images_classes)

tic;
groups = kmeans(images_arrays, clusters);
default_time = toc;
tic;
groups_pca = kmeans(pca_images_arrays', clusters);
pca_time = toc;

default_acc = AccMeasure(images_classes, groups)/100.0;
pca_acc = AccMeasure(images_classes, groups_pca)/100.0;

result = [default_acc, pca_acc, default_time, pca_time];