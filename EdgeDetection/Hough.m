clc;
close all;
clear;

img_z=zeros(11,11);

img_z(3,3)=1;
img_z(4,4)=1;
img_z(7,7)=1;


figure(1);
subplot(1,2,1);
imshow(img_z);
title('Orginal');
subplot(1,2,2);
[H,T,R] = hough(img_z,'RhoResolution',0.1,'ThetaResolution',0.5);
imshow(H,[]);
title('Img in Hough space');

%Values found on plot 
%91 143


o=T(91);
p=R(143);


v_x = 0:0.1:10;
v_y =(p-v_x*cosd(o))/sind(o);

figure(2);
imshow(img_z);
hold on;
plot(v_x+1,v_y+1)
title('Points with Hough Representation on Top');





