close all;
clearvars;
clc;

img = imread('ccl2.png');


figure;
subplot(1,3,1);
imshow(img,[]);
title("Orginal");

idx_4 = bwlabel(img,4);


subplot(1,3,2);
imshow(idx_4,[]);
title("Indexed(4)");

indx_8 = bwlabel(img,8);

subplot(1,3,3);
imshow(indx_8,[]);
title("Indexed (8)");
