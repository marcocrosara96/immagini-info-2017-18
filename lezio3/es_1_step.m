%{
• Creare uno step 2D (l totale = 150)
• Calcolare la FFT e visualizzare lo spettro
• Portare lo spettro al centro del quadrante e visualizzarlo
%}
%GRADINO 2D
step_(1:74)=0;
step_(75:150)=1;
%plot(step_fot)
step_2D = repmat(step_,length(step_),1);
step_2D_T = fft2(step_2D);
step_2D_Ts = fftshift(step_2D_T);
figure;

subplot(1,5,1);
plot(step_);
title('step');

subplot(1,5,2);
imshow(step_2D,[]);
title('step 2D image');

subplot(1,5,3);
imshow(step_2D_T,[]);
title('fft');

subplot(1,5,4);
imshow(step_2D_Ts,[]);
title('fft shift');

subplot(1,5,5);
imshow(step_2D_Ts(70:80,70:80),[]);
title('fft shift: ZOOM');