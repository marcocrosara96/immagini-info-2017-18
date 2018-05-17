%% Creo il dataset
clear all
close all
clc
name_vec = {'D1.gif','D3.gif','D4.gif','D18.gif','D23.gif','D28.gif','D36.gif','D52.gif','D66.gif','D87.gif'};
n_img = length(name_vec);

img = imread(['Brodatz/',name_vec{1}]);


labels_training = zeros(30*n_img,1);
training = zeros(30*n_img,128,128);
c=1;
for i=1:n_img;
    img = imread(['Brodatz/',name_vec{i}]);
    for j=1:30
            training(c,:,:)= extract_random_subregion(img, 128, 128); %prendo una regione casuale
            labels_training(c) = i;
        c=c+1;
    end
end

labels_testing = zeros(10*n_img,1);
testing = zeros(10*n_img,128,128);


c=1;
for i=1:n_img;
    img = imread(['Brodatz/',name_vec{i}]);
    for j=1:10
            testing(c,:,:)= extract_random_subregion(img, 128, 128);
            labels_testing(c) = i;
        c=c+1;
    end
end

%% Estraggo le feature
clc;

f_training = zeros(30*n_img,2);

for i=1:30*n_img;
    f_training(i,1) = mean(mean(squeeze(training(i,:,:))));
    f_training(i,2) = std2(squeeze(training(i,:,:)));
end

f_testing = zeros(10*n_img,2);
for i=1:10*n_img;
    f_testing(i,1) = mean(mean(squeeze(testing(i,:,:))));
    f_testing(i,2) = std2(squeeze(testing(i,:,:)));
end

colors= hsv(n_img);
figure;
for i=1:n_img;
    plot(f_training(((i-1)*30+1):((i-1)*30+30),1),f_training(((i-1)*30+1):((i-1)*30+30),2),'+','Color',colors(i,:))
    hold on
end
legend('C1','C2','C3','C4','C5','C6','C7','C8','C9','C10');
xlabel('Media')
ylabel('Varianza')

colors= hsv(n_img);
figure;
for i=1:n_img;
    plot(f_testing(((i-1)*10+1):((i-1)*10+10),1),f_testing(((i-1)*10+1):((i-1)*10+10),2),'+','Color',colors(i,:))
    hold on
end
legend('C1','C2','C3','C4','C5','C6','C7','C8','C9','C10');

labels_knn = my_knn(f_training,labels_training,f_testing,5);

error = sum(labels_testing~=labels_knn')

%%  Uso gli istogrammi
 
n_bin=10;
f_training = zeros(30*n_img,n_bin);

for i=1:30*n_img;
    [b,r] = my_histogram(training(i,:,:),n_bin);
    f_training(i,:) = r;
    
end

f_testing = zeros(10*n_img,n_bin);
for i=1:10*n_img;
    [b,r] = my_histogram(testing(i,:,:),n_bin);
    f_testing(i,:) = r;
    
end


colors= hsv(n_img);
figure;
for i=1:n_img;
        plot(b, f_training(((i-1)*30+1):((i-1)*30+30),:),'Color',colors(i,:))
        hold on
 
end

labels_knn = my_knn(f_training,labels_training,f_testing,5);

error = sum(labels_testing~=labels_knn')

%% Esempio Filtro di Gabor
close all
lambda  = 8;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 5;
img1 = squeeze(training(31,:,:));
figure
subplot(1,1,1)
imshow(img1,[])
for n=1:N
    gb = gabor_fn(bw,gamma,psi(1),lambda,theta) + 1i * gabor_fn(bw,gamma,psi(2),lambda,theta);
    % gb is the n-th gabor filter
    f = imfilter(img1, gb, 'symmetric');
    % filter output to the n-th channel
    theta = theta + 2*pi/N;
    % next orientation
    f2 = abs(f);
    
    %subplot(2,3,n+1)
    colormap jet;
    figure
    subplot(1,3,1)
    imagesc(real(gb))
    subplot(1,3,2)
    imagesc(imag(gb))
    subplot(1,3,3)
    imagesc(f2)
end


%% uso i filtri di gabor
lambda  = 2;
theta   = 0;
psi     = [0 pi/2];
gamma   = 0.5;
bw      = 1;
N       = 8;


f_training = zeros(30*n_img,N);

for i=1:30*n_img;
   theta=0;
   for n=1:N
    gb = gabor_fn(bw,gamma,psi(1),lambda,theta) + 1i * gabor_fn(bw,gamma,psi(2),lambda,theta);
    % gb is the n-th gabor filter
    f = imfilter(squeeze(training(i,:,:)), gb, 'symmetric');
    % filter output to the n-th channel
    theta = theta + 2*pi/N;
    % next orientation
    f2 = (abs(f).^2).^0.5;
    f_training(i,n)=mean2(f2);
   end
   i
    
end
f_testing = zeros(10*n_img,N);

for i=1:10*n_img;
   theta=0;
   for n=1:N
    gb = gabor_fn(bw,gamma,psi(1),lambda,theta) + 1i * gabor_fn(bw,gamma,psi(2),lambda,theta);
    % gb is the n-th gabor filter
    f = imfilter(squeeze(testing(i,:,:)), gb, 'symmetric');
    % filter output to the n-th channel
    theta = theta + 2*pi/N;
    % next orientation
    f2 = (abs(f).^2).^0.5;
    f_testing(i,n)=mean2(f2);
   end
   i
    
end

labels_knn = my_knn(f_training,labels_training,f_testing,5);

error = sum(labels_testing~=labels_knn')


