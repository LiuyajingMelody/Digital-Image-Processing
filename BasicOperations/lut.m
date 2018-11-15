
function lut(obraz,przekodowanie)

newImg=intlut(obraz,przekodowanie);

subplot(2,2,1:2);
imshow(newImg);
title("Wynik przekształcenia");

subplot(2,2,3);
plot(przekodowanie);
title("Funkacja przekształcenia");


subplot(2,2,4);
imshow(obraz);
title("Orginał");

end

