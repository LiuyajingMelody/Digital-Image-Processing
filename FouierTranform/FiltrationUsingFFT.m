clc;
close all;
clear;

img=imread('lena.bmp');

q=3;
z=3;

figure;
subplot(q,z,1);
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
%%

[f1 f2]=freqspace(512,'meshgrid');

Hd=ones(512);
r=sqrt(f1.^2+f2.^2);
Hd(r>0.1)=0;


figure;

subplot(1,3,1);
imshow(img);



subplot(1,3,2);
imshow(Hd);


subplot(1,3,3);
imshow(ifft2(ifftshift(Hd.*img_f)),[]);

%%

h=fwind1(Hd,hanning(21));
[H,f1,f2] = freqz2(h,512,512);
figure;

%%

mask=fspecial('gaussian',[512,512]);
mask=mat2gray(mask);




mesh(f1,f2,H);
%%




