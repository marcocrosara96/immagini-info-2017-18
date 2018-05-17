img = rgb2gray(imread('lena.jpg'));
box_mask = ones(size(img));
box_mask(257-50:257+49,257-50:257+49)=0;
box_mask2 = 1 - box_mask;

IMG = fftshift(fft2(img));

%low pass
IMG_lp = IMG .* box_mask2;
IMG_hp = IMG .* box_mask;

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