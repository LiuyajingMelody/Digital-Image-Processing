clc;
clear;
i=1;

figure(i);
x=2;
y=2;
z=1;
subplot(y,x,z);
lena_RGB=imread('jezioro.jpg');
imshow(lena_RGB);

z=z+1;
subplot(y,x,z);
lena_R=lena_RGB(:,:,1);
imshow(lena_R);
title("RED");

z=z+1;
subplot(y,x,z);
lena_G=lena_RGB(:,:,2);
imshow(lena_G);
title("GREEN");

z=z+1;
subplot(y,x,z);
lena_B=lena_RGB(:,:,3);
imshow(lena_B);
title("BLUE");


equ_R=histeq(lena_R,256);
equ_G=histeq(lena_G,256);
equ_B=histeq(lena_B,256);

lena_color_equ=lena_RGB;
lena_color_equ(:,:,1)=equ_R;
lena_color_equ(:,:,2)=equ_G;
lena_color_equ(:,:,3)=equ_B;

i=i+1;
figure(i);
subplot(1,2,1);
imshow(lena_RGB);
title("Orginal");

subplot(1,2,2);
imshow(lena_color_equ);
title("Every Color Equalized");



%%
lena_HSV=rgb2hsv(lena_RGB);
lena_HSV_V=lena_HSV(:,:,3);

equ_brightnes=histeq(lena_HSV_V);

lena_HSV_Equ=lena_HSV;
lena_HSV_Equ(:,:,3)=equ_brightnes;
imshow(lena_HSV_Equ);
