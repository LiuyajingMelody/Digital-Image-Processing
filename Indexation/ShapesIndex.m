clearvars;
clc;
close all;


img = imread('shapes.png');

figure;
imshow(img,[]);
title("Orginal");
idx_4 = bwlabel(img,4);


figure;
imshow(idx_4);
title("After Matlab Indexation");
shape_index_values = obliczWspolczynniki(idx_4);

[Y, X] = size(idx_4);

r=regionprops(shape_index_values,'Centroid');
for i=1:length(r)
   text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]); 
    
end


for y = 1:Y
   for x = 1:X
       pixel = idx_4(y,x);
       if (pixel ~= 0 && ~(shape_index_values(pixel,2) > 0.33 && shape_index_values(pixel,2) < 0.66))
            idx_4(y,x) = 0;
       end
   end
end

figure;
imshow(idx_4);
title("After removing squares");

%%
close all;
figure;
real_img = imread('shapesReal.png');
imshow(real_img);
title("Real Orginal");

figure;
real_bw=im2bw(real_img,0.23);
imshow(real_bw);
title("Bin Img");

figure;
real_cmp=imcomplement(real_bw);
imshow(real_cmp);
title("Competed");

mask=strel('rectangle',[5,5])
real_erod = imerode(real_cmp,mask);
figure;
imshow(real_erod);
title("After Erosion");

idx_4 = bwlabel(real_erod,4);

figure;
imshow(idx_4,[]);
title("After Indexation");

shape_index_values = obliczWspolczynniki(idx_4);

[Y, X] = size(idx_4);

for y = 1:Y
   for x = 1:X
       pixel = idx_4(y,x);
       if (pixel ~= 0 && (shape_index_values(pixel,1) < 0.75) && ~(shape_index_values(pixel,2) <0.00001))
            idx_4(y,x) = 0;
       end
   end
end

figure;
imshow(idx_4);
