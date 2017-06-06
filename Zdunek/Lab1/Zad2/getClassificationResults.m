function result = getClassificationResults(images_arrays, pca_images_arrays, classes_count, images_classes)

tic;
model = fitcknn(images_arrays, images_classes);
cv_model = crossval(model,'KFold',classes_count);
cv_model_loss = kfoldLoss(cv_model);
default_time = toc;
tic;
model_pca = fitcknn(pca_images_arrays', images_classes);
cv_model_pca = crossval(model_pca,'KFold',classes_count);
cv_model_pca_loss = kfoldLoss(cv_model_pca);
pca_time = toc;

%% reszta do zmiany
default_acc = 1 - cv_model_loss;
pca_acc = 1 - cv_model_pca_loss;

result = [default_acc, pca_acc, default_time, pca_time];