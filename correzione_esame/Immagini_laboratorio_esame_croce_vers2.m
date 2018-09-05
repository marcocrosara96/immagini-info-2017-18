cross = zeros(200, 200);
cross = cross + 200;
cross(1:90, 1:90) = 128;
cross(1:90, 110:200) = 128;
cross(110:200, 1:90) = 128;
cross(110:200, 110:200) = 128;

img = zeros(512, 512);
img = img + 128;
img(156:355, 156:355) = cross;

IMG = fftshift(fft2(img));

spettro_pot = log(abs(IMG(1:128, 1:128)));
spettro_fase = unwrap(angle(IMG));

figure;
subplot(1, 3, 1);
    imshow(img, [0, 255]);
subplot(1, 3, 2);
    imshow(spettro_pot, []);
subplot(1, 3, 3);
    imshow(spettro_fase, []);
    
close all;

IMGp = fft2(img, 612, 612);
imgr = ifft2(IMGp);

fase = cos(angle(IMGp)) + 1i * sin(angle(IMGp));
imgrf = ifft2(fase);

figure;
subplot(1, 3, 1);
    imshow(log(abs(IMGp)), []);
subplot(1, 3, 2);
    imshow(real(imgr), []);
subplot(1, 3, 3);
    imshow(real(imgrf), []);
    
close all;

imNoise = imnoise(mat2gray(img), 'gaussian', 0, 0.1);

f1 = fspecial('gaussian', 8, 5);
f2 = fspecial('gaussian', 8, 1);
f3 = fspecial('gaussian', 12, 5);

im1 = imfilter(imNoise, f1);
im2 = imfilter(imNoise, f2);
im3 = imfilter(imNoise, f3);

figure;
subplot(1, 4, 1);
    imshow(real(imNoise), []);
subplot(1, 4, 2);
    imshow(real(im1), []);
subplot(1, 4, 3);
    imshow(real(im2), []);
subplot(1, 4, 4);
    imshow(real(im2), []);
    
err1 = sum(sum(abs(img-im1))) / 512^2;
err2 = sum(sum(abs(img-im2))) / 512^2;
err3 = sum(sum(abs(img-im3))) / 512^2;

err1
err2
err3



