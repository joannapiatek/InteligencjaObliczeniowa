images_arrays = getAllImages();

J = [4, 10, 20, 30];
[groups, groups_pca] = groupImages(images_arrays, J(1));