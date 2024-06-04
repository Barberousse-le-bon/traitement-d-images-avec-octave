clear all;
close all;

function [img] = atom(n,m,fx,fy)

img=[];
e1 = exp(i*2*pi*fx*(0:m-1));
e2 = exp(i*2*pi*fy*(0:n-1));
img = real(e2'*e1);

endfunction

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


fe = 1

img = atom(128,128, 0.1, 0);
figure(1);
imagesc(img);

fourier2d(img,fe)






