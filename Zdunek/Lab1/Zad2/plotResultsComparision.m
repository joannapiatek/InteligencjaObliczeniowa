function plotResultsComparision()


%% Rodzaje porownan:
% - dla tego samego classes_count (wynik grupowania i klasyfikacji): 
%       zaleznosc skutecznosci od J, 
%       zaleznosc czasu od J
%

J = [4, 10, 20, 30];

min_classes_count = 2;
max_classes_count = 5;

for classes_count = min_classes_count : max_classes_count
    for j_idx = 1 : 4
        %% Moze tu juz zrobic osobna funkcje?
        group_filename = strcat('grouping_j_', int2str(J(j_idx)), '_gr_', int2str(classes_count), '.mat');
        class_filename = strcat('classification_j_', int2str(J(j_idx)), '_gr_', int2str(classes_count), '.mat');
        load(group_filename);
        load(class_filename);
        %% Usrednianie wynikow - osobna funkcja
        
        %% Dodawanie do wykresu i hold on
    end
    
    %% Zapis wykresu do pliku
end