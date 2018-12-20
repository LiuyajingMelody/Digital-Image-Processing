close all;
clc;
clear;

img=imread('text.bmp');
;
SE=ones(51,1);

img_detect=imopen(img,SE);

img_rec=imreconstruct(img_detect,img);










figure(1);
subplot(2,2,1);
imshow(img);
title('Orginal');

subplot(2,2,2);
imshow(img_detect);
title('Detection using opening');

subplot(2,2,3);
imshow(img_rec);
title('Reconstructed using imrec with img as mask');

%%
%Img filling

img_fill=imfill(img,'holes');


figure(2);
subplot(1,2,1);
imshow(img);
title('Orginal');



subplot(1,2,2);
imshow(img_fill);
title('Filled using holes filling');



