img = rgb2gray(imread('lena.jpg'));
%Salt & Pepper
img_noise1 = imnoise(img,'salt & pepper',0.05);

%Gaussiano --> mean filter
denoise_median= median_filter(img_noise1,4);
denoise_mean = mean_filter(img_noise1, 4);

h = fspecial('gaussian', 5, 2.0);
denoise_gaussian= imfilter(img_noise1, h);
figure;

subplot(2,2,1);
imshow(img, []);

subplot(2,2,2);
imshow(denoise_mean, []);

subplot(2,2,3);
imshow(denoise_median, []);

subplot(2,2,4);
imshow(denoise_gaussian, []);
