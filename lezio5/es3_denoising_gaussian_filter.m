img = rgb2gray(imread('lena.jpg'));
%Gaussiano
img_noise1 = imnoise(img,'gaussian',0, 0.01);
%Salt & Pepper
img_noise2 = imnoise(img,'salt & pepper',0.05);

%Gaussiano --> mean filter
img_noise1_de = mean_filter(img_noise1,4);
%Salt & Pepper --> mean filter
img_noise2_de = mean_filter(img_noise2,4);


h = fspecial('gaussian', 5, 2.0);
%Gaussiano --> gaussian filter
img_noise1_deg = imfilter(img_noise1, h);
%Salt & Pepper --> gaussian filter
img_noise2_deg = imfilter(img_noise2, h);

figure;
subplot(3,2,1);
imshow(img_noise1,[]);

subplot(3,2,2);
imshow(img_noise2,[]);

subplot(3,2,3);
imshow(img_noise1_de,[]);

subplot(3,2,4);
imshow(img_noise2_de,[]);

subplot(3,2,5);
imshow(img_noise1_deg,[]);

subplot(3,2,6);
imshow(img_noise2_deg,[]);