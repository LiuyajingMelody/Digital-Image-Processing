function ShowDiffrentMethods(image,figureNumber)
%SHOWDIFFRENTMETHODS Summary of this function goes here
im_1=image;
x=4;
y=2;
i=1;
%Image 1
figure(figureNumber);
subplot(y,x,i);
imshow(im_1);
title("ORGINAL");

adjusted=imadjust(im_1);
i=i+1;
subplot(y,x,i);
imshow(adjusted);
title("ADJUSTMENT");

equalized=histeq(im_1);
i=i+1;
subplot(y,x,i);
imshow(equalized);
title("EQUALIAZTION");


adapted=adapthisteq(im_1);
i=i+1;
subplot(y,x,i);
imshow(adapted);
title("CLAHE");

%Plots
%Plot 1
i=i+1;
[H,v]=imhist(im_1);
cH=cumsum(H);
maxC=max(cH);
maxH=max(H);
scaledCH=cH/maxC*maxH;

subplot(y,x,i);
hold on;
plot(v,H);
plot(v,scaledCH);


%Plot 2
i=i+1;
[H,v]=imhist(adjusted);
cH=cumsum(H);
maxC=max(cH);
maxH=max(H);
scaledCH=cH/maxC*maxH;

subplot(y,x,i);
hold on;
plot(v,H);
plot(v,scaledCH);


%Plot 3
i=i+1;
[H,v]=imhist(equalized);
cH=cumsum(H);
maxC=max(cH);
maxH=max(H);
scaledCH=cH/maxC*maxH;

subplot(y,x,i);
hold on;
plot(v,H);
plot(v,scaledCH);


%Plot 4
i=i+1;
[H,v]=imhist(adapted);
cH=cumsum(H);
maxC=max(cH);
maxH=max(H);
scaledCH=cH/maxC*maxH;

subplot(y,x,i);
hold on;
plot(v,H);
plot(v,scaledCH);

end

