classes_count = 2;
images_arrays = getAllImages(classes_count);

J = [4, 10, 20, 30];
iterations = 10;

images_classes = [];
for i = 1:classes_count
    images_classes =[images_classes; ones(10,1).*i];
end

for j_val = 1:4
    
    grouping_results = zeros([iterations 4]);
    classification_results = zeros([iterations 4]);
    
    for i = 1 : iterations
        % Redukcja wymiarow
        [V, pca_images_arrays, D] = myPCA(images_arrays', J(j_val));
        
        % Grupowanie za pomoca k-srednich
        g_result = getGroupingResults(images_arrays, pca_images_arrays, classes_count, images_classes);
        grouping_results(i,:) = g_result;
        
        % Klasyfikacja z uzyciem k-NN
        c_result = getClassificationResults(images_arrays, pca_images_arrays, classes_count, images_classes);
        classification_results(i,:) = c_result;
    end
    
    % Zapis wynikow do plikow
    group_filename = strcat('grouping_j_', int2str(J(j_val)), '_gr_', int2str(classes_count), '.mat');
    save(group_filename, 'grouping_results');
    class_filename = strcat('classification_j_', int2str(J(j_val)), '_gr_', int2str(classes_count), '.mat');
    save(class_filename, 'classification_results');
end

