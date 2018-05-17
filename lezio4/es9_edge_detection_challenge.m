img_saggittal = imresize(imread('saggittal.png'),2);
img_coronal = imresize(imread('coronal.png'),2);

figure
subplot(3,2,1)
imshow(img_saggittal>100,[])
subplot(3,2,2)
imshow(img_coronal>100,[])

subplot(3,2,3)
imshow((img_saggittal>20)<100,[])
subplot(3,2,4)
imshow(img_coronal,[])

subplot(3,2,5)
imshow(img_saggittal<20,[])
subplot(3,2,6)
imshow(img_coronal<20,[])