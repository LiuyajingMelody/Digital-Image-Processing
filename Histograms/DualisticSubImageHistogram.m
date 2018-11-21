clc;
clear;
img=imread('jet.bmp');

[orgina_hist, v]=imhist(img);

orginal_cum=cumsum(orgina_hist);
[SizeX, SizeY]=size(img);

[Value, Index]=min(abs(orginal_cum-(SizeX*SizeY)/2));


lower_hist=orgina_hist(1:Index-1);
upper_hist=orgina_hist(Index:end);

lower_hist_normalized=lower_hist/sum(lower_hist);
upper_hist_normalized=upper_hist/sum(upper_hist);

lower_cumm=cumsum(lower_hist_normalized);
upper_cumm=cumsum(upper_hist_normalized);

lower_lut=Index*lower_cumm;
upper_lut=Index+upper_cumm*(255-Index+1);

lut=uint8([lower_lut; upper_lut]);

figure(2);
img_BHE=intlut(img,lut);
subplot(1,2,1);
imshow(img);
title("Orginal");
subplot(1,2,2);
imshow(img_BHE);
title("dsihe");
