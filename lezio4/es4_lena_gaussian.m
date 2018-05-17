img = rgb2gray(imread('lena.jpg'));
[x,y] = size(IMG);
alpha = 0.0001;
g_mask_l = my_gaussian_filter(x,y, alpha);
g_mask_h = 1 - g_mask_l;

IMG = fftshift(fft2(img));

%low pass
IMG_lp = IMG .* g_mask_l;
IMG_hp = IMG .* g_mask_h;

img_lp = ifft2(ifftshift(IMG_lp));
img_hp = ifft2(ifftshift(IMG_hp));

figure;
subplot(2,2,1);
imshow(log(abs(IMG_lp)),[]);

subplot(2,2,2);
imshow(log(abs(IMG_hp)),[]);

subplot(2,2,3);
imshow(img_lp,[]);

subplot(2,2,4);
imshow(img_hp,[]);