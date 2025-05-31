

function image_out = cleanImage(image_in)

    temp = rgb2gray(image_in);
    temp = 255*uint8(~(temp>100));
    
    se = strel('square',8);
    temp = imdilate(temp,se);
    temp = imdilate(temp,se);

    figure(1);
    imshow(temp);
    
    image_out = imresize(temp,[28,28]);
    
end
