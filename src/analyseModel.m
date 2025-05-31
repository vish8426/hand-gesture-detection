function [confmat, acc, prec, rec, f1score] = analyseModel(prediction, clasification, num_classes)

    % Check that the vectors are the same length
    if length(prediction) ~= length(clasification)
        error('Vectors not the same length');
    end
    
    % Initilize analysis pramaters
    confmat = zeros(num_classes);
    num_right = 0;
    rec = zeros(num_classes,1);
    prec = zeros(num_classes,1);
    
    % For each prediction
    for i = 1:length(prediction)
        % Add 1 to the recall of this class
        rec(clasification(i)) = rec(clasification(i)) + 1;
        % Add 1 to the confusion matrix at row = prediction, col = classification
        confmat(prediction(i), clasification(i)) = confmat(prediction(i), clasification(i)) + 1;
        
        % If prediction was correct
        if prediction(i) == clasification(i)
            % Increase the number of correct predictions
            num_right = num_right + 1;
            % Increase the number right for this class
            prec(prediction(i)) = prec(prediction(i)) + 1;
        end
    end
    
    acc = num_right/length(prediction);
    prec = prec./rec;
    f1score = (prec.*rec)./(prec + rec);
    
    fprintf('      Accuracy:   %d%%\n',round(acc*100));
    fprintf('      Precision:');
    for i = 1:num_classes
        fprintf(' %3.d%%,',round(prec(i)*100));
    end
    fprintf('\n');
    
    fprintf('      F1 Score: ');
    for i = 1:num_classes
        fprintf(' %3.d%%,',round(f1score(i)*100));
    end
    fprintf('\n');
    
    fprintf('      Recall:   ');
    for i = 1:num_classes
        fprintf('  %3.d,',round(rec(i)));
    end
    fprintf('\n');

end