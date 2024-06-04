function seuil = seuillage(image, histogramme)



  dimensions = size(image);

  width = dimensions(2);
  height = dimensions(1);


  taille = width*height;

  gris_max = 256;

  m0 =moment(gris_max,0,histogramme, taille);
  m1 =moment(gris_max,1,histogramme, taille);
  m2 =moment(gris_max,2,histogramme, taille);
  m3 =moment(gris_max,3,histogramme, taille);

  A = [m0, m1; m1, m2];
  b = [-m2; -m3];

  x = A \ b;

  C0 = x(1);
  C1 = x(2);

  solutions = roots([1, C1, C0]);



  z0= solutions(1);
  z1= solutions(2);


   seuil = (z0+z1)/2;
   return;

  endfunction
