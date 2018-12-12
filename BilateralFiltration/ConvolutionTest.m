clc;
clear all;


img=double(imread('parrot.bmp'));

img_filtere=convolution(img,[15,15]);

figure(1);
subplot(1,2,1);
imshow(uint8(img));
title("Orginal");

subplot(1,2,2);
imshow(uint8(img_filtere));
title("Filtered");