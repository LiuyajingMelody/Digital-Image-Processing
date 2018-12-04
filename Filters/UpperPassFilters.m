close all;
clear;
clc;

img=imread('moon.tif');

mask=[0,1,0 ;1,-4,1; 0,1,0];
%mask_sum=sum(sum(abs(mask)));
mask=mask/9;

img_filtered=conv2(img,mask,'same');

img_filtered_abs=abs(img_filtered);

img_filtered_scaled=img_filtered+128;


figure(1);

subplot(1,3,1);
imshow(img,[]);
title("Orginal");

subplot(1,3,2);
imshow(img_filtered_abs,[]);
title("Mask+Abs");

subplot(1,3,3);
imshow(img_filtered_scaled,[]);
title("Mask+Scaled");

%%
%Laplacian

mask_lap=fspecial('laplacian');

img_lapsed=conv2(img,mask_lap,'same');

figure(2);

subplot(1,4,1);
imshow(img,[]);
title("Orginal");

subplot(1,4,2);
imshow(abs(img_lapsed),[]);
title("Lap Abs");

subplot(1,4,3);
imshow((img_lapsed+128),[]);
title("Lap Scaled");

subplot(1,4,4);
imshow(img-uint8(img_lapsed),[]);
title("Orginal-Lap Edges");
%%
