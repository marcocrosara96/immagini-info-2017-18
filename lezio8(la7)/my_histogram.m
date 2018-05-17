function [b,r] = my_histogram(img,n)

X = double(img(:));
max(X)
min(X)
l = linspace(0,255,n+1);

b  = round((l(1:n)+l(2:n+1))/2);

X = round(X/255.0*(n-1));
max(X)
min(X)
r= zeros(n,1);
for i=1:n
    r(i) = sum(X==(i-1));
end
