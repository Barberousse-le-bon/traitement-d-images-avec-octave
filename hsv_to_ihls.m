function image = hsv_to_ihls(image_rgb)

     r = double(image_rgb(:,:,1));
     g = double(image_rgb(:,:,2));
     b = double(image_rgb(:,:,3));
     taille = size(r);

  width = taille(2);
  height = taille(1);

    l=zeros(size(r));
    s=zeros(size(r));
    h=zeros(size(r));
    hp=zeros(size(r));


    for w = 1:width
    for h = 1:height

      l(h, w) = 0.2126 * r(h, w) + 0.7152 * g(h, w) + 0.0722 * b(h, w);


      s(h, w) = max([r(h, w), g(h, w), b(h, w)]) - min([r(h, w), g(h, w), b(h, w)]);


      num = r(h, w) - g(h, w) / 2 - b(h, w) / 2;
      denom = sqrt(r(h, w)^2 + g(h, w)^2 + b(h, w)^2 - r(h, w) * g(h, w) - r(h, w) * b(h, w) - g(h, w) * b(h, w));
      hp(h, w) = acos(num / (denom));


      if b(h, w) > g(h, w)
        h(h, w) = 2 * pi - hp(h, w);
      else
        h(h, w) = hp(h, w);
      endif
    endfor
  endfor


  image=cat(3, h, l,s);

endfunction
