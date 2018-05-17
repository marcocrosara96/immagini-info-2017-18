% Esercizio: funzioni trigonometriche
T = 0.01; % Sampling period
t = 0:T:4; % Time vector

s = sin(2*pi*4*t)*3 + sin(2*pi*2*t)*5;

figure
subplot(1,3,1);
plot(t,s);

% Esercizio: rappresentazioni di spettro e fase

s_fft = fft(s);
m = 2*abs(s_fft/length(s));
m1 = m(1:floor(length(s)/2))
p = unwrap(angle(s_fft/length(s))); %unwrap trasforma l'angolo in radianti 

subplot(1,3,2);
plot(m1);

subplot(1,3,3);
plot(p);