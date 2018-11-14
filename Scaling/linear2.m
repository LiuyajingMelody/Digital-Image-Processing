

%%
clear;
im=imread('lena.bmp');
imshow(im);
figure(1);


%Get orginal Image Size
xScale=1;
yScale=2;
[OrginaSizeY,OrginalSizeX]=size(im);
NewSizeY=floor(yScale*OrginaSizeY);
NewSizeX=floor(xScale*OrginalSizeX);



%Vreate new matrix of given size to keep grayscale info
NewImg=uint8(zeros(NewSizeY,NewSizeX));

%Find geometricaly closest matching pixel and save its value to new map

for x=(0:NewSizeX-1)
    for y=(0:NewSizeY-1)
       Cx=round(x/xScale)+1;
       Cy=round(y/yScale)+1;
       
       if(Cx>OrginalSizeX)
           Cx=OrginalSizeX;
       end
       if(Cy>OrginaSizeY)
          Cy=OrginaSizeY; 
       end
       NewImg(y+1,x+1)=im(Cy,Cx);
        
        
    end
    
end 
figure(2);
%Show scaled img
imshow(NewImg);

%%
figure(3);

