clc;
clear;
close all;

img=imread('tekstReczny.png');
[X ,Y]=size(img);

img_bin=img;

N=20;

a=1/4;

hist=zeros(1,20);
my_mean=0;


for x=20:X
    for y=1:Y   
        my_mean=my_mean+(img(x,y)/N)-(hist(20)/N);
        
        hist=[img(x,y),hist(1:19)];
        
        tresholold=my_mean*a;
        
        if(img(x,y)>tresholold)
            img_bin(x,y)=1;
            
        else
            img_bin(x,y)=0;
        end
        
    end
end
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(boolean(img_bin));
