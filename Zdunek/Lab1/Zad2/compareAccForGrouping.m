grouping_acc_means = [];
for classes_count = min_classes_count : max_classes_count
    grouping_acc_means(classes_count) = mean(grouping_acc(classes_count, :));
end

plots = [];

classes_xaxis = min_classes_count:1:max_classes_count;
plots(1) = plot(classes_xaxis, grouping_acc_means(min_classes_count:max_classes_count), '-o');
hold on;

for j_idx = 1 : 4
    plots(j_idx+1) = plot(classes_xaxis, grouping_pca_acc(min_classes_count:max_classes_count, j_idx), '-o');
    hold on;
end

plot_title = strcat('Zale¿noœæ skutecznoœci grupowania od liczby klas');
title(plot_title)
axis([1.8 5.2 0.7 1])
xlabel('Liczba klas')
ylabel('Skutecznoœæ [0-1]')
legend(plots, 'Grupowanie','Grupowanie z PCA, J=4', 'Grupowanie z PCA, J=10', 'Grupowanie z PCA, J=20', 'Grupowanie z PCA, J=30')