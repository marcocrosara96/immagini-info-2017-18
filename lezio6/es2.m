zero_(1:256)=0;
img = repmat(zero_,length(zero_),1);
img_noise = imnoise(img,'gaussian',0.1, 0.3);

figure;
imshow(img_noise, []);