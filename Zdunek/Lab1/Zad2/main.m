groups_count = 5;
images_arrays = getAllImages(groups_count);

J = [4, 10, 20, 30];
iterations = 5;
results = zeros([iterations 4]);

for j_val = 1:4
    for i = 1 : iterations
        [V, pca_images_arrays, D] = myPCA(images_arrays', J(j_val));
        [default_acc, pca_acc, default_time, pca_time] = getGroupingResults(images_arrays, pca_images_arrays, groups_count);
        results(i,:) = [default_acc, pca_acc, default_time, pca_time];
    end
    
    filename = strcat('grouping_j_', int2str(J(j_val)), '_gr_', int2str(groups_count), '.mat');
    save(filename, 'results');
end

