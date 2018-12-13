clc;
clear all;
load('MR_data.mat');

img=double(I_noisy1);

figure(1);

subplot(1,2,1);
imshow(uint8(img));
title("Orginal img");

img_nlm=nlm(img,[5,5],[2,2],5,2);

subplot(1,2,2);

imshow(uint8(img_nlm));
title("Non local means");