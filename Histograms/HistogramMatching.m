clc;
clear;
i=1;
phobos=imread('phobos.bmp');
figure(i);
imshow(phobos);
title("Orginal");

i=i+1;
figure(i);
imshow(histeq(phobos));
title("Equalization");

load('histogramZadany.mat');
i=i+1;
figure(i);
imshow(histeq(phobos,histogramZadany));
title("Equalization to given histogram");

i=i+1;
figure(i);
imshow(imadjust(phobos));
title("Adjustmen");

i=i+1;
figure(i);
imshow(adapthisteq(phobos));
title("Adaptive Equalization");