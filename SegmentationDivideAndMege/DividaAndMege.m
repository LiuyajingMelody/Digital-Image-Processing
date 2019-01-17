clc;
clear;
close all;

img=imread('umbrealla.png');

img_hsv=rgb2hsv(img);

img_h=img_hsv(:,:,1);
img_h=double(img_h);



    global maxStd;
    global minSegSize;
    global Seg;
    global index;
    global mRes;

maxStd=0.05;
minSegSize=3;
index=1;
[Y X]=size(img);
mRes=zeros(Y,X);
 
spliter(img_h,1,256,1,256);
subplot(1,2,1);
imshow(img,[]);
title('Orginal');

%Merge simillar segments    
i=1;
merged=0;
while i<index
    IB=Seg==i; 
    flag=0;
    if sum(sum(IB)) >0   
        [yF,xF]=find(IB,1,'first');
        mask=strel('square',3);
        cutted_dilate=imdilate(IB,mask);
               
        dif=cutted_dilate-IB;       
        neigbours=Seg.*dif;
        
        nz=nonzeros(neigbours);
        uniq=unique(nz);
        
        for z=1:size(uniq)
            IBS=Seg==uniq(z);
            [yN,xN]=find(IBS,1,'first');
            if abs(mRes(yF,xF)-mRes(yN,xN))<5/255
                Seg(IBS)=i;
                flag=1;
            end
        end
    
        if flag==0
           i=i+1; 
        end
    else
        i=i+1;
    end
end

%Remove small segemnts

uniqal = unique(Seg);
min_size = 100;
for i = 1:size(uniqal(:))
    checked_are = Seg == uniqal(i);
    numb_of_tiles = sum(sum(checked_are(:)));
    if numb_of_tiles < min_size
       Seg(checked_are) = 0; 
    end
    
end

uniqal = unique(Seg);

%Remap segmentation numbers to one after another
for i = 1:size(uniqal(:))
    checked_are = Seg == uniqal(i);
    Seg(checked_are) = i;    
end
subplot(1,2,2);
imshow(label2rgb(Seg));
title('Segmented');