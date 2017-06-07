grouping_time_means = [];
for classes_count = min_classes_count : max_classes_count
    grouping_time_means(classes_count) = mean(grouping_time(classes_count, :));
end


classes_xaxis = min_classes_count:1:max_classes_count;
plot(classes_xaxis, grouping_time_means(min_classes_count:max_classes_count), '-o')
hold on;

for j_idx = 1 : 4
    plot(classes_xaxis, grouping_pca_time(min_classes_count:max_classes_count, j_idx), '-o')
    hold on;
end

plot_title = strcat('Zale¿noœæ czasu grupowania od liczby klas');
title(plot_title)
axis([1.8 5.2 0 0.04])
xlabel('Liczba klas')
ylabel('Skutecznoœæ [0-1]')
legend('Grupowanie','Grupowanie z PCA, J=4', 'Grupowanie z PCA, J=10', 'Grupowanie z PCA, J=20', 'Grupowanie z PCA, J=30')