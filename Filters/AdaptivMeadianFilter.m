close all;
clc;
clear;

img=imread('plytkaSzumImp.bmp');

img_med_filt=medfilt2(img,[7,7]);

img_adapt=img;

win_size=[1,2,3];

[X,Y]=size(img);

for x=4:(X-4)
   for y=4:(Y-4)
      win=1;
      
      sizi=win_size(win);
      
      window1=double((img(x-sizi:x+sizi,y-sizi:y+sizi)));
      window=window1(:);
      medi=median(window);
      maxi=max(window);
      mini=min(window);  
      z=img(x,y);  
      A1=medi-mini;
      A2=medi-maxi;
      
      while((A1<=0 || A2>=0) && win<3)
          win=win+1;
          size=win_size(win);
          window1=double(img(x-sizi:x+sizi,y-sizi:y+sizi));
          window=window1(:);
          medi=median(window);
          maxi=max(window);
          mini=min(window);  
          z=img(x,y);  

          A1=medi-mini;
          A2=medi-maxi;
         
      end
      
      if((A1>0 && A2<0))     
        B1=z-mini;
        B2=z-maxi;
        if(B1>0 && B2<0)
            img_adapt(x,y)=z;
        else
            img_adapt(x,y)=medi;
        end
      else
        img_adapt(x,y)=medi;
   
        
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
imshow(uint8(img_adapt),[]);
title("Adaptive Median");
