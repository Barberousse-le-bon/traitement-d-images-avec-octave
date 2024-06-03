function tf = transfoFourier(image)


    taille = size(image);

  width = taille(2);
  height = taille(1);

  TF=zeros(width,height);



  b = fft2(image);
  ma = log(1 + abs(b));




  tf = ma;





  fftLigne= fft(image,[],1);
  fftColonne= fft(image,[],2);

  amplitude = log(1 + abs(fftColonne));
  amplitude;

  figure(7);
  imshow(amplitude);


  endfunction
