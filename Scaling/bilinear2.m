

%%
clear;
im1=imread('lena.bmp');
im=im2double(im1);
imshow(im);
figure(1);


%Get orginal Image Size
xScale=2;
yScale=1;
[OrginaSizeY,OrginalSizeX]=size(im);
NewSizeY=floor(yScale*OrginaSizeY);
NewSizeX=floor(xScale*OrginalSizeX);



%Vreate new matrix of given size to keep grayscale info
NewImg=double(zeros(NewSizeY,NewSizeX));

%Find weighted average of 4 serounding pixle (Weight depends on distance from calucalted pixel) and save its value to new map

for x=(0:NewSizeX-1)
    for y=(0:NewSizeY-1)
       %Find top left pixel
        Ax=floor(x/xScale);
       Ay=floor(y/yScale);
      %Handle borders
       if(Ax==0)
           Ax=1;
       end
       if(Ay==0)
           Ay=1;
       end
       
       %Calculate postion of remaining 3 pixles
       Bx=Ax+1;
       By=Ay;
      
       Cx=Ax+1;
       Cy=Ay+1;
       
       Dy=Ay+1;
       Dx=Ax;
      %Calcualte propotion of distance between calualted pixel and
      %horizontal and vertiacla surrounding pixels
       i=x/xScale-Ax;
       j=y/yScale-Ay;
       
       %Save value of surounding pixels
       A=im(Ay,Ax);
       B=im(By,Bx);
       C=im(Cy,Cx);
       D=im(Dy,Dx);
       %Calculate weighted average
       NewImg(y+1,x+1)=[1-i i]*[A D;B C]*[1-j;j];
        
        
    end
    
end 
figure(2);
%Show scaled img
imshow((NewImg));