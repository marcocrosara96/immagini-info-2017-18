img = rgb2gray(imread('lena.jpg'));
h = fspecial('sobel');
h2 = h';
img_sobel_VE = imfilter(img,h);
img_sobel_HO = imfilter(img,h2);

figure
subplot(2,3,1)
imshow(h,[])
title('sobel VERTICAL filter')
subplot(2,3,2)
imshow(img_sobel_VE,[])
title('sobel VERTICAL filtered')
subplot(2,3,3)
imshow(img_sobel_VE>100,[])
title('sobel VERTICAL filtered > 100')
subplot(2,3,4)
imshow(h2,[])
title('sobel HORIZONTAL filter')
subplot(2,3,5)
imshow(img_sobel_HO,[])
title('sobel HORIZONTAL filtered')
subplot(2,3,6)
imshow(edge(img_sobel_HO),[])
title('sobel HORIZONTAL filtered > 100')