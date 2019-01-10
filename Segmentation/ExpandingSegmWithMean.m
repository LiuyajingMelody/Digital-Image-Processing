clc;
close all;
clear;


knee=double(imread('knee.png'));

imshow(knee,[]);
title('Select segementation start point');
selected=floor(ginput(1));
selected=[selected(2),selected(1)];
%selected=[277,217];



[Y X]=size(knee);
visited=zeros(Y,X);
segmented=zeros(Y,X);


stacki=zeros(1000,2);
ptr=1;

visited(selected(1),selected(2))=1;


segmented(selected(1),selected(2))=1;
stacki(ptr,:)=[selected(1),selected(2)];

win_size=1;
treshold=30;

pixel_count=1;
current_sum=knee(selected(1),selected(2));

while(ptr>0)
   
   w_y=stacki(ptr,1);
   w_x=stacki(ptr,2);
   stacki(ptr,:)=[0,0];
   ptr=ptr-1;
   
   
   if(Y-win_size>w_y && w_y>win_size && win_size<w_x && w_x<X-win_size)
       center=knee(w_y,w_x);
       for y=(w_y-win_size):(w_y+win_size)
          for x=(w_x-win_size):(w_x+win_size)
              
            if(visited(y,x)==0)
                current=knee(y,x);
                if(abs(center-current_sum/pixel_count)<=treshold)
                    ptr=ptr+1;
                    stacki(ptr,:)=[y,x];
                    segmented(y,x)=1;
                    pixel_count=pixel_count+1;
                    current_sum=current_sum+current;
                    
                end
                visited(y,x)=1;
            end
    
          end
       end
       
       
       
   end
 
end

figure;
subplot(1,2,1);
imshow(knee,[]);
title('Orginal');

subplot(1,2,2);
imshow(segmented,[]);
title('Segemnted from selected point');