x = linspace(0,1,1000);
s1 = sin(2*pi*x) + cos(2*pi*x);
s2 = sin(2*pi*x) + cos(4*pi*x);
s3 = sin(2*pi*x + pi/2) + cos(2*pi*x + pi/2);
s4 = sin(2*pi*x + pi/2) + cos(2*(2*pi*x + pi/2));
s5 = sin((2*pi*x + pi/2)*2) + cos((2*pi*x + pi/2)*2);
s6 = sin((2*pi*x + pi/2)*2) + cos(2*(2*pi*x + pi/2)*2);
subplot(3,2,1)
plot(x,s1);
title('sin(2*pi*x) + cos(2*pi*x)');
subplot(3,2,2)
plot(x,s2);
title('sin(2*pi*x) + cos(4*pi*x)');
subplot(3,2,3)
plot(x,s3);
title('sin(2*pi*x + pi/2) + cos(2*(2*pi*x + pi/2))');
subplot(3,2,4)
plot(x,s4);
title('sin(2*pi*x + pi/2) + cos(2*(2*pi*x + pi/2))');
subplot(3,2,5)
plot(x,s5);
title('sin((2*pi*x + pi/2)*2) + cos((2*pi*x + pi/2)*2)');
subplot(3,2,6)
plot(x,s6);
title('sin((2*pi*x + pi/2)*2) + cos(2*(2*pi*x + pi/2)*2)');