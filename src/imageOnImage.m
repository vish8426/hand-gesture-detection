 
function background = imageOnImage(background,foreground,alpha,center,shape)

    % Coordinates of drawing with respect to faduciary 
    x = center(1) - floor(shape(2)/2);
    y = center(2) - floor(shape(1)/2);
    
    if x < 1 || y < 1
        disp('Image off side of background');
        return;
    end
    % Check for transparent background
    if size(alpha) ~= size(foreground(:,:,1))
        error("Replacement image must have a transparent backgorund");
    end
    
    % Resize forground image
    resized_foreground = imresize(foreground, shape);
    alpha = imresize(alpha, shape);
    
    % Get transparent mask 
    mask = alpha<10;
    
    % Make mask for replaced background pixels
    scale = size(background);
    large_mask = ones(scale(1:2));
    large_mask(x:x+shape(1)-1,y:y+shape(2)-1) = double(mask);

    % Replace background pixels with forground pixels
    background(repmat(~large_mask,[1 1 3])) = resized_foreground(repmat(~mask,[1 1 3]));
    
end


