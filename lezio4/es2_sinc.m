rect_(1:50)=0;
rect_(50:100)=1;
rect_(100:150)=0;

RECT_ = fftshift(fft(rect_));

figure;
subplot(1,2,1);
plot(rect_);

subplot(1,2,2);
plot(real(RECT_));


