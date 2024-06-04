nom= "imagesTP/confiserie-smarties-lentilles_121-50838.jpg";
image_rgb=imread(nom);
figure();
imagesc(image_rgb);
title("image en rgb");
image_hsv = rgb2hsv(a);

figure();
imagesc(image_hsv);
title("image en hsv");


h = image_hsv(:,:,1); % Composante Hue
s = image_hsv(:,:,2); % Composante Saturation
v = image_hsv(:,:,3); % Composante Value

figure();
subplot(2,2,1);
imshow(image_hsv);
title("image originale");
subplot(2,2,2);
imshow(h);
title('Composante Hue');

subplot(2,2,3);
imshow(s);
title('Composante Saturation');

subplot(2,2,4);
imshow(v);
colormap(default);
title('Composante Value');
