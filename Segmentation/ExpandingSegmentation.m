clc;
close all;
clear;


knee=double(imread('knee.png'));

imshow(knee,[]);
selected=ginput(1);
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
treshold=4;


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
                if(abs(center-current)<=treshold)
                    ptr=ptr+1;
                    stacki(ptr,:)=[y,x];
                    segmented(y,x)=1;
                
                end
                visited(y,x)=1;
            end
    
          end
       end
       
       
       
   end
 
end

imshow(segmented,[]);