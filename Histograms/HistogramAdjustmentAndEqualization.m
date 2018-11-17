clc;
clear;
%Show same image with diffrently placed hisogram
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
 

%Show diffrence of orginal image and image with adjusted histogram
y=2;
x=2;
figure(2);
subplot(y,x,1);
hist_1=imread('hist1.bmp');
imshow(hist_1);
title("Orginal Image");
subplot(y,x,2);
imhist(hist_1);
title("Orginal Histogram");

subplot(y,x,3);
im_adjusted=imadjust(hist_1);
imshow(im_adjusted);
title("Adjusted Image");
subplot(y,x,4);
imhist(im_adjusted);
title("Adjusted Histogram");
%%
%Show accumulated histogram shape on histogram
[H,v]=imhist(hist_1,256);
cumulatedH=cumsum(H);

maxH=max(H);
maxK=max(cumulatedH);

cumumlatedScaled=cumulatedH*maxH/maxK;
figure(3);
hold on;
plot(v,H);

plot(v,cumumlatedScaled);
title("Accumulated Histogram on Histogram plot (Orginal Image)"); 
%%
%%Show accumulated histogram shape of adjusted histogram one on another
figure(4);
[H,v]=imhist(im_adjusted,256);
cumulatedH=cumsum(H);
maxH=max(H);
maxK=max(cumulatedH);
cumumlatedScaled=cumulatedH*maxH/maxK;
hold on;
plot(v,H);
plot(v,cumumlatedScaled);
title("Accumulated Histogram on Histogram plot (Adjusted Image)"); 
%%
[H,v]=imhist(hist_1,256);
cumulatedH=cumsum(H);

maxH=max(H);
maxK=max(cumulatedH);

grayScale=256;
equalizedHistogramLUT=uint8(round((cumulatedH)/maxK*grayScale));
equaHist=diff(equalizedHistogramLUT);

figure(5);
plot(v,equalizedHistogramLUT);
title("Equalization LUT function plot ");

%%
figure(6);
subplot(4,2,1);
imshow(hist_1);
title("Orginal Image");
subplot(4,2,2);


[OH,Ov]=imhist(hist_1);
cummulatedOrginalH=cumsum(OH);
cummulatedOrginalHScaled=cummulatedOrginalH*max(OH)/max(cummulatedOrginalH);


hold on;
plot(Ov,OH);
plot(Ov,cummulatedOrginalHScaled);
title("Orginal Hist + Accumulated Hist");

equalizedIm=intlut(hist_1,equalizedHistogramLUT);
[H,v]=imhist(equalizedIm,256);
subplot(4,2,3);
imshow(equalizedIm);
title("Image after Equlization");
cummulatedHist=cumsum(H);
maxCum=max(cummulatedHist);
maxHist=max(H);
cummulatedHistScaled=cummulatedHist*maxHist/maxCum;
subplot(4,2,4);
hold on;
plot(v,H);
plot(v,cummulatedHistScaled);
title("Hist and Accumulated Hist after Aqualization");


imMatLabEqulized=histeq(hist_1,256);
imMatLabAdaptiveEqualized=adapthisteq(hist_1);


[HME,v]=imhist(imMatLabEqulized);
[HMAE,v]=imhist(imMatLabAdaptiveEqualized);

subplot(4,2,5);
imshow(imMatLabEqulized);
subplot(4,2,6);
plot(v,HME);

subplot(4,2,7);
imshow(imMatLabAdaptiveEqualized);
subplot(4,2,8);
plot(v,HMAE);
%%
%Matlab histeq



