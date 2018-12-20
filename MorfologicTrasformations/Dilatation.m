close all;
clc;
clear;
img=imread('kolka.bmp');

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
title('Erosion');

subplot(2,3,3);
imshow(img_dylate);
title('Dilatation');

subplot(2,3,4);
imshow(img_open);
title('Opening');

subplot(2,3,5);
imshow(img_close);
title('Closing');



%%

img_2=imread('ertka.bmp');
img_2_mod=img_2;

mask=strel('square',3);
img_2_mod=imerode(img_2_mod,mask);
img_2_mod=imdilate(img_2_mod,mask);
img_2_mod=imdilate(img_2_mod,mask);




figure(2);
subplot(1,2,1);
imshow(img_2);
title('Orginal');

subplot(1,2,2);
imshow(img_2_mod);
title('Rmoved holes and antenas by using dilatation and erosion');
%%
img_3=imread('hom.bmp');

SE1=[0 1 0;1 1 1; 0 1 0];
SE2=[1 0 1; 0 0 0; 1 0 1];

img_detect=bwhitmiss(img_3,SE1,SE2);

figure(3);
subplot(1,2,1);
imshow(img_3);
title('Orginal');

subplot(1,2,2);
imshow(img_detect);
title('Detection with HitMiss');



