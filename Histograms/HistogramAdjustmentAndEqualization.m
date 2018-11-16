clc;
clear;

im_1=imread('lena1.bmp');
im_2=imread('lena2.bmp');
im_3=imread('lena3.bmp');
im_4=imread('lena4.bmp');

y=4;
x=2;
grayScale=256;

subplot(y,x,1);
imshow(im_1);
subplot(y,x,2);
imhist(im_1,grayScale)

subplot(y,x,3);
imshow(im_2);
subplot(y,x,4);
imhist(im_2,grayScale)


subplot(y,x,5);
imshow(im_3);
subplot(y,x,6);
imhist(im_3,grayScale);

subplot(y,x,7);
imshow(im_4);
subplot(y,x,8);
imhist(im_4,grayScale)

y=2;
x=2;
figure(2);
subplot(y,x,1);
hist_1=imread('hist1.bmp');
imshow(hist_1);
subplot(y,x,2);
imhist(hist_1);

subplot(y,x,3);
im_adjusted=imadjust(hist_1);
imshow(im_adjusted);
subplot(y,x,4);
imhist(im_adjusted);
%%
[H,v]=imhist(hist_1,256);
cumulatedH=cumsum(H);

maxH=max(H);
maxK=max(cumulatedH);

cumumlatedScaled=cumulatedH*maxH/maxK;
figure(3);
hold on;
plot(v,H);

plot(v,cumumlatedScaled);
%%
figure(4);
[H,v]=imhist(im_justed,256);
cumulatedH=cumsum(H);
maxH=max(H);
maxK=max(cumulatedH);
cumumlatedScaled=cumulatedH*maxH/maxK;
hold on;
plot(v,H);
plot(v,cumumlatedScaled);
%%
[H,v]=imhist(hist_1,256);
cumulatedH=cumsum(H);

maxH=max(H);
maxK=max(cumulatedH);


grayScale=256;
equalizedHistogram=uint8(round(cumulatedH/maxK*grayScale));

plot(v,equalizedHistogram);


equlizedim=intlut(hist_1,equalizedHistogram);
imshow(equlizedim);
