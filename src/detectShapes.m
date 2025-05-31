close all;


image = imread('test_image.jpg');

% function [classes, confidance, centroids, boundingboxes] = detectShapes(image)
    
    
    show_image = 1;
    thresh = 150;
    min_size = 0.0005;
    c_radius = 200;
    
    image = ~(rgb2gray(image)>thresh);

    regions = regionprops(image,'Image','Area','Centroid','BoundingBox');
    area = numel(image)*min_size;
    idx = [regions.Area]>area;
    regions = regions(idx);
    [~,idx] = sort([regions.Area],'descend');
    regions = regions(idx);

    centroids = cat(1, regions.Centroid);
    boundingboxes = cat(1, regions.BoundingBox);
    
    classes = strings(1,numel(regions));
    confidance = zeros(1,numel(regions));
    if show_image == 1
        figure(1);
        imshow(image);
        hold on
    end
    for i = 1:numel(regions)
        if i > length(centroids)
            break;
        end
        shape = size(image);
        center = flip(round(centroids(i,:)));
        if  sum(center)                          < c_radius ||...
            sum(shape-center)                    < c_radius ||...
            sum([shape(1)-center(1), center(2)]) < c_radius ||...
            sum([center(1), shape(2)-center(2)]) < c_radius
            if show_image == 1
                rectangle('Position',boundingboxes(i,:),'EdgeColor','r', 'LineWidth', 3);
            end
            regions(i) = [];
            centroids(i,:) = [];
            boundingboxes(i,:) = [];
            classes(i) = [];
            i = i - 1;
            continue;
        end

        if show_image == 1
            rectangle('Position',boundingboxes(i,:),'EdgeColor','g', 'LineWidth', 3);
        end
        drawing = regions(i).Image;

        se = strel('square',4);
        drawing = imdilate(drawing,se);
        drawing = imdilate(drawing,se);

        shape2 = size(drawing);

        buff = round((max(shape2) - shape2)/2);
        drawing = padarray(drawing,buff,0,'both');
        drawing = imresize(drawing,[28, 28]);

        [pred, conf] = classifyImage(255*uint8(drawing),6);
        classes(i) = pred(1);
        confidance(i) = conf(1);
        if show_image == 1
            txt = {pred(1),round(conf(1),3)};
            text(boundingboxes(i,1),boundingboxes(i,2),txt,'FontSize',14,'Color','red')
        end
    %     drawing = imresize(drawing,[200, 200]);
    %     figure
    %     imshow(drawing);
    end
%end

