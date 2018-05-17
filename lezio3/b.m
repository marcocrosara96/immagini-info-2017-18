Fs = 256;
T = 1/Fs;
t = -1:T:1;
s = sin(2*pi*5*t) + sin(2*pi*1*t) + sin(2*pi*10*t);
%plot(s);
s_2D = repmat(s,length(s),1);
s_2D_new = s_2D + s_2D';
S_2D = abs(fftshift(fft2(s_2D_new)));
figure
subplot(1,3,1);
imshow(s_2D,[]);
subplot(1,3,2);
imshow(s_2D_new,[]);
title('signal','FontSize',14,'fontweight','bold')
subplot(1,3,3);
imshow(S_2D(237:277,237:277),[]);
title('FFT2','FontSize',14,'fontweight','bold')