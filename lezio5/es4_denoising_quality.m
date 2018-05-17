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

%valutiamo la qualità del miglioramento con il denoising
diff1_de = sum(sum(abs(img-img_noise1_de)));
diff1_de
diff2_de = sum(sum(abs(img-img_noise2_de)));
diff2_de

diff1_deg = sum(sum(abs(img-img_noise1_deg)));
diff1_deg
diff2_deg = sum(sum(abs(img-img_noise2_deg)));
diff2_deg

%il valore minore è il più ottimo