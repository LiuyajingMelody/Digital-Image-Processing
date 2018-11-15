clear;
clc;
%Some basic lut functions

load funkcjeLUT.mat;
figure(1);
plot(kwadratowa);
%%
figure(2);
plot(odwlog);
%%
figure(3);
plot(pila);
%%

lena=imread('lena.bmp');
imshow(lena);
%%

lut(lena,log);


%%
figure(4);
lut(lena,kwadratowa);


figure(5);
lut(lena,log);

figure(6);
lut(lena,odwlog);

figure(7);
lut(lena,odwrotna);

figure(8);
lut(lena,pierwiastkowa);

figure(9);
lut(lena,pila);

figure(10);
lut(lena,wykladnicza);


