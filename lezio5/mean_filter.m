function img2 = mean_filter(img,f_size)
    [x,y] = size(img);
    img2 = zeros(x,y);
    % find centers
    c = floor(f_size/2);
    for i=(c+1):x-(c+1)
        for j=(c+1):y-(c+1)
            img_roi = img(i-c:i+c, j-c:j+c);
            img2(i,j) = mean(img_roi(:));
        end
    end
    img2 = uint8(img2);
end