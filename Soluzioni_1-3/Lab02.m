%% FFT
x = [1 2 1];
xfft = fft(x)

%% FFT esercizio
Fs = 128;        	% Sampling frequency
T = 1/Fs;         	% Sampling period
t = 0:T:2;    	% Time vector

s = sin(2*pi*5*t);
figure
subplot(1,2,1)
plot(t,s);
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')
ylim([-1.1,1.1])

l = length(s);
S = (fft(s));
subplot(1,2,2)
plot(2*(abs(S/l)));
title('FFT','FontSize',14,'fontweight','bold')

l = length(s);
N = floor(l/2)+1;
S = S(1:N);

f_max = Fs/2;
f_sampling = Fs/l;
f = 0:f_sampling:f_max;
% subplot(1,3,3)
plot(f,2*abs(S/l));
title('FFT adjusted','FontSize',14,'fontweight','bold')
xlabel('frequency (Hz)','FontSize',14)
xlim([0,f_max])
ylim([0,max(2*abs(S/l))+0.1]);

%% ESERCIZIO
Fs = 1/0.01; %sampling frequency
T = 1/Fs; % sampling time
t = 0:T:4;
x = 3*sin(2*pi*4*t)+5*sin(2*pi*2*t);
figure
plot(t,x);
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')

y = fft(x);
m = abs(y/length(x));% Magnitude
p = unwrap(angle(y/length(x)));% Phase
% p = (angle(y/length(x)));% Phase

l = length(y);
f = (0:l-1)*Fs/l;% Frequency vector
f_max = Fs;

subplot(131); plot(t,x);
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')
subplot(132); plot(f,2*m);
title('Magnitude FFT','FontSize',14,'fontweight','bold')
xlabel('frequency (Hz)','FontSize',14)
ylabel('amplitude','FontSize',14)
xlim([0,f_max/2])
ax = gca;
ax.XTick = [2 4 floor(f_max/4) floor(f_max/2)];
subplot(133); plot(f,(p*180/pi));
title('Phase FFT','FontSize',14,'fontweight','bold')
xlabel('frequency (Hz)','FontSize',14)
ylabel('angle (deg)','FontSize',14)
xlim([0,f_max])
ax = gca;
ax.XTick = [2 4 f_max/2 f_max];

%% FFTSHIFT
Fs = 0.5;        	
T = 1/Fs;
t = -32:T:32;
l = length(t);

alpha = 0.01;
g = exp(-alpha*t.^2 );
figure;
plot(t,g)
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')

G = fftshift(fft(g));
f_max = Fs/2;
f_sampling = Fs/(l-1);
f = -f_max:f_sampling:f_max;

figure;
subplot(121); plot(t,g)
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')
subplot(122); plot(f,2*abs(G/(l/2)))
xlabel('frequency (Hz)','FontSize',14)
title('FFT','FontSize',14,'fontweight','bold')
xlim([-f_max,f_max])

%% ZERO PADDING
T = 1;
t = [0:T:64];
Fs = 1/T;
f0 = 0.2;
x = sin(2*pi*f0*t);

subplot(141); plot(t,x);
xlabel('time (s)','FontSize',14)
title('signal','FontSize',14,'fontweight','bold')
xlim([0 64]);

y = fft(x);
l = length(y);
m = abs(y/l);% Magnitude
% p = unwrap(angle(y));% Phase


N = floor(l/2)+1;
m = m(1:N);
f_sampling = Fs/l;
f_max = Fs/2;
f = 0:f_sampling:f_max;% Frequency vector


subplot(142); plot(f,2*m);
title('FFT','FontSize',14,'fontweight','bold')
xlabel('frequency (Hz)','FontSize',14)
xlim([0,f_max])
ylim([0, max(2*m)+0.1])

y = fft(x,120);
m = abs(y/l);% Magnitude

l = length(y);
N = floor(l/2)+1;
m = m(1:N);
f_sampling = Fs/l;
f_max = Fs/2;
f = 0:f_sampling:f_max;% Frequency vector
subplot(143); plot(f,2*m);
title('FFT with zero-padding','FontSize',14,'fontweight','bold')
xlabel('frequency (Hz)','FontSize',14)
xlim([0,f_max])
ylim([0, max(2*m)+0.1])


S = ifft(y);
l = length(y);
t = 0:T:l-1;

subplot(144); plot(t,S);
xlabel('time (s)','FontSize',14)
title('signal from FFT-padded','FontSize',14,'fontweight','bold')
xlim([0 l-1]);
