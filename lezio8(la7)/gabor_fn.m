function gb=gabor_fn(bw,gamma,psi,lambda,theta)
% bw    = bandwidth, (1)
% gamma = aspect ratio, (0.5)
% psi   = phase shift, (0)
% lambda= wave length, (>=2)
% theta = angle in rad, [0 pi)
 
sigma = lambda/pi*sqrt(log(2)/2)*(2^bw+1)/(2^bw-1);
sigma_x = sigma;
sigma_y = sigma/gamma;

sz=fix(8*max(sigma_y,sigma_x));
if mod(sz,2)==0, sz=sz+1;end

% alternatively, use a fixed size
% sz = 60;
 
[x y]=meshgrid(-fix(sz/2):fix(sz/2),fix(sz/2):-1:fix(-sz/2));
% x (right +)
% y (up +)

% Rotation 
x_theta=x*cos(theta)+y*sin(theta);
y_theta=-x*sin(theta)+y*cos(theta);
 
gb=exp(-0.5*(x_theta.^2/sigma_x^2+y_theta.^2/sigma_y^2)).*cos(2*pi/lambda*x_theta+psi);
%figure
%imshow(gb/2+0.5);
% 
% function gb=gabor_fn(sigma,theta,lambda,psi,gamma)
% 
% sigma_x = sigma;
% sigma_y = sigma/gamma;
% 
% Bounding box
% nstds = 3;
% xmax = max(abs(nstds*sigma_x*cos(theta)),abs(nstds*sigma_y*sin(theta)));
% xmax = ceil(max(1,xmax));
% ymax = max(abs(nstds*sigma_x*sin(theta)),abs(nstds*sigma_y*cos(theta)));
% ymax = ceil(max(1,ymax));
% xmin = -xmax; ymin = -ymax;
% [x,y] = meshgrid(xmin:xmax,ymin:ymax);
% 
% Rotation 
% x_theta=x*cos(theta)+y*sin(theta);
% y_theta=-x*sin(theta)+y*cos(theta);
% 
% gb= exp(-.5*(x_theta.^2/sigma_x^2+y_theta.^2/sigma_y^2)).*cos(2*pi/lambda*x_theta+psi);