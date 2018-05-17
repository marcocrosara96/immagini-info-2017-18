img = rgb2gray(imread('lena.jpg'));
h = fspecial('gaussian',11,10.0)
dog = fspecial('gaussian',11,5.0)
img_gaus = imfilter(img,h);
img_dog = imfilter(img,dog);

figure
subplot(2,3,1)
imshow(img,[])
title('original')
subplot(2,3,2)
imshow(img_gaus,[])
title('gaussian filtered')
subplot(2,3,3)
imshow(img-img_gaus,[])
title('original-gaussian filtered')

subplot(2,3,4)
imshow(img_dog-img_gaus,[])
title('DOG')