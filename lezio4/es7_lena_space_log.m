img = rgb2gray(imread('lena.jpg'));
h = fspecial('log',5,0.5);
img_laplace = imfilter(img,h);

figure
subplot(2,4,1)
imshow(h,[])
title('laplacian filter')
subplot(2,4,2)
imshow(img,[])
title('original')
subplot(2,4,3)
imshow(img_laplace,[])
title('laplace filtered')
subplot(2,4,4)
imshow(img-img_laplace,[])
title('original-laplace filtered')