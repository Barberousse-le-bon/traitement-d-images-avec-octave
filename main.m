clear all; close all;
% CerisierP.JPG
nom=input('Entrer le nom image avec le format jpg, bmp ou tif :','s'); % l'image doit être dans le répertoire
image_couleurs=imread(nom);


couleur = input('l image est elle en couelurs ?','s');

if(couleur == 'yes')

% affichage de l'image en couleurs
figure();
imagesc(image_couleurs);
title("image originale");

%affichage des composantes de l'image
figure();
subplot(2,2,1);
imagesc(image_couleurs);
title("image originale");

rouge=double(image_couleurs(:,:,1));
vert=double(image_couleurs(:,:,2));
bleu=double(image_couleurs(:,:,3));
subplot(2,2,2);
imagesc(rouge, [min(min(rouge)) max(max(rouge))]);
title("niveaux de rouge");
subplot(2,2,3);
imagesc(vert, [min(min(vert)) max(max(vert))]);
title("niveaux de vert");
subplot(2,2,4);
imagesc(bleu, [min(min(bleu)) max(max(bleu))]);
title("niveaux de bleu");
colormap(gray);

%affichage de l'image en niveaux de gris

image_gris=double(rgb2gray(image_couleurs));

else
image_gris = image_couleurs;
end
figure();
imagesc(image_gris, [min(min(image_gris)) max(max(image_gris))]);
colormap(gray);
title("image en niveaux de gris");


% affichage de l'histogramme de l'image


figure();
histogramme_image = histogramme(image_gris);
plot(histogramme_image);
title("histogramme de l'image");


% calcul du seuil de binarisation de l'image;

seuil_binarisation = seuillage(image_gris, histogramme_image)


%binarisation de l'image

image_binarisee = binarisation(image_gris,seuil_binarisation);


figure();
imagesc(image_binarisee);
colormap(gray);

%egalisation d'histogramme

%egalisation();



