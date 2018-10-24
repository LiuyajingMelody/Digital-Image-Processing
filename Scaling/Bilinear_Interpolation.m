

%%
clear;
image=imread('lena.bmp');
imshow(image);
figure(1);
%Get Color Map from Image
[X,ColoMap]=gray2ind(image,256);

%Get orginal Image Size
[OrginaSizeX,OrginalSizeY]=size(image);
NewSizeX=30;
NewSizeY=30;

%Calculate X/Y size of new img
XRatio=OrginaSizeX/NewSizeX;
YRatio=OrginalSizeY/NewSizeY;

%Vreate new matrix of given size to keep grayscale info
NewImg=zeros(NewSizeX,NewSizeY);

%Find geometricaly closest matching pixel and save its value to new map

for x=(1:NewSizeX)
    for y=(1:NewSizeY)
       
       %Calculate locations of seraunding pixels 
       Cx1=floor(x*XRatio);     %X value of pixels in first column
       Cx2=floor(x*XRatio)+1;   %X value of pixels in 2nd column
       
       %Same of raws
       Cy1=floor(y*YRatio);         
       Cy2=floor(y*YRatio)+1;
       
       
       %Handle border interpolation 
       if Cx1==0
           Cx1=1;
       end
       if  Cx1==OrginaSizeX
           Cx2=Cx1;
           Cx1=OrginaSizeX-1;
       end
       
       if Cy1==0
           Cy1=1;
       end
       
       if Cy1==OrginalSizeY
           Cy2=Cy1;
           Cy1=OrginalSizeY-1;
       end
       %Calulate value above and under pixel 
       Horizontal_1=(x*XRatio-Cx1)*X(Cx1,Cy2)+(Cx2-x*XRatio)*X(Cx1,Cy2);
       Horizontal_2=(x*XRatio-Cx1)*X(Cx1,Cy1)+(Cx2-x*XRatio)*X(Cx1,Cy1);
       
       
       %Calculate Value between above and under to get searched pixel color
       %scale
       Final=(y*YRatio-Cy1)*Horizontal_1+(Cy2-y*YRatio)*Horizontal_2;
      
       %Append Calualted Value to map
       NewImg(x,y)=Final;
        
        
    end
    
end 
figure(2);
%Show scaled img
imshow(NewImg,ColoMap);