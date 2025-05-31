clear;
close all;

cam = webcam('Microsoft Camera Rear');
cam.Resolution = '640x640';
image = snapshot(cam);

while(true)
    img = snapshot(cam);
    img = cleanImage(img);
%     figure(2);
%     imshow(img);
    [predictions, confidence] = classifyImage(img,6);
    disp(predictions);
    disp(confidence);
end

