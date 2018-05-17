%ESERCIZIO SU RICE

ANGLE = 0; % 0, 1, 2, 3, 4, 5 ...
DIST = 8;
SIMM = 1;

%PARTE 1 ---------------------------------
%{
Calcolare la matrice di co-occorrenza con
diversi valori di angolo (come nel sorgente)
e di distanza (da 1 a 16 con step di 2 o 4 a
seconda di quanto sia lento l’algoritmo)
%}
img = imread('rice.png');
%img1 = cooccurrence(img,0,8,SIMM);
%img2 = cooccurrence(img,2,8,SIMM);
%img3 = cooccurrence(img,0,1,SIMM);
%img4 = cooccurrence(img,6,1,SIMM);

%PARTE 2 --------------------------------
%matrice di autocorrelazione
%img5 = xcorr2(img);

%PARTE 3 --------------------------------
%istogramma(visualizzato direttamente sull'immagine [vedi sotto])

%PARTE 4 --------------------------------
%4. Fare la trasformata di Fourier delle tessiture e visualizzare lo
%spettro
trasf1 = fftshift(fft2(img));

%PARTE 5 --------------------------------
%5. Fare la trasformata di Fourier delle funzioni di autocorrelazione e  
%visualizzarle [vedi sotto]

figure;

subplot(2,4,1);
imshow(img1, []);

subplot(2,4,2);
imshow(img2, []);

subplot(2,4,3);
imshow(img3, []);

subplot(2,4,4);
imshow(img4, []);

subplot(2,4,5);
imshow(img5, []);

subplot(2,4,6);
imhist(img);

subplot(2,4,7);
surf(img5);

subplot(2,4,8);
imshow(log(abs(trasf1))+1, []);