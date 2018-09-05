Fs = 256;
T = 1/Fs;
t = -1:T:1;
%t = linspace(-1,1,Fs); %same errors?

s = sin(2*pi*5*t);
s_2D = repmat(s, length(s), 1) ;
S_2D = abs(fftshift(fft2(s_2D)));
%size(S_2D)

sr = s';
sr_2D = repmat(sr, 1, length(sr)) ;
%sr_2D = imrotate(s_2D, 90);
Sr_2D = abs(fftshift(fft2(sr_2D)));

figure;
subplot(2,2,1);
    imshow(s_2D, []);
    title('2D signa');
subplot(2,2,2);
    imshow(S_2D(237:277,237:277), []);
    title('fft2');
subplot(2,2,3);
    imshow(sr_2D, []);
    title('2D signal');
subplot(2,2,4);
    imshow(Sr_2D(237:277,237:277), [])
    title('fft2');
    
clear;
close all;

% Creare uno step 2D (l totale = 150)
% Calcolare la FFT e visualizzare lo spettro
% Portare lo spettro al centro del quadrante e visualizzarlo

step(1:75) = 0;
step(76:150) = 1;
%length(step)

step_2d = repmat(step, 150, 1);
spettro = abs(fft2(step_2d));
spettro_ = abs(fftshift(spettro));

figure;
subplot(1, 3, 1);
    imshow(step_2d, []);
    title('step 2d');
subplot(1, 3, 2);
    imshow(spettro, [])
    title('fft')
subplot(1, 3, 3);
    imshow(spettro_(150/2-10:150/2+10,150/2-10:150/2+10), [])
    title('fftshift')

clear;
close all;

% Creare un’immagine con N=30 righe e M=30 colonne, con
% un rettangolo bianco centrato su sfondo nero (h=18; w=4)
% • Calcolare la FFT e visualizzare lo spettro
% • Centrare lo spettro in (N/2,M/2)
% • Incrementare la risoluzione dello spettro con zero padding
% • Centrare lo spettro in (N/2,M/2)
% • Nella visualizzazione delle ampiezze sostituire la scala
% lineare con la scala logaritmica (x -> log(abs(x))

img = zeros(30, 30);
a = floor(30/2);
img(a-8:a+9, a-1:a+2) = 1;

IMG = fft2(img);
IMGs = fftshift(IMG);

imgp = zeros(120, 120);
a = floor(120/2);
imgp(a-14:a+15, a-14:a+15) = img;

IMGP = fft2(imgp);
IMGPs = fftshift(IMGP);

image;
subplot(2, 3, 1);
    imshow(img, []);
    title('image');
subplot(2, 3, 2);
    imshow(log(abs(IMG))); %[]
    title('fft2');
subplot(2, 3, 3);
    imshow(log(abs(IMGs))); %[]
    title('fftshift');
subplot(2, 3, 4);
    imshow(imgp, []);
    title('fftshift');
subplot(2, 3, 5);
    imshow(log(abs(IMGP)));
    title('fftshift');
subplot(2, 3, 6);
    imshow(log(abs(IMGPs)));
    title('fftshift');

clear;
close all;

% • Caricate l’immagine ‘lena.jpg’
% • Convertitela in scale di grigio
% • Provate a visualizzare:
% Ø Il modulo e la fase della trasformata di Fourier
% Ø La parte reale (comando real )
% Ø La parte immaginaria (comando imag)

lena = rgb2gray(imread('lena.jpg'));

modulo_fase = fftshift(fft2(lena));

figure;
subplot(221);
    imshow(lena, []);
    title('immagine');
subplot(222);
    imshow(log(abs(modulo_fase)), []);
    title('mosulo e fase');
subplot(223);
    imshow(log(real(modulo_fase)), []);
    title('reale');
subplot(224);
    imshow(log(imag(modulo_fase)), []);
    title('immaginaria');
    
close all;

% • A cosa corrispondono il modulo e la fase?
% • Provate ad antitrasformare l’immagine:
% Ø Solo con il contributo del modulo (fase = 0)
% Ø Solo con il contributo della fase (mag = 1)

figure;
sublop(211);
    imshow(, []);
    title('magitude');
sublop(211);
    imshow(, []);
    title('phase');

