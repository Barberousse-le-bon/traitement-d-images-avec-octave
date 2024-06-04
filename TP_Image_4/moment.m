function moment = moment(gris_max, ordre_moment, histogramme, taille)

  moment =0;
  for i = 1:gris_max

    nb_pixel=histogramme(i);


    moment=moment+nb_pixel*(i^ordre_moment);

   endfor

   moment = moment/taille;


  return;
   endfunction
