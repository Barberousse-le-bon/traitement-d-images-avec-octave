function histogramme(image)

  taille = size(image);

  width = taille(2)
  height = taille(1);

  valeurs = zeros(1,256);


  for w = 1:width
    for h = 1:height

      pixel = image(h,w);

      valeurs(pixel+1)= valeurs(pixel+1)+1;



    endfor
  endfor

  figure(3);
  plot(valeurs);

  endfunction
