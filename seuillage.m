function seuil = seuillage(image, ordre_moment)


  histo = histogramme(image);

  dimensions = size(image);

  width = dimensions(2)
  height = dimensions(1);


  taille = width*height;

  gris_max = 255;
  moment =0;


  for i = 1:gris_max

    nb_pixel=histo(i);


    moment=moment+nb_pixel*(i^ordre_moment);

   endfor

   moment = moment/taille;

   seuil = moment;
   return;

  endfunction
