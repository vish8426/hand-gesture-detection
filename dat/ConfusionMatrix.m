clear;
clc;
clf;
clf reset;
close all;

g1 = []';	% Known groups
g2 = []';	% Predicted groups

Y = randi(21,101,1);
Y_hat = Y;
Y_hat(randi(101,20,1)) = randi(21,20,1);
[c,order] = confusionmat(Y,Y_hat);