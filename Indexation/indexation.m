close all;
clear;
clc;


img=imread('ccl1.png');

[Y, X]=size(img);
img_c=img;

L=1;

for y=2:Y-1
    
    for x=2:(X-1)
        if img_c(y,x)~=0
      
         neigbhours=[img_c(y-1,x-1),img_c(y-1,x),img_c(y-1,x+1),img_c(y,x-1)];
         if sum(neigbhours)==0
              img_c(y,x)=L;
              L=L+1;
         else
             nz=nonzeros(neigbhours);
             mini=min(nz);
             maxi=max(nz);
             
             if mini==maxi
                img_c(y,x)=mini; 
             else    
                 img_c(y,x)=mini;
             end
         end
         
         
        end
    end
    
end
figure;
subplot(2,1,1);
imshow(img);
title("Orginal");

subplot(2,1,2);
imshow(img_c,[]);
title("After Indexation");
