clear;
clc;
close all;
img=imread('rice.png');

[H, v]=imhist(img);

figure(1);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
plot(v,H);

%Values fo fig1 fig2 ...
%80-80-135-200-60
treshold=50;
img_bin=im2bw(img,treshold/255);
[Hb , vb]=imhist(img_bin);

figure(2);
subplot(1,2,1);
imshow(img_bin);
subplot(1,2,2);
bar(vb,Hb);

%%
%Otsu
otsu_treshold=graythresh(img);

img_itsu_bin=im2bw(img,otsu_treshold);
figure(3);
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(img_itsu_bin);
%%
%ClusterKittler
close all;

figure(4);
kitller_treshold=clusterKittler(img);
yen_tresold=entropyYen(img);

img_kittler=im2bw(img,kitller_treshold/255);
img_yen=im2bw(img,yen_tresold/255);

subplot(2,3,1);
imshow(img);
title(["Orginal: ",num2str(treshold)]);

subplot(2,3,2);
plot(v,H);
title("Orginal Histogram");

subplot(2,3,3);
imshow(img_bin);
title(["My Treshold: ",num2str(80)]);

subplot(2,3,4);
imshow(img_itsu_bin);
title(["Itsu Treshold :", num2str(otsu_treshold*255)]);

subplot(2,3,5);
imshow(img_kittler);
title(["Kittler Treshold :", num2str(kitller_treshold)]);

subplot(2,3,6);
imshow(img_yen);
title(["Yen Treshold :",num2str(yen_tresold)]);
