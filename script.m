close all;
clear all;

function [] = fourier2d(img,fe)

dim = size(img);

f = abs(fftshift( fft2(img) ) );
n = dim(2)/2
m = dim(1)/2

figure();
x=fe*(-n:n-1)/dim(2);
y=fe*(-m:m-1)/dim(1);
surf(x,-y,sqrt(f));
title ({"Spectre - 1"});
xlabel ("Fx");
ylabel ("Fy");
zlabel ("Amplitude");

figure();
contourf(x,-y,log(5*f+1));
title ({"Spectre - 2"});
xlabel ("Fx");
ylabel ("Fy");
endfunction



fe = 1;

rupt0 = atom(500,500,0.01,0);
rupt1 = atom(500,500,0,0.01);
rupt2 = atom(500,500,0.01,0.01);

%figure(1);
%imagesc(rupt0);

figure(2)
imagesc(rupt1);

figure(3)
imagesc(rupt2);

%fourier2d(rupt0,fe);


%fourier2d(rupt1,fe);
%fourier2d(rupt2,fe);




