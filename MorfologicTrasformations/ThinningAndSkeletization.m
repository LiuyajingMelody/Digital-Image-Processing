close all;
clc;
clear;

%Thinning

figure(1);
subplot(2,2,1);
img=imread('fingerprint.bmp');
imshow(img);
title('Orginal');

subplot(2,2,2);
img_mod=bwmorph(img,'thin',1);
imshow(img_mod);
title('Thined times=1');



subplot(2,2,3);
img_mod=bwmorph(img,'thin',2);
imshow(img_mod);
title('Thined times=2');



subplot(2,2,4);
img_mod=bwmorph(img,'thin',Inf);
imshow(img_mod);
title('Thined times=Inf');
%%
%Skeletization


img=imread('kosc.bmp');

figure(2);
subplot(1,2,1);
imshow(img);
title('Orginal');

img_mod=bwmorph(img,'skel',Inf);

subplot(1,2,2)
imshow(img_mod);
title('Skeletonization Inf time');
