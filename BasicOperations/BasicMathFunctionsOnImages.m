clear;
clc;
lena=imread('lena.bmp');
jet=imread('jet.bmp');

lenojet=imadd(lena,jet);
imshow(lenojet);


figure(1);
lenojet=imadd(lena,jet,'uint16');
imshow(lenojet,[]);

%%
lenojet2=imlincomb(2,lena,1,jet,'uint16');
imshow(lenojet2,[]);

%%

lena16=int16(lena);
jet16=int16(jet);
lenoNoJet=imsubtract(lena16,jet16);

imshow(lenoNoJet,[]);
%%
lenoJetAbs=imabsdiff(lena,jet);
imshow(lenoJetAbs);
%%
figure(2);
Im=immultiply(lena16,jet16);
imshow(Im,[]);
%%
Im=immultiply(lena,0.5);
imshow(Im);
%%
kolo=imread('kolo.bmp' );
imshow(kolo);
%%
maska=boolean(kolo);
Im=immultiply(lena,maska);
imshow(Im);
%%
negatyw=imcomplement(lena);
imshow(negatyw);

%%


