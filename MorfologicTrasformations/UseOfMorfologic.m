close all;
clc;
clear;

img=imread('calculator.bmp');


mask=ones(1,71);

img_erod=imerode(img,mask);

img_rec=imreconstruct(img_erod,img);
img_open=imopen(img,mask);
imshow(img_rec);


figure(1);

subplot(2,2,1);
imshow(img);
title('Orginal');

subplot(2,2,2);
imshow(img_erod);
title('Erodeded');


subplot(2,2,3);
imshow(img_rec);
title('Reconstructed');


subplot(2,2,4);
imshow(img_open);
title('Opened');

%%

figure(2);

subplot(2,2,1);
imshow(img);
title('Orginal');


img_rec_diff=imabsdiff(img,img_rec);
subplot(2,2,2);
imshow(img_rec_diff);
title('TopHat though Reconstruction Diff');


subplot(2,2,3);
imshow(imabsdiff(img,img_open));
title('Open Diff');



subplot(2,2,4);
imshow(imtophat(img,mask));
title('Only TopHat');


%%
mask_2=ones(1,11);
img_rec_erode=imerode(img_rec_diff,mask_2);
img_rec_2=imreconstruct(img_rec_erode,img_rec_diff);
figure(3);

subplot(1,3,1);
imshow(img);
title('Orginal');

subplot(1,3,2);
imshow(img_rec_diff);
title('Removed Horizontal Reflections');


subplot(1,3,3);
imshow(img_rec_2);
title('Removed Veritacal Reflections');

%%
%Final polsih 

mask_3=ones(1,21);

img_final=img_rec_2;

img_final_dilate=imdilate(img_final,mask_3);
img_final_rec=imreconstruct(min(img_final_dilate,img_rec_diff),img_rec_diff);

figure(4);

subplot(2,2,1);
imshow(img);
title('Orginal');

subplot(2,2,2);
imshow(img_rec_diff);
title('Removed Horizontal Reflections');


subplot(2,2,3);
imshow(img_rec_2);
title('Removed Veritacal Reflections');



subplot(2,2,4);
imshow(img_final_rec);
title('Final Polish');

