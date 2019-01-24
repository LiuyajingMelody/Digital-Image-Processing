close all;
clear;
clc;


img=imread('ccl1.png');

[Y, X]=size(img);
img_c=img;

L=1;

id=1:100;


for y=2:Y
    
    for x=2:(X-1)
        if img_c(y,x)~=0
      
         neigbhours=[img_c(y-1,x-1),img_c(y-1,x),img_c(y-1,x+1),img_c(y,x-1)];
         
           nz=nonzeros(neigbhours);
           mini=min(nz);
           maxi=max(nz);
         
         if sum(neigbhours)==0
              img_c(y,x)=L;
              L=L+1;
         elseif mini==maxi
                img_c(y,x)=mini; 
         elseif   mini~=maxi 
                 img_c(y,x)=mini;
                 
                 id=index_union(maxi,mini,id);
                 
            
         end
         
         
        end
    end
    
end

lut=1:100;
figure;
imshow(img_c,[]);
for i=1:100
    lut(i)=index_root(i,id);
end
    


for y=2:Y
 
    for x=2:(X-1)
        if img_c(y,x)>0
            value=img_c(y,x);
            img_c(y,x)=lut(value);
        end
        
    end
end


figure;
subplot(2,1,1);
imshow(img);
title("Orginal");


subplot(2,1,2);
imshow(img_c,[]);
title("After Indexation with Solving");
