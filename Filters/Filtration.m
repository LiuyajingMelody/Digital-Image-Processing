close all;
clc;
clear;

img=imread('plansza.bmp');

X=3;
Y=1;



my_mask=[1,2,1;2,4,2;1,2,1;]
my_mask=my_mask/sum(my_mask);

winSize=[3,5,9,15,35];

for x=1:5
    figure(x);
    k=1;
    
    mask=fspecial('average',winSize(x));
    %Change mask here mask/my_mask
    img_filtered=conv2(img,my_mask,'same');

    
    subplot(Y,X,k);
    imshow(img);
    title("Orginal");

    k=k+1;
    subplot(Y,X,k);
    imshow(uint8(img_filtered));
    title(["Filtered with widow",winSize(x),"x",winSize(x)]);
    k=k+1;
    
    subplot(Y,X,k);
    imshow(imabsdiff(img,uint8(img_filtered)));
    title("Diff");
    
    
end
    
    
%%
%Gausian Mask



mask_gaus=fspecial('gaussian',5,0.5);
%mesh(mask_gaus);
img_gaus_half=conv2(img,mask_gaus,'same');

mask_gaus=fspecial('gaussian',5,1);
%mesh(mask_gaus);
img_gaus_one=conv2(img,mask_gaus,'same');

mask_gaus=fspecial('gaussian',5,0.1);
%mesh(mask_gaus);
img_gaus_two=conv2(img,mask_gaus,'same');





subplot(2,2,1);
imshow(img);
title("orginal");

subplot(2,2,2);
imshow(img_gaus_half);
title("Gause 1/2");

subplot(2,2,3);
imshow(img_gaus_one);
title("Gaus 1");

subplot(2,2,4);
imshow(img_gaus_two);
title("Gaus 1/10");
