close all;
clc;
clear;

img=imread('jet.bmp');
load maskiPP.mat;


img_cov=conv2(img,S1,'same');

img_cov2=conv2(img,S2,'same');

sobel_combined=sqrt(img_cov.^2+img_cov2.^2);

sobel_combined_abs=abs(img_cov)+abs(img_cov2);



subplot(1,3,1);
imshow(img);
title("Orginal");

subplot(1,3,2);
imshow((sobel_combined),[]);
title("Sobol combined sqrt()");

subplot(1,3,3);
imshow((sobel_combined_abs),[]);
title("Sobol combined abs()");
