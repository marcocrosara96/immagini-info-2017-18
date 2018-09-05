lena = imread('lena.jpg');
lena = rgb2gray(lena);
LENA = fftshift(fft2(lena));
LENA_M = abs(LENA);
LENA_P = unwrap(angle(LENA));
LENA_P2 = cos(angle(fft2(lena))) + 1i * sin(angle(fft2(lena)));

lena_ = ifft2(ifftshift(LENA));
lena_m_ = ifft2(ifftshift(LENA_M));
lena_p_ = ifft2(LENA_P2);

figure;
subplot(331);
    imshow(lena);
    title("immagine");
subplot(332);
    imshow(real(log(LENA)), []);
    title("fft2");
subplot(333);
    imshow(log(LENA_M), []);
    title("only magnitude - modulo");
subplot(334);
    imshow(real(log(LENA_P)), []);
    title("only phase");
subplot(335);
    imshow(lena_, []);
    title("recostruction");
subplot(336);
    imshow(lena_m_, [0, 255]);
    title("recostruction only magnitude");
subplot(337);
    imshow(real(lena_p_), []);
    title("recostruction only phase");
    
clear;
close all;


lena = rgb2gray(imread('lena.jpg'));

step = zeros(1, 100);
step(1:50) = 0.8;
step = repmat(step, 100, 1);

random = rand(200,200);

figure;
subplot(321);
    imshow(lena);
subplot(322);
    imhist(lena);
    xlabel("valore di grigio");
    ylabel("occorrenza del valore");
subplot(323);
    imshow(step, [0, 1]);
subplot(324);
    imhist(step);
subplot(325);
    imshow(random, [0, 1]);
subplot(326);
    imhist(random);
    %xlim([0 50]);
    
clear;
close all;


Fcamp = 1000;
Tcamp = 1/Fcamp;
Tfine = 2*4;
t = 0 : Tcamp : Tfine; 
y = sin(2*pi*(1/4)*t); % sin(... + pi) <---- NB!! l'ho sfasato

%f= -Fcamp/2 : Fcamp/(length(t)-1): Fcamp/2;
f = (0: length(t) - 1) * Fcamp / (length(t) - 1);
%f = 0 : Tcamp : 1000;
Y = fftshift(fft(y));
Y_m = abs(Y);
Y_p = unwrap(angle(Y));

figure;
subplot(161);
    plot(t, y);
    xlim([0, 8]);
subplot(162);
    plot(f, real(Y));
    %xlim([-1, 1]);
subplot(163);
    plot(f, Y_p*2);
subplot(164);
    plot(f, (Y_m * 180) / pi);

clear;
close all;

Fcamp = 100;
Tcamp = 1/Fcamp;
t = -5 : Tcamp : 5; 
alpha = 1;
xDomain = t;
y = exp(- alpha * (xDomain .^ 2));

Y = fftshift(fft(y));

u = rgb2gray(imresize(imread('peppers.png'),[300, 300]));

U = fftshift(fft2(u));
f = ones(300,300);
f(100:200, 100:200) = 0;
U = U .* f;
ui = ifft2(ifftshift(U));

%imshow(f, [0 1]);


figure;
subplot(141);
    plot(t, y);
subplot(142);
    plot(t, real(Y));
    xlim([-0.5 : 0.5]);
subplot(143);
    imshow(u);
subplot(144);
    imshow(real(ui)>0.9, []);
    
clear;
close all;

checker = checkerboard(100,3,3);

figure;
subplot(131);
    imshow(checker);
subplot(132);
    plot(imhist(checker));






    







