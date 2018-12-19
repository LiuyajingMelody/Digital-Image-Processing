close all;
clc;
clear;
img=imread('ertka.bmp');

mask=strel('square',3);

img_erode=imerode(img,mask);
img_dylate=imdilate(img,mask);
img_open=imopen(img,mask);
img_close=imclose(img,mask);


figure(1);

subplot(2,3,1);
imshow(img);
title('Orginal');


subplot(2,3,2);
imshow(img_erode);

subplot(2,3,3);
imshow(img_dylate);

subplot(2,3,4);
imshow(img_open);

subplot(2,3,5);
imshow(img_close);