function images_arrays = getAllImages()

folders_names = ['s1/'; 's2/'; 's3/'; 's4/'; 's5/'];
images_arrays = [];

for i = 1:length(folders_names)
    new_images = readImagesFromFolder(folders_names(i,:));
    images_arrays = [images_arrays; new_images];
end

%images_arrays = images_arrays';