clear;

%Esercizio 1

%1

fcamp = 100;
tcamp = 1/fcamp;
tfine = 5*2;

%t = linspace(0, tfine, tcamp);
t = 0 : tcamp : tfine;

P = 2;
f = 1/P;
y = 1*sin(2*pi*f*t) + 2*cos(2*pi*f*t);
y = y + 3*cos(f*4*pi*t);

figure;
subplot(511);
    plot(t, y);
    title('segnale');

%2
fmax = fcamp;
f = 0 : fcamp/(length(t)-1) : fmax;
f2 = -fmax/2 : fcamp/(length(t)-1) : fmax/2;

Y = fft(y);
Y_zero = fftshift(Y);

subplot(512);
    plot(f, Y);
    title('fft su max');
subplot(513);
    plot(f2, Y_zero);
    title('fft sullo zero');

%3
u = sin(2*pi*1*t) + sin(2*pi*1.5*t);
padding = 250;
U = fft(u, length(t) + padding);

t3 = 0 : fcamp / (length(t) -1 + padding) : fcamp;

subplot(514);
    plot(t, u);
    title('segnale 2');
subplot(515);
    plot(t3, U);
    title('spettro con padding');
    
clear;
close all;

%Esercizio 2

img = zeros(512, 512);
img = img + 128;

tri = zeros(200);
tri = tri + 128;
for i=1:200
   tri(i:i, 1:i) = 200;
end

center = (512/2)-(200/2);
%size(img(center+1:center+200, center+1:center+200))
img(center+1:center+200, center+1:center+200) = tri;

figure;
subplot(231);
    imshow(img, [0 255]);

IMG = fftshift(fft2(img));
IMG_m = abs(IMG);
IMG_p = unwrap(angle(IMG));

subplot(232);
    imshow(log(IMG_m(1:128, 1:128)), []);
subplot(233);
    imshow(IMG_p, []);
    
IMGp = fft2(img, 612, 612);

subplot(234);
    imshow(real(log(IMGp)), []);
    
img_r = ifft2(IMGp);
phase = cos(angle(IMGp)) + 1i*sin(angle(IMGp));
img_rp = ifft2(phase);

subplot(235);
    imshow(real(img_r), []);
subplot(236);
    imshow(real(img_rp), []);
    
close all;

imgn = imnoise(mat2gray(img), 'gaussian', 0, 0.1);
f1 = fspecial('gaussian', 8, 5);
f2 = fspecial('gaussian', 8, 1);
f3 = fspecial('gaussian', 12, 5);
img1 = imfilter(imgn, f1);
img2 = imfilter(imgn, f2);
img3 = imfilter(imgn, f3);

subplot(141);
    imshow(imgn, []);
subplot(142);
    imshow(img1, []);
subplot(143);
    imshow(img2, []);
subplot(144);
    imshow(img3, []);
    
e1 = sum(sum(abs(img - img1))) / 512^2;
e2 = sum(sum(abs(img - img2))) / 512^2;
e3 = sum(sum(abs(img - img3))) / 512^2;

%stampo i valori
e1
e2
e3

fprintf("Il minore è : %.4f \n", min([e1, e2, e3])); %il igliore è il secondo
    
    

    





