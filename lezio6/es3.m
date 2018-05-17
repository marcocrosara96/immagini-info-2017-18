rect1 = [0 0 256 256]

img1 = checkerboard(8,16);%8x8 --> 8 è la dimensione del quadratino
img1 = imresize(img1, 4); %interpolazione con ingrandimento 4
img1 = imcrop(img1,rect1); % mantengo l'immagine di 256x256

img2 = checkerboard(16,8);%16x16
img2 = imresize(img2, 4);
img2 = imcrop(img2,rect1);

img3 = checkerboard(32,4);%32
img3 = imresize(img3, 4);
img3 = imcrop(img3,rect1);

img4 = checkerboard(64,2);%64
img4 = imresize(img4, 4);
img4 = imcrop(img4,rect1);

%disturbo gaussiano
zero_(1:256)=0;
img5 = repmat(zero_,length(zero_),1);
img5 = imnoise(img5,'gaussian',0.1, 0.3);
img5 = imresize(img5, 4);
img5 = imcrop(img5,rect1);

%rice
img6 = imread('rice.png');
img6 = imresize(img6, 4);
img6 = imcrop(img6,rect1);

img1 = img1>0.5;
img2 = img2>0.5;
img3 = img3>0.5;
img4 = img4>0.5;

figure;

subplot(3,2,1);
imshow(img1, []);

subplot(3,2,2);
imshow(img2, []);

subplot(3,2,3);
imshow(img3, []);

subplot(3,2,4);
imshow(img4, []);

subplot(3,2,5);
imshow(img5, []);

subplot(3,2,6);
imshow(img6, []);