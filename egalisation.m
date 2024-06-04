close all;
clear all;

function histo = histogramme(image)
    taille = size(image);
    width = taille(2);
    height = taille(1);
    valeurs = zeros(1,256);

    for w = 1:width
        for h = 1:height
            pixel = image(h,w);
            valeurs(pixel+1)= valeurs(pixel+1)+1;
        endfor
    endfor

    histo = valeurs;
endfunction

function new_picture = egalisation(image)
    figure();
    imagesc(image, [min(min(image)) max(max(image))]);
    colormap(gray);
    histo = histogramme(image);
    taille = size(image);
    width = taille(2);
    height = taille(1);
    Npix = width*height;
    S(1) = histo(1);
    figure();
    plot(histo);
    kmax = size(histo)(2);

    for g = 2:(kmax-1)
        S(g) = S(g-1)+ histo(g);
    endfor

    for g = 1:(kmax-1)
        S(g) = (kmax-1)*S(g)/Npix;
    endfor

    figure();
    plot(S);
    new_picture = zeros(size(image));

    for y = 1:height
        for x = 1:width
            gris = image(y,x);
            new_Gris = S(gris+1);
            new_picture(y,x) = new_Gris;
        endfor
    endfor

    figure();
    imagesc(new_picture, [min(min(new_picture)) max(max(new_picture))]);
    colormap(gray);

    new_histo = histogramme(floor(new_picture));
    figure();
    plot(new_histo);
endfunction

nom= "imagesTP/rue.jpg";
a=imread(nom);
figure();
imagesc(a);
egalisation(a);

