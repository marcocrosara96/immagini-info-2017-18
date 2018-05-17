%usiamo la Gaussiana
t_max = 8;
Fs = 4;
alpha = 1;
g = my_gaussian(t_max,1/Fs,alpha);
G = fftshift (fft2(g));
figure;
subplot(1,2,1)
imshow(g,[])
title('signal');
subplot(1,2,2)
imshow(abs(G),[])
title('FFT');