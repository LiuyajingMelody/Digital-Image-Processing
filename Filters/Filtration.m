close all;
clc;
clear;

img=imread('plansza.bmp');

X=3;
Y=1;
winSize=[3,5,6,15];

my_mask=[1,2,1;2,4,2;1,2,1;]
my_mask=my_mask/sum(my_mask);
for x=1:4
    figure(x);
    k=1;
    
    mask=fspecial('average',winSize(x));
    img_filtered=conv2(img,my_mask,'same');

    
    subplot(Y,X,k);
    imshow(img);
    title("Orginal");

    k=k+1;
    subplot(Y,X,k);
    imshow(uint8(img_filtered));
    title("Filtered ");
    k=k+1;
    
    subplot(Y,X,k);
    imshow(imabsdiff(img,uint8(img_filtered)));
    title("Diff");
    
    
end
    
    
%%
%Gausian Mask


mask_gaus=fspecial('gaussian',0.5);

mesh(mask_gaus);


