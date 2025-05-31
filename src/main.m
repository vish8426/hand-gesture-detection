close all;
replacement_path = '.\replacement_images';

% Styles:
%  - real
%  - cartoon
%  - drawn
style = 'cartoon';

load('image.mat');
background = image;


sketches(1).class = 'bicycle';
sketches(1).shape = [400,400];
sketches(1).center = [201,300];

    
for i = 1:length(sketches)
    image_path = strcat(replacement_path,'\',...
                        style,'\',...
                        sketches(1).class, '.jpg');
                    
    % Load image from file
    [foreground, ~, alpha] = imread(image_path);

    background = imageOnImage(background,...
                              foreground,...
                              alpha,...
                              sketches(i).center,...
                              sketches(i).shape);


end

imshow(background);

