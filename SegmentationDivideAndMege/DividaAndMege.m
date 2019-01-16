clc;
clear;
close all;

img=imread('umbrealla.png');

img_hsv=rgb2hsv(img);

img_h=img_hsv(:,:,1);
img_h=double(img_h);

imshow(img_h,[]);
