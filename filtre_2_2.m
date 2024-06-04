function image_filtree = filtre_2_2(image, filtre)


    % Application du filtre à l'image en utilisant la convolution
    image_filtree = conv2(double(image), filtre, 'same');
endfunction

