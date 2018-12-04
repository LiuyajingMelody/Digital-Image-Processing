clc;
close all;
clear;

img=imread('lenaSzum.bmp');
figure(1);
subplot(1,3,1);
imshow(img);
title("orginal");

subplot(1,3,2);
imshow(medfilt2(img));
title("orginal");

subplot(1,3,3);
imshow(imabsdiff(img,medfilt2(img)));
title("orginal");

%%

img_2=imread('lena.bmp');
mask=fspecial('average',3);
img_filtered_med=medfilt2(img_2);
img_filtered=conv2(img_filtered_med,mask,'same');

figure(2);
subplot(1,3,1);
imshow(img_2);
title("Orginal");

subplot(1,3,2);
imshow(uint8(img_filtered));
title("Filterd med+avrg");

subplot(1,3,3);
imshow(imabsdiff(img_2, uint8(img_filtered)));
title("Diff");

%%

img_3=imread('lena.bmp');
img_filtered=img_3;
for z=1:10
    img_filtered=medfilt2(img_filtered,[5,5]);
end

figure(3);
subplot(1,3,1);
imshow(img_3);
title("Orginal");

subplot(1,3,2);
imshow(img_filtered);
title("Filterd 10 times");

subplot(1,3,3);
imshow(imabsdiff(img_3, img_filtered));
title("Diff");
