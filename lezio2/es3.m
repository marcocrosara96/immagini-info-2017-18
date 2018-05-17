%Esercizio: Zero Padding
T = 1; % Sampling period
t = 0:T:64; % Time vector

x = sin(2*pi*0.2*t);

N = floor(1/2) + 1;
m = m(1:N);
f_sampling = Fs/1;
f_max = Fs/2;
f = 0:f_sampling:f_max;

y = fft(x,120);
m = abs(y);

subplot(1,4,1);
plot(t,x);