close all;
clc;
clear;

img=imread('kw.bmp');
load maskiPP.mat;

figure(1);
X=3;
Y=2;
subplot(Y,X,1);
imshow(img,[]);
title("Orginal");

img_cov=conv2(img,R1,'same');

subplot(Y,X,2);
imshow(abs(img_cov),[]);
title("Roberts 1 Abs");

subplot(Y,X,3);
imshow((int8(img_cov)+128),[]);
title("Roberts 1 Scale");


img_cov=conv2(img,R2,'same');

subplot(Y,X,4);
imshow(abs(img_cov),[]);
title("Roberts 2 Abs");

subplot(Y,X,5);
imshow(int8((img_cov)+128),[]);
title("Roberts 2 Scale");

%%

figure(2);
X=3;
Y=2;
subplot(Y,X,1);
imshow(img,[]);
title("Orginal");

img_cov=conv2(img,P1,'same');

subplot(Y,X,2);
imshow(abs(img_cov),[]);
title("Prewitt 1 Abs");

subplot(Y,X,3);
imshow((int8(img_cov)+128),[]);
title("Prewitt 1 Scale");


img_cov=conv2(img,P2,'same');

subplot(Y,X,4);
imshow(abs(img_cov),[]);
title("Prewitt 2 Abs");

subplot(Y,X,5);
imshow((int8(img_cov)+128),[]);
title("Prewitt 2 Scale");

%%
figure(3)
X=3;
Y=2;
subplot(Y,X,1);
imshow(img,[]);
title("Orginal");

img_cov=conv2(img,S1,'same');

subplot(Y,X,2);
imshow(abs(img_cov),[]);
title("Sobel 1 Abs");

subplot(Y,X,3);
imshow((int8(img_cov)+128),[]);
title("Sobel 1 Scale");


img_cov2=conv2(img,S2,'same');

subplot(Y,X,4);
imshow(abs(img_cov2),[]);
title("Sobel 2 Abs");

subplot(Y,X,5);
imshow((int8(img_cov2)+128),[]);
title("Sobel 2 Scale");

%%
