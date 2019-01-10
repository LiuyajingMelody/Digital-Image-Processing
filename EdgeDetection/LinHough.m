clc;
close all;
clear;

img_z=zeros(11,11);

img_z(3,3)=1;
img_z(4,4)=1;
img_z(7,7)=1;


figure(1);
subplot(1,2,1);
imshow(img_z);
title('Orginal');
subplot(1,2,2);
H = toHough(img_z,-100,100,1,-100,100,1);
imshow(H,[]);
title('Img in Hough space');


