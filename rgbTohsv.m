clear all; close all;

nom= "imagesTP/confiserie-smarties-lentilles_121-50838.jpg";
image_rgb=imread(nom);
figure();
imagesc(image_rgb);
title("image en rgb");
image_hsv = rgb2hsv(image_rgb);

figure();
imagesc(image_hsv);
title("image en hsv");


h = image_hsv(:,:,1); % Composante Hue
s = image_hsv(:,:,2); % Composante Saturation
v = image_hsv(:,:,3); % Composante Value

figure();
imagesc(h);

figure();
subplot(2,2,1);
imshow(image_hsv);

title("image originale");
subplot(2,2,2);
imagesc(h);
title('Composante Hue');

subplot(2,2,3);
imshow(s);
title('Composante Saturation');

subplot(2,2,4);
imshow(v);
title('Composante Value');



%image_ihls =hsv_to_ihls(image_rgb);

%hue = image_hsv(:,:,1); % Composante Hue
%sat = image_hsv(:,:,3); % Composante Saturation
%l = image_hsv(:,:,2); % Composante l


%figure;
%imshow(hue,hsv);

