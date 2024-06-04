nom= "imagesTP/CerisierP.jpg";
a=imread(nom);
figure();
imagesc(a);

image = rgb2hsv(a);

figure();
imagesc(image);
