clc;
close all;
clear;

bart=imread('bart.bmp');
imshow(bart);

[X,Y]=size(bart);

bart_bin=bart;

treshold_top=220;
treshold_bot=180;

for x=1:X
    for y=1:Y
        
        if(bart(x,y)<treshold_top && bart(x,y)>treshold_bot)
            bart_bin(x,y)=255;          
        else
            bart_bin(x,y)=0;
        
        end
    end
end        


bart_bin=boolean(bart_bin);

subplot(1,2,1);
imshow(bart);
title("Orginal Bart");

subplot(1,2,2);

imshow(bart_bin);
title("Daouble Tresh Bart");