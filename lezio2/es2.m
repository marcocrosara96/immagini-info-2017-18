%GAUSSIANA
Fs = 0.5;
T = 1/Fs;
t = -32:T:32;
l = length(t);
alpha = 0.01;
g = exp(-alpha*t.^2 );
figure;
subplot(1,3,1);
plot(t,g);
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')

g_fft = abs(fft(g));

subplot(1,3,2);
plot(t,g_fft);

g_fft = fftshift(g_fft);

subplot(1,3,3);
plot(t,g_fft);

