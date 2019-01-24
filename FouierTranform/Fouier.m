clc;
close all;
clear;
q=3;
z=3;

figure;
subplot(q,z,1);
img=imread('trojkat.bmp');
imshow(img,[]);
title("Orginal");

img_f=fft2(img);
img_f=fftshift(img_f);
subplot(q,z,2);
imshow(img_f);
title("After fft2");

A=abs(img_f);
a=angle(img_f);

A_log=log10(A+1);

a_f=angle(img_f.*(A_log>0.0001));

subplot(q,z,3);
imshow(A_log,[]);
title("log(Ampitude)");



subplot(q,z,4);
imshow(a_f,[]);
title("Phaze");

subplot(q,z,5);
imshow(ifft2(ifftshift(img_f)));
title("Back to img");
