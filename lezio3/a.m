Fs = 256;
T = 1/Fs;
t = -1:T:1;
s = sin(2*pi*5*t);
%segnale ruotato di 90 gradi
s_rot = s';

s_2D = repmat(s,length(s),1); %ogni livello di grigio è un valore di ampiezza diversa
S_2D = abs(fftshift(fft2(s_2D)));
%Segnale ruotato di 90 gradi
s_2D_rot = repmat(s_rot,1,length(s_rot));
S_2D_rot = abs(fftshift(fft2(s_2D_rot)));
figure
subplot(2,3,1);
plot(s);
subplot(2,3,2);
imshow(s_2D,[]);
%title('signal','FontSize',14,'fontweight','bold')
subplot(2,3,3);
imshow(S_2D(237:277,237:277),[]);
%title('FFT2','FontSize',14,'fontweight','bold')
subplot(2,3,4);
plot(s_rot);
subplot(2,3,5);
imshow(s_2D_rot,[]);
subplot(2,3,6);
imshow(S_2D_rot(237:277,237:277),[]);