clc;
close all;
clear;

img=imread('dom.png');

img_log=edge(img,'log',0.009);

figure(1);
subplot(2,2,1);
imshow(img);
title('Orginal');

subplot(2,2,2);
imshow(img_log);
title('Log');

subplot(2,2,3);
img_canny=edge(img,'canny',0.3);
imshow(img_canny);
title('Canny');


img_sob=edge(img,'sobel',0.13);
subplot(2,2,4);
imshow(img_sob);
title('Sobel');
