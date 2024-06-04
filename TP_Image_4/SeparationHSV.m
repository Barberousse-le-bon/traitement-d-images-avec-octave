clear all;
close all;

pkg load image;

% Chargement de l'image
image = imread('confiserie-smarties-lentilles_121-50838.jpg');
figure()
imagesc(image);

% Conversion de l'image en espace de couleur HSV
image_hsv = rgb2hsv(image);

% Définition des plages de valeurs HSV pour le bleu
seuil_min_bleu = [0.50, 0.2, 0.2];
seuil_max_bleu = [0.66, 1, 1];

% Application du seuillage pour détecter le bleu
masque_bleu = (image_hsv(:,:,1) >= seuil_min_bleu(1)) & (image_hsv(:,:,1) <= seuil_max_bleu(1)) & ...
              (image_hsv(:,:,2) >= seuil_min_bleu(2)) & (image_hsv(:,:,2) <= seuil_max_bleu(2)) & ...
              (image_hsv(:,:,3) >= seuil_min_bleu(3)) & (image_hsv(:,:,3) <= seuil_max_bleu(3));
% ouverture image bleu
sE = [ 1 , 1 , 1 ; 1, 1, 1 ; 1, 1, 1 ];
new_masque_bleu = imopen(masque_bleu,sE);


% Définition des plages de valeurs HSV pour le jaune
seuil_min_jaune = [0.15, 0.2, 0.2];
seuil_max_jaune = [0.20, 1, 1];

% Application du seuillage pour détecter le jaune
masque_jaune = (image_hsv(:,:,1) >= seuil_min_jaune(1)) & (image_hsv(:,:,1) <= seuil_max_jaune(1)) & ...
               (image_hsv(:,:,2) >= seuil_min_jaune(2)) & (image_hsv(:,:,2) <= seuil_max_jaune(2)) & ...
               (image_hsv(:,:,3) >= seuil_min_jaune(3)) & (image_hsv(:,:,3) <= seuil_max_jaune(3));

% ouverture image bleu
sE = [ 1 , 1 , 1 ; 1, 1, 1 ; 1, 1, 1 ];
new_masque_jaune = imopen(masque_jaune,sE);

% Appliquer les masques binaires à l'image d'origine pour extraire les couleurs
image_bleue = bsxfun(@times, image, cast(new_masque_bleu, 'like', image));
image_jaune = bsxfun(@times, image, cast(new_masque_jaune, 'like', image));


% Afficher les images résultantes
figure();
imshow(image_bleue);
title('Bleu');

figure()
imshow(image_jaune);
title('Jaune');



