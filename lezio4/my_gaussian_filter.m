%GAUSSIANA
function G = my_gaussian_filter(x,y,alpha)
    r_max = floor(x/2);
    p_max = floor(y/2);
    r_sampling = 1;
    t = -r_max:r_sampling:x - r_max;
    v = -p_max:r_sampling:y - p_max;
    G = zeros(x, y);
    for i=1:x
        for j=1:y
            r = sqrt(t(i)^2 + v(j)^2);
             G(i,j) = exp(-alpha*r^2);
        end
    end