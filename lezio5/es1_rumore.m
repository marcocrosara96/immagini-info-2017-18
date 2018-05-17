img = rgb2gray(imread('lena.jpg'));
%Gaussiano
img_noise1 = imnoise(img,'gaussian',0.67, 0.01);
%Salt & Pepper
img_noise2 = imnoise(img,'salt & pepper',0.05);

figure;
subplot(1,3,1);
imshow(img,[]);

subplot(1,3,2);
imshow(img_noise1,[]);

subplot(1,3,3);
imshow(img_noise2,[]);