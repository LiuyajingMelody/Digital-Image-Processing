clc;
clear;
img=imread('jet.bmp');
%Mean ov columns
vertical_mean=mean(img);
im_mean=round(mean(vertical_mean));

[orgina_hist, v]=imhist(img);

lower_hist=orgina_hist(1:im_mean-1);
upper_hist=orgina_hist(im_mean:end);

lower_hist_normalized=lower_hist/sum(lower_hist);
upper_hist_normalized=upper_hist/sum(upper_hist);

lower_cumm=cumsum(lower_hist_normalized);
upper_cumm=cumsum(upper_hist_normalized);

lower_lut=im_mean*lower_cumm;
upper_lut=im_mean+upper_cumm*(255-im_mean+1);

lut=uint8([lower_lut; upper_lut]);


img_BHE=intlut(img,lut);
subplot(1,2,1);
imshow(img);
title("Orginal");
subplot(1,2,2);
imshow(img_BHE);
title("BHE");

