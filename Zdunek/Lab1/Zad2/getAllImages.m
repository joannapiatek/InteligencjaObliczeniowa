function images_arrays = getAllImages(folders_count)

folders_names = ['s1/'; 's2/'; 's3/'; 's4/'; 's5/'];
images_arrays = [];

if length(folders_names) < folders_count
    folders_count = length(folders_names);
end


for i = 1:folders_count
    new_images = readImagesFromFolder(folders_names(i,:));
    images_arrays = [images_arrays; new_images];
end

%images_arrays = images_arrays';