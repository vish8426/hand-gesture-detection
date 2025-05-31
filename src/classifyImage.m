

function [predictions, confidence] = classifyImage(image,num_classes)
    data_path = 'data\pictures';
    
    if size(image) ~= [28, 28]
        error('The input must be 28px by 28px black and white image');
    end
    
    load('CNN_V3.mat');
    
    [Pred, scores] = classify(CNN,image);
    prediction = grp2idx(Pred);
    
    files = dir(data_path);
    classes = {files.name};
    
    if num_classes > length(classes) - 2
        error('There are not enough classes');
    end
    
    temp = scores;
    predictions = strings(1,num_classes);
    confidence = zeros(1,num_classes);
    
    for j = 1:num_classes
        [M,I] = max(temp);
        predictions(j) = classes{I+2};
        confidence(j) = temp(I);
        temp(I) = 0;
    end
        
    prediction = classes{prediction+2};
    
end

