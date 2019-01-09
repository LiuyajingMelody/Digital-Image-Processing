clc;
close all;
clear;
%Show use of Hough on prepeard image

figure(1);
subplot(1,2,1);
img=imread('kwadraty.png');
imshow(img);
title('Orginal');

subplot(1,2,2);
img_log=edge(img,'log');
imshow(img_log);
title('Edges');
%%


[H,T,R] = hough(img_log);
peaks = houghpeaks(H,8);

figure(3);
imshow(H,[]);
hold on;
plot(peaks(:,2),peaks(:,1),'o');


lines = houghlines(img_log,T,R,peaks,'FillGap',5,'MinLength',7);


%%



figure, imshow(img), hold on
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

%%




