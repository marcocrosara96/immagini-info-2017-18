img1 = checkerboard(8,16);%8x8 --> 8 è la dimensione del quadratino
img2 = checkerboard(16,8);%16x16
img3 = checkerboard(32,4);%32
img4 = checkerboard(64,2);%64

img1 = img1>0.5;
img2 = img2>0.5;
img3 = img3>0.5;
img4 = img4>0.5;

figure;

subplot(2,2,1);
imshow(img1>0.5, []);

subplot(2,2,2);
imshow(img2>0.5, []);

subplot(2,2,3);
imshow(img3>0.5, []);

subplot(2,2,4);
imshow(img4>0.5, []);