function average_results = loadAverageResults(filename_begin, J, classes_count)

filename = strcat(filename_begin, int2str(J), '_gr_', int2str(classes_count), '.mat');
load(filename);
        
% Usrednianie wynikow - osobna funkcja
% A(3,:)   % Extract third row
[rows, cols] = size(results);
average_results = zeros(1, cols);

for col = 1 : cols
    data_col = results(:, col);
    average_results(col) = mean(data_col);
end