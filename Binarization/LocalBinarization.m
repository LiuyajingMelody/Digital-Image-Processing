close all;
clc;
clear;

img=imread('katalog.bmp');
[X, Y]=size(img);
img_bin=img;
figure(1);
imshow(img);
win_size=30;
for x=1:X
   for y=1:Y 
       treshold=meanLT(x,y,win_size,img,X,Y);
       if(img(x,y)>treshold)
           img_bin(x,y)=1;
       else
           img_bin(x,y)=0;
           
       end
       
   end
end

figure(2);
subplot(1,2,1);
imshow(img);
title("Orginal");
subplot(1,2,2);
imshow(boolean(img_bin));
title("Local Binzarization");

%%
window_size_2=30;
img_bin_2=img;
k=0.15;
R=128;
for x=1:X
   for y=1:Y 
       mean=meanLT(x,y,window_size_2,img,X,Y);
       
       deviation=stddevLT(x,y,window_size_2,img,mean,X,Y);      
     
       treshold=mean*(1+k*(deviation/R-1));
       if(img(x,y)>treshold)
           img_bin_2(x,y)=1;
       else
           img_bin_2(x,y)=0;
           
       end
   end
end

figure(3);
subplot(1,3,1);
imshow(img);
title("Orginal");
subplot(1,3,2);
imshow(boolean(img_bin));
title("Local Binzarization");
subplot(1,3,3);
imshow(boolean(img_bin));
title("Sauvol");


