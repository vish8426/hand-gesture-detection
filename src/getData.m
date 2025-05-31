function [folders, images, labels] = getData(data_path)


    files = dir(data_path);
    classes = {files.name};
    folders = strings(1,length(classes)-2);
    index = 1;
    disp('Loading Images of:');
    for i = 1:length(folders)
        addpath(strcat(data_path,'\',classes{i+2}));
        fprintf('   %ss\n',classes{i+2});
        folders(i) = classes{i+2};
        image_files = dir(strcat(data_path,'\',classes{i+2}));
        image_names = {image_files.name};
        
        for j = 3:length(image_names)
            images(:,:,1,index) = imread(strcat(data_path,'\',classes{i+2},'\',image_names{j}));  
            labels(index) = i;
            index = index + 1;
        end
    end

    % Randomize data order
    random_indices = randperm(length(images));
    images = images(:,:,:,random_indices);
    labels = labels(random_indices);



end