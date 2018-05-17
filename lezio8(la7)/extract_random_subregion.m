function img2= extract_random_subregion(img, x2, y2)

img2 = zeros(x2,y2);


[x1,y1] = size(img);

x_max = x1-x2+1;
y_max = y1-y2+1;

sx = floor(rand(1)*x_max)+1;
sy = floor(rand(1)*y_max)+1;

[sx,sy]
img2 = img(sx:sx+x2-1,sy:sy+y2-1);

r = rand(1);

if r>0.6;
    img2 = imrotate(img2,180);
end


if r>0.3 & r<=0.6;
    img2 = imrotate(img2,90);
end

img2 = uint8(img2);
