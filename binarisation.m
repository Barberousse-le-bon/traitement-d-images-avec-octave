function image_bin =  binarisation(image, seuil)


  taille = size(image);

  width = taille(2);
  height = taille(1);

  for w = 1:width
    for h = 1:height

      pixel = image(h,w);

      if(pixel > seuil)

        image(h,w)=255;

      else
        image(h,w)=0;

      endif



    endfor
  endfor

  image_bin = image;
  return;



  endfunction
