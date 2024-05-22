close all, clear all;



function histo = histogramme(image)
  taille = size(image);
  width = taille(2);
  height = taille(1);
  valeurs = zeros(1,256);

  for w = 1:width
    for h = 1:height
      pixel = image(h,w);
      valeurs(pixel+1)= valeurs(pixel+1)+1;
      histo = valeurs;
    endfor
  endfor
endfunction


function egalisation(image)
  figure(1);
  imagesc(image, [min(min(image)) max(max(image))]);
  colormap(gray);
  histo = histogramme(image);
  taille = size(image);
  width = taille(2);
  height = taille(1);
  Npix = width*height;
  S(1) = histo(1);
  figure(2);
  plot(histo);
  kmax = size(histo)(2)

  for g = 2:(kmax-1)
    S(g) = S(g-1)+ histo(g);
  endfor

  for g = 1:(kmax-1)
    S(g) = (kmax-1)*S(g)/Npix;
  endfor

  figure(3);
  plot(S);

  for y = 1:(height-1)
    for x = 1:(width-1)
      gris = image(y,x);
      new_Gris = S(gris);
      new_picture(y,x) = new_Gris;
    endfor
  endfor
  figure(4);
  %new_picture_gris
  imagesc(new_picture, [min(min(new_picture)) max(max(new_picture))]);

  %la fin de la fonciton marche pas (presque : utiliser une image surexpos

  new_histo = histogramme(floor(new_picture));
  figure(5);
  plot(new_histo);

endfunction

nom= "imagesTP/rue.jpg"
a=imread(nom);
iMage=double(rgb2gray(a));
egalisation(iMage);








