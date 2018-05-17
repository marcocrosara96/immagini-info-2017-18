%PROVA 1
%{
t = 1:0.2:20
x = sin(t) + sin(t/2)
xfft = real(fft(x))
subplot(2,1,1)
plot(x)
subplot(2,1,2)
plot(xfft)
%}

%PROVA 2
%{
Fs = 128; % Sampling frequency
T = 1/Fs; % Sampling period
t = 0:T:2; % Time vector
s = sin(2*pi*5*t);
S = real(fft(s));
figure
subplot(1,2,1)
plot(t,s);
title ('signal','FontSize',14,'fontweight','bold')
ylim([-1.1,1.1]);
subplot (1,2,2); 
%plot(S);
%title ('FFT','FontSize',14,'fontweight','bold')

l = length(t);
N = floor(l/2)+1;
S = S(1:N);
f_max = Fs/2;
f_sampling = Fs/l;
f = 0:f_sampling:f_max;
plot(f,S);
title ('FFT adjust','FontSize',14,'fontweight','bold')
xlabel ( ' frequency (Hz)','FontSize',14)
xlim ([0,f_max])
%}

T = 0.01; % Sampling period
t = 0:T:4; % Time vector
s = sin(2*pi*4*t) + sin(2*pi*2*t);
S = abs(fft(s));
figure
subplot(1,2,1);
plot(t,s);
ylim([-1.1,1.1]);
title ('signal','FontSize',14,'fontweight','bold')
ylim([-1.1,1.1]);
subplot (1,2,2); 
plot(S);
title ('FFT','FontSize',14,'fontweight','bold')