function plotResultsComparision()

%% Initialization
J = [4, 10, 20, 30];

min_classes_count = 2;
max_classes_count = 5;
grouping_acc = [];
grouping_pca_acc = [];
grouping_time = [];
grouping_pca_time = [];
class_acc = [];
class_pca_acc = [];
class_time = [];
class_pca_time = [];

%% Porownanie: dla tego samego classes_count (wynik grupowania i klasyfikacji): 
% - zaleznosc skutecznosci od J, 
% - zaleznosc czasu od J
    
%% Wykresy - klasyfikacja i grupowanie
for classes_count = min_classes_count : max_classes_count
    for j_idx = 1 : 4
        grouping_results = loadAverageResults('grouping_j_', J(j_idx), classes_count);
        grouping_acc(j_idx) = grouping_results(1);
        grouping_pca_acc(j_idx) = grouping_results(2);
        grouping_time(j_idx) = grouping_results(3);
        grouping_pca_time(j_idx) = grouping_results(4);
    
        class_results = loadAverageResults('classification_j_', J(j_idx), classes_count);
        class_acc(j_idx) = class_results(1);
        class_pca_acc(j_idx) = class_results(2);
        class_time(j_idx) = class_results(3);
        class_pca_time(j_idx) = class_results(4);        
   end
    
%     Porownanie skutecznosci
%    compareAccForClassesCount
%     Porownanie czasu trwania
    compareTimeForClassesCount        
end

%% Wykresy - grupowanie
% for j_idx = 1 : 4
%     for classes_count = min_classes_count : max_classes_count
%         grouping_results = loadAverageResults('grouping_j_', J(j_idx), classes_count);
%         grouping_acc(classes_count, j_idx) = grouping_results(1);
%         grouping_pca_acc(classes_count, j_idx) = grouping_results(2);
%         grouping_time(classes_count, j_idx) = grouping_results(3);
%         grouping_pca_time(classes_count, j_idx) = grouping_results(4);
%     end
% end
%
% Porownanie skutecznosci
% compareAccForGrouping
% compareTimeForGrouping