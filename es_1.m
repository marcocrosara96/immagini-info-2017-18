step_(1:50)=0;
step_(50:100)=1;
step_(100:150)=0;

fs = 1;
T = 1/fs;
t = -50:T:50;
y = rectpuls(t*0.1);

y_ = fftshift(fft(y));

figure
subplot(1,2,1);
plot(t,y);

subplot(1,2,2);
plot(t,y_);