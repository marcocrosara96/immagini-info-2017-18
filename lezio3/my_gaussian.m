%GAUSSIANA
function G = my_gaussian(r_max,r_sampling,alpha)
    t = -r_max:r_sampling:r_max;
    l = length(t);
    G = zeros(l,l);
    for i=1:l
        for j=1:l
            r = sqrt(t(i)^2 + t(j)^2);
             G(i,j) = exp(-alpha*r^2);
        end
    end