%% FFT2 esercizio
Fs = 256;        	% Sampling frequency
T = 1/Fs;         	% Sampling period
t = -1:T:1;    	% Time vector

s = sin(2*pi*5*t);
s_2D = repmat(s,length(s),1);
S_2D = abs(fftshift(fft2(s_2D)));

figure;
subplot(2,2,1)
imshow(s_2D,[])
title('vertical signal','FontSize',14,'fontweight','bold')

Sv_2D = abs(fftshift(fft2(s_2D)));
subplot(2,2,2)
imshow(Sv_2D(237:277,237:277),[])
title('FFT2','FontSize',14,'fontweight','bold')

subplot(2,2,3)
imshow(s_2D',[])
title('horizontal signal','FontSize',14,'fontweight','bold')

Sh_2D = abs(fftshift(fft2(s_2D')));
subplot(2,2,4)
imshow(Sh_2D(237:277,237:277),[])
title('FFT2','FontSize',14,'fontweight','bold')

%% ESERCIZIO 2
s = sin(2*pi*5*t)+sin(2*pi*1*t)+sin(2*pi*10*t);
s_2D = repmat(s,length(s),1);
s_2D = s_2D+s_2D';	
S_2D = abs(fftshift(fft2(s_2D)));

figure
subplot(1,2,1); imshow(s_2D,[]); 
title('signal','FontSize',14,'fontweight','bold')
subplot(1,2,2); imshow(S_2D(237:277,237:277),[]);
title('FFT2','FontSize',14,'fontweight','bold')


%% gaussian
t_max = 8;
Fs = 4;
alpha = 1;
g = my_gaussian(t_max, 1.0/Fs, alpha);

G = fftshift(fft2(g));

figure;
subplot(1,2,1)
imshow(g,[])
title('signal')

subplot(1,2,2)
imshow(abs(G),[])
title('FFT')

%gaussiana 1D
t = -32:T:32;
l = length(t);
alpha = 0.01;
g = exp(-alpha*t.^2 );
figure; plot(t,g)
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')


%% ESERCIZIO step
l=150;
R = zeros(l,l);
center=round(l/2);
R(:,center:end) = 1;
subplot(131)
imshow(R);
title('signal');

Rfft = (fft2(R));
subplot(132)
imshow((abs(Rfft)),[]);%,'InitialMagnification','fit');
title('FFT');

Rffts = fftshift(fft2(R));
subplot(133)
imshow((abs(Rffts)),[]);%,'InitialMagnification','fit');
%se si vuole vedere con lo stesso zoom della slide:
%subplot(1,3,3); imshow((abs(Rffts(60:90,60:90))),[]);
title('FFTshift');

%% ESERCIZIO quadrato

R = zeros(30,30);
center=floor(30/2);
R(center-8:center+9,center-2:center+3) = 1;
subplot(231)
imshow(R,[]);
title('signal');

Rfft = fft2(R);
subplot(232)
imshow(log(abs(Rfft)));%,'InitialMagnification','fit');
title('FFT2');

subplot(233)
imshow(log(abs(fftshift(Rfft))));%,'InitialMagnification','fit');
title('FFTshift');

Rz = zeros(120,120);
c = floor(120/2);
Rz(c-15:c+14,c-15:c+14) = R;

subplot(234)
imshow(Rz,[]);
title('signal Zero-padded');

Rfftz = fft2(Rz);
subplot(235)
imshow(log(abs(Rfftz)));%,'InitialMagnification','fit');
title('FFT');

Rffts = fftshift(fft2(Rz));
subplot(236)
imshow(log(abs(Rffts)));%,'InitialMagnification','fit');
title('FFTshift');


%% ESERCIZIO lena
clear all
close all
img = rgb2gray(imread('lena.jpg'));

figure;
subplot(2,2,1)
imshow(img,[])
title('img','FontSize',14,'fontweight','bold')

I =fftshift(fft2(img));
I_abs = abs(I);

subplot(2,2,2)
imshow(log(I_abs),[])
title('FFT ABS','FontSize',14,'fontweight','bold')

subplot(2,2,3)
imshow(log((real(I))),[])
title('FFT REAL','FontSize',14,'fontweight','bold')

subplot(2,2,4)
imshow(log((imag(I))),[])
title('FFT IMAG','FontSize',14,'fontweight','bold')

%ricostruzione solo con modulo (fase=0) e solo con fase (mag = 1)
I_mag=abs(I);
phase = angle(I);
I_phase=cos(phase)+1i*(sin(phase));
%I_phase = ifft2(ifftshift(ones(size(phase)).*exp(1i*phase)));

lena_mag=log(abs(ifft2(ifftshift(I_mag)))+1);
lena_phase=ifft2(ifftshift(I_phase));

%lena_phase = histeq(real(lena_phase));
figure;
subplot(121)
imshow(abs(lena_mag),[]);
%imshow(abs(lena_phase), []);

title('Magnitude')
 
subplot(122)
imshow(lena_phase, []);
title('Phase')

% hight and low frequency
% [l,l]=size(img);
% center = zeros(size(img));
% center(l/2,l/2)=I(l/2,l/2);
% I(l/2,l/2)=0;
% woc=real(ifft2(ifftshift(I)));
% c=real(ifft2(ifftshift(center)));
% figure;
% subplot(2,2,1)
% imshow(c,[]);
% title('center','FontSize',14,'fontweight','bold')
% subplot(2,2,2)
% imshow(woc,[]);
% title('ifft without center','FontSize',14,'fontweight','bold')

square = ones(size(img));
square(257-50:257+49,257-50:257+49)=0;

I_high = I.*square;
figure;
subplot(2,2,1)
imshow(log(abs(I_high)),[])
title('high frequencies','FontSize',14,'fontweight','bold')

I_low = I.*(1-square);
subplot(2,2,2)
imshow(log(abs(I_low)),[])
title('low frequencies','FontSize',14,'fontweight','bold')

img_high = real(ifft2(ifftshift(I_high)));
img_low= real(ifft2(ifftshift(I_low)));

subplot(2,2,3)
imshow(img_high,[])
subplot(2,2,4)
imshow(img_low,[])

figure;
subplot(1,2,1)
imshow(img,[])
title('original','FontSize',14,'fontweight','bold')
subplot(1,2,2)
imshow(img_low+img_high,[])
title('low+high','FontSize',14,'fontweight','bold')
