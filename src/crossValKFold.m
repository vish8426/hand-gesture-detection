

function [training_indices, testing_indices] = crossValKFold(folds,num_exapmles)

    percent_training = 90; % 90% of the data will be used as training data

    num_train = floor(num_exapmles*percent_training/100);
    num_test = floor(num_exapmles*(1-percent_training/100));

    training_indices = [];
    testing_indices = [];
    
    for i = 1:folds
        test_start = floor((num_exapmles/folds)*(i-1));
        
        testing_indices = [testing_indices; test_start + randperm(num_test)];
        training_indices = [training_indices; cat(2,randperm(test_start),test_start+num_test+randperm(num_train-test_start))];
    end
end