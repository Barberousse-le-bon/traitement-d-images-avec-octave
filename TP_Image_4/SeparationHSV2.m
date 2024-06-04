clear all;
close all;

pkg load image;

% Chargement de l'image
image = imread('CerisierP.jpg');
figure()
imagesc(image);

% Conversion de l'image en espace de couleur HSV
image_hsv = rgb2hsv(image);

% Définition des plages de valeurs HSV pour le bleu
seuil_min_bleu = [0.50,0.1,0.1];
seuil_max_bleu = [0.80, 1, 1];

% Application du seuillage pour détecter le bleu
masque_bleu = (image_hsv(:,:,1) >= seuil_min_bleu(1)) & (image_hsv(:,:,1) <= seuil_max_bleu(1)) & ...
              (image_hsv(:,:,2) >= seuil_min_bleu(2)) & (image_hsv(:,:,2) <= seuil_max_bleu(2)) & ...
              (image_hsv(:,:,3) >= seuil_min_bleu(3)) & (image_hsv(:,:,3) <= seuil_max_bleu(3));

% Appliquer les masques binaires à l'image d'origine pour extraire les couleurs
image_bleue = bsxfun(@times, image, cast(!masque_bleu, 'like', image));

% Afficher les images résultantes
figure();
imshow(image_bleue);
title('Bleu');


