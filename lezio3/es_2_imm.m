%{
• Creare un’immagine con N=30 righe e M=30 colonne, con
• un rettangolo bianco centrato su sfondo nero (h=18; w=4)
• Calcolare la FFT e visualizzare lo spettro
• Centrare lo spettro in (N/2,M/2)
• Incrementare la risoluzione dello spettro con zero padding
• Centrare lo spettro in (N/2,M/2)
• Nella visualizzazione delle ampiezze sostituire la scala
lineare con la scala logaritmica (x -> log(abs(x))
%}
%creo la matrice
N = 30
M = 30
matrice = zeros(N,M);
%fillo la matrice
for i=6:24
    for j=13:17
        matrice(i,j) = 1;
	end
end
matrice_fft = fft2(matrice);
matrice_fft = matrice_fft(N/2,N/2);
matrice_fft = length(matrice_fft)*100;
matrice_fft_shifted = fftshift(matrice_fft);

figure
subplot(2,3,1);
imshow(matrice,[]);
title('signal');

subplot(2,3,2);
imshow(log(abs(matrice_fft)),[]);
title('fft2');

subplot(2,3,3);
imshow(matrice_fft_shifted,[]);
title('fft Shift');
