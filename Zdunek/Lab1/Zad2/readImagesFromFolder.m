function arrays = readImagesFromFolder(folder_name)

    arrays = [];
    photos_count = 10;

    for i=1:photos_count

        nmb = num2str(i);
        filename = strcat(folder_name, nmb, '.pgm');
        photo_matrix = imread(filename);
        rows_count = size(photo_matrix, 1);
        photo_vector = [];
        for j = 1 : rows_count
            photo_vector = [photo_vector double(photo_matrix(j,:))];
        end
        arrays = [arrays; photo_vector];
    end
end