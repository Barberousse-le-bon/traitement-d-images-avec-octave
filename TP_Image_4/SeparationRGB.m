clear all;
close all;

pkg load image;

% Chargement de l'image
image = imread('CerisierP.jpg');
figure()
imagesc(image);

% Définition des plages de valeurs RGB pour le bleu
seuil_min_bleu = [70,85,125];
seuil_max_bleu = [95, 125, 175];

% Application du seuillage pour détecter le bleu
masque_bleu = (image(:,:,1) >= seuil_min_bleu(1)) & (image(:,:,1) <= seuil_max_bleu(1)) & ...
              (image(:,:,2) >= seuil_min_bleu(2)) & (image(:,:,2) <= seuil_max_bleu(2)) & ...
              (image(:,:,3) >= seuil_min_bleu(3)) & (image(:,:,3) <= seuil_max_bleu(3));

% Appliquer les masques binaires à l'image d'origine pour extraire les couleurs
image_bleue = bsxfun(@times, image, cast(!masque_bleu, 'like', image));

% Afficher les images résultantes
figure();
imshow(image_bleue);
title('Bleu');



