

function [layers, options] = defineNet(input_size,output_length)

    layers = [
        imageInputLayer(input_size)

        convolution2dLayer(6,16,'Padding','same')
        batchNormalizationLayer
        reluLayer

        maxPooling2dLayer(6,'Stride',6)

        convolution2dLayer(3,22,'Padding','same')
        batchNormalizationLayer
        reluLayer

        maxPooling2dLayer(4,'Stride',4)

        convolution2dLayer(3,38,'Padding','same')
        batchNormalizationLayer
        reluLayer

        fullyConnectedLayer(output_length)
        softmaxLayer
        classificationLayer];

    options = trainingOptions('sgdm', ...
                              'InitialLearnRate',0.01, ...
                              'MaxEpochs',8, ...
                              'Shuffle','every-epoch', ...
                              'Verbose',false, ...
                              'Plots','training-progress');
end