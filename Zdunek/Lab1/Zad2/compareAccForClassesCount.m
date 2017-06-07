clf;
plot(J, repmat(mean(grouping_acc), 4, 1), '-o');
hold on;
plot(J, repmat(mean(class_acc), 4, 1), '-o');
hold on
plot(J, grouping_pca_acc, '-o');
hold on;
plot(J, class_pca_acc, '-o');
        
plot_title = strcat('Zale¿noœæ skutecznosci klasyfikacji i grupowania od J dla',{' '}, int2str(classes_count), ' klas');
title(plot_title)
axis([3 32 0.88 1.01])
xlabel('Liczba komponentów g³ównych')
ylabel('Skutecznoœæ [0-1]')
legend('Grupowanie','Grupowanie z PCA', 'Klasyfikacja', 'Klasyfikacja z PCA')