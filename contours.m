function img_contours = contours(image)

display('saisissez 1 pour le filtre de Roberts,');
display('saisissez 2 pour le filtre de Prewitt,');
selection =input('saisissez 3 pour le filtre de Sobel : ');

if(selection ==1
)
display('Roberts');
elseif(selection ==2)
display('Prewitt');
else
display('Sobel');
endif

  return;
endfunction


a = contours();
a
