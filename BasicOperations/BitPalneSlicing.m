clc;
clear;

polishDollarC=imread('100zloty.jpg');
polishDollar=rgb2gray(polishDollarC);
imshow(polishDollar);
A=3;
B=4;

subplot(A,B,1);
imshow(polishDollar)
title("Orginal");


subplot(A,B,2);
slice_1=bitget(polishDollar,1);
imshow(boolean(slice_1));
title("Slice 1");

slice_2=bitget(polishDollar,2);
subplot(A,B,3);
imshow(boolean(slice_2));
title("Slice 1");

slice_3=bitget(polishDollar,3);
subplot(A,B,4);
imshow(boolean(slice_3));
title("Slice 3");

slice_4=bitget(polishDollar,4);
subplot(A,B,5);
imshow(boolean(slice_4));
title("Slice 4");

slice_5=bitget(polishDollar,5);
subplot(A,B,6);
imshow(boolean(slice_5));
title("Slice 5");

slice_6=bitget(polishDollar,6);
subplot(A,B,7);
imshow(boolean(slice_6));
title("Slice 6");

slice_7=bitget(polishDollar,7);
subplot(A,B,8);
imshow(boolean(slice_7));
title("Slice 7");

slice_8=bitget(polishDollar,8);
subplot(A,B,9);
imshow(boolean(slice_8));
title("Slice 8");


%%
Y=3;
Z=3;

figure(2);
subplot(Y,Z,1);
imshow(polishDollar);
title("Orgianl");

subplot(Y,Z,2);
imshow(slice_8*256+slice_7*128);
title("S8*128+S7*64");

subplot(Y,Z,3);
imshow(slice_8+slice_7);
title("S8+S7");

subplot(Y,Z,4);
imshow(slice_8*128+slice_7*64+slice_6*32+slice_5*16+slice_4*8+slice_3*4+slice_2*2+slice_1);
title("S8*128+S7*64+S6*32*.....");


