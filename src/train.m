clear;

data_path = 'data\pictures';
addpath('Functions');
reload_data = 0;
retrain_CNN = 0;
folds = 1;

if reload_data == 1
    [folders, images, labels] = getData(data_path);
    save('data','folders','images','labels');
else
    load('data');
end

input_size = size(images(:,:,:,1));

[layers, options] = defineNet(input_size, length(folders));

[training_indices, testing_indices] = crossValKFold(folds,length(labels));

if retrain_CNN == 1
%     training_data = 255*uint8(images>10);%(:,:,:,training_indices(1,:));
%     
%     for i = 1:length(training_data)
%         xshift = randi(14)-7;
%         yshift = randi(14)-7;
%         training_data(:,:,:,i) = imtranslate(training_data(:,:,:,i),[xshift, yshift],'FillValues',0);
%         disp(i/length(training_data));
%     end
%     
%     training_labels = categorical(labels);%(training_indices(1,:)));
    load('trans_data');
    CNN = trainNetwork(training_data,training_labels,layers,options);
    save('CNN_V3','CNN');
else
    load('CNN_V3');
end

testing_data = training_data;%255*uint8(images>10);%(:,:,:,testing_indices(1,:));
    
testing_labels = grp2idx(training_labels);%categorical(labels);%(testing_indices(1,:));

[Pred,scores] = classify(CNN,testing_data);
Pred = grp2idx(Pred);

[confmat, acc, prec, rec, f1score] = analyseModel(Pred, testing_labels, length(folders));

clear;