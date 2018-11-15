clear;
clc;
circl=imread('kolo.bmp');
square=imread('kwadrat.bmp');
%%
imshow(circl);
%%
imshow(square);
%%
circleB=boolean(circl);
squareB=boolean(square);
%%
A=3;
B=3;

subplot(A,B,1);

imshow(circleB)
title("Orginal circle");

subplot(A,B,2);
imshow(squareB);
title("Orginal square");

subplot(A,B,3);
imshow(~circleB);
title("Not(Circle)");

subplot(A,B,4);
imshow(~squareB);
title("Not(Squere)");


subplot(A,B,5);
imshow(circleB & squareB);
title("Circle & Square)");

subplot(A,B,6);
imshow(circleB | squareB);
title("Circle | Square");

subplot(A,B,7);
imshow(xor(circleB,squareB));
title("Circle xor Square");
