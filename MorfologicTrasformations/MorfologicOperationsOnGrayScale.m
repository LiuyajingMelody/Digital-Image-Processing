close all;
clc;
clear;

img=imread('ferrari.bmp');
str=strel('square',3);
img_erode=imerode(img,str);

figure(1);

subplot(1,3,1);
imshow(img);
title('Orginal');

subplot(1,3,2);
imshow(img_erode);
title('Eroded');

img_dif=imabsdiff(img,img_erode);

subplot(1,3,3);
imshow(img_dif);
title('Diffrance');


figure(2);

img_dylate=imdilate(img,str);

subplot(1,3,1);
imshow(img);
title('Orginal');

subplot(1,3,2);
imshow(img_dylate);
title('Dylateted');

img_dif_2=imabsdiff(img,img_dylate);

subplot(1,3,3);
imshow(img_dif_2);
title('Diffrance');

figure(3);
subplot(1,2,1);
imshow(img_dif);
title('Erosion Diff');

subplot(1,2,2);
imshow(img_dif_2);
title('Dilatation Diff');
%%
%Open Close
img=imread('ferrari.bmp');
str=strel('square',3);

img_open=imopen(img,str);
img_close=imclose(img,str);

figure(4);
subplot(1,3,1);
imshow(img);
title('Orginal');


subplot(1,3,2);
imshow(img_open);
title('Open');


subplot(1,3,3);
imshow(img_close);
title('Close');

%%
%Top Bottom Hat

img=imread('ferrari.bmp');
str=strel('square',3);
img_top=imtophat(img,str);
img_bot=imbothat(img,str);

figure(5);
subplot(1,3,1);
imshow(img);
title('Orginal');


subplot(1,3,2);
imshow(img_top);
title('TopHat');


subplot(1,3,3);
imshow(img_bot);
title('BotHat');

%%
%Using TopHAt

img=imread('rice.png');
str=strel('disk',10);

img_top=imtophat(img,str);
figure(6);
subplot(1,2,1);
imshow(img);
title('Orginal');

subplot(1,2,2);
imshow(img_top);
title('TopHat');