function img = petiteImage()


  img = atom(128,128,0.15,0.37);
  return;

endfunction

clear all;
close all;
figure();
imagesc(petiteImage());
