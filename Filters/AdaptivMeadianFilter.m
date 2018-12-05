close all;
clc;
clear;

img=imread('plytkaSzumImp.bmp');

img_med_filt=medfilt2(img,[7,7]);

img_adapt=double(img);

win_size=[1,2,3];

[Y,X]=size(img);

for x=4:(X-4)
   for y=4:(Y-4)
      sizi=1;
      
      window1=double((img(y-sizi:y+sizi,x-sizi:x+sizi)));
      window=window1(:);
      
      medi=median(window);
      maxi=max(window);
      mini=min(window);  
      z=double(img(y,x));  
      
      A1=medi-mini;
      A2=medi-maxi;
     
      while(not(A1>0 && A2<0) && sizi<4)
          
          window1=double(img(y-sizi:y+sizi,x-sizi:x+sizi));
          window=window1(:);
          
          medi=median(window);
          maxi=max(window);
          mini=min(window);  
          
          z=double(img(y,x));  

          A1=medi-mini;
          A2=medi-maxi;
          sizi=sizi+1;
          
          
      end
      if(sizi>3)
          
          img_adapt(y,x)=medi;
      
      else
        if((A1>0 && A2<0))
            B1=z-mini;
            B2=z-maxi;
            if(B1>0 && B2<0)
                img_adapt(y,x)=z;
            else
                img_adapt(y,x)=medi;
            end
        end
      end
      

        
         
    
   end
end






%%
subplot(1,3,1);
imshow(img);
title("Orginal");


subplot(1,3,2);
imshow(img_med_filt);
title("Median 7x7");


subplot(1,3,3);
imshow(img_adapt,[]);
title("Adaptive Median");
