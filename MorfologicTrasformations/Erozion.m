close all;
clc;
clear;
img=imread('ertka.bmp');

figure(1);
subplot(1,3,1);
imshow(img);
title('Orginal Img');

str=strel('square',3);

img_erode=imerode(img,str);

subplot(1,3,2);
imshow(img_erode);
title('Eroded with Square');


img_erode_circle=imerode(img,strel('diamond',3));

subplot(1,3,3);
imshow(img_erode_circle);
title('Eroded wit diamond');
%%
figure(2);
subplot(2,2,1);
imshow(img);
title("Orginal");
img_erode_sqr=img;
for i=1:3

img_erode_sqr=imerode(img_erode_sqr,strel('square',3));
subplot(2,2,1+i);
imshow(img_erode_sqr);
title(['Eroded ',string(i),' times wit squere']);

    
    
    
end
%%


face=imread('buzka.bmp');

mask_1=[0,1;1,0];

face_cuted_1=imerode(face,mask_1);

figure(3);
subplot(1,3,1);
imshow(face);
title('Orginal');


subplot(1,3,2);
imshow(face_cuted_1);
title('Cuted with mask [0 1; 1 0 ]');

mask_2=[1,0;0,1];

face_cuted_2=imerode(face,mask_2);


subplot(1,3,3);
imshow(face_cuted_2);
title(['Cuted with mask [1 0; 0 1 ]']);




