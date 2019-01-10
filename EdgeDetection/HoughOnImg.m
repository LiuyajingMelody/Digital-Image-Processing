
clc;
close all;
clear;

%Preprocces real image before using Hough

img=imread('lab112.png');
img_og=imread('lab112.png');

img=im2bw(img,50/256);

figure;
imshow(img);


img(:,500:640)=1;

figure;
imshow(img)




img=edge(img,'canny',0.8);
figure;
imshow(img);

se = strel('line',3,0)
img=imdilate(img,se);
figure;
imshow(img);


%--------------------------Houg-----------------------------------
[H,T,R] = hough(img);
peaks = houghpeaks(H,10);

lines = houghlines(img,T,R,peaks,'FillGap',50,'MinLength',120);

figure;
imshow(img_og);
hold on;

max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
