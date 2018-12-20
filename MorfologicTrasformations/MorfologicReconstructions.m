close all;
clc;
clear;

img=imread('text.bmp');
;
SE=ones(51,1);

img_detect=imopen(img,SE);

img_rec=imreconstruct(img_detect,img);

img_clean=imclearborder(img_rec);








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


subplot(2,2,4);
imshow(img_clean);
title('Cleaned');


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


%%
%Boreder cleaning

img=imread('text.bmp');
img_clear=imclearborder(img);
figure(3);
subplot(1,2,1);
imshow(img);
title('Orginal');


subplot(1,2,2);
imshow(img_clear);
title('Cleaned Borders');




