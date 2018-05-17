img = rgb2gray(imread('lena.jpg'));
%Gaussiano
img_noise1 = imnoise(img,'gaussian',0, 0.01);
%Salt & Pepper
img_noise2 = imnoise(img,'salt & pepper',0.05);

%Gaussiano --> mean filter
img_noise1_de = mean_filter(img_noise1,4);
%Salt & Pepper --> mean filter
img_noise2_de = mean_filter(img_noise2,4);

figure;
subplot(2,2,1);
imshow(img_noise1,[]);

subplot(2,2,2);
imshow(img_noise2,[]);

subplot(2,2,3);
imshow(img_noise1_de,[]);

subplot(2,2,4);
imshow(img_noise2_de,[]);