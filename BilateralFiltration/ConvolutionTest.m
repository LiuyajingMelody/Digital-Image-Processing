%%
clc;
clear all;
load('MR_data.mat');

img=double(I_noisy1);
%img=double(imread('parrot.bmp'));
img_filtere=convolution(img,[5,5]);

figure(1);
subplot(1,3,1);
imshow(uint8(img));
title("Orginal");

subplot(1,3,2);
imshow(uint8(img_filtere));
title("Classic Spline");


%%


load('MR_data.mat');
%img=double(I_noisy4);
%img=double(imread('parrot.bmp'));

img_filtere=bilateral_filtration(img,[5,5],8);


subplot(1,3,3);
imshow(uint8(img_filtere));
title("Bilateral Filtration");
