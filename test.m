close all;
clear all;

function [] = fourier2d(img, fe)
  dim = size(img);

  % Calcul de la transformée de Fourier 2D et centrage des basses fréquences
  f = abs(fftshift(fft2(img)));

  % Calcul des indices pour les axes des fréquences
  n = dim(2) / 2;
  m = dim(1) / 2;

  % Création des vecteurs d'axes en fréquence
  x = fe * (-n:n-1) / dim(2);
  y = fe * (-m:m-1) / dim(1);

  % Affichage du spectre en 3D
  figure();
  surf(x, -y, sqrt(f));
  title("Spectre - 1");
  xlabel("Fx");
  ylabel("Fy");
  zlabel("Amplitude");

  % Affichage du spectre en contour
  figure();
  contourf(x, -y, log(5*f + 1));
  title("Spectre - 2");
  xlabel("Fx");
  ylabel("Fy");
endfunction

function [img] = atom(n, m, fx, fy)
  e1 = exp(i * 2 * pi * fx * (0:m-1));
  e2 = exp(i * 2 * pi * fy * (0:n-1));
  img = real(e2' * e1);
endfunction

fe = 1;

rupt0 = atom(500, 500, 0.01, 0);
rupt1 = atom(500, 500, 0, 0.01);
rupt2 = atom(500, 500, 0.01, 0.01);

figure(1);
imagesc(rupt0);
title("Image rupt0");

% Décommenter ces lignes si nécessaire
% figure(2)
% imagesc(rupt1);
% title("Image rupt1");

% figure(3)
% imagesc(rupt2);
% title("Image rupt2");

% Calculer et afficher les spectres de Fourier
% fourier2d(rupt0, fe);
% fourier2d(rupt1, fe);
fourier2d(rupt2, fe);

