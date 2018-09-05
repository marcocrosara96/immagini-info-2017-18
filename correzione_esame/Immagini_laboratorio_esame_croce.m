% [1 - punto 1] Primo Esercizio
% Costruire un segnale y ottenuto come somma di:
%   - a. La somma di un segnale seno (con ampiezza 2) e un segnale coseno (con
%   ampiezza 1) aventi lo stesso periodo di 1 s, usando passo di 
%   campionamento pari a 1 campione ogni 10ms (frequenza di campionamento: 
%   100 Hz)
%   - b. Un segnale seno con frequenza dimezzata rispetto ai primi due (con
%   ampiezza 4) 
% Si rappresenti il segnale per un tempo pari a 5 periodi del segnale al
% punto b. (*1)

clear;

%periodo = 2*pi/coeff(X)

Fcamp = 100;%Hz
Tcamp = 1/Fcamp% 0.01ms
Tfine = 5*2;    %(*1) --> 2 poichè B ha un periodo doppio rispetto a quello
                %di A(frequenza dimezzata) e A ha un periodo di 1s
t = linspace(0, Tfine, Fcamp);%costruisco l'asse temporale
%x = 0:Tcamp:Tfine; %ALTERNATIVA

%costruisco i 3 segnali
y1 = 2*sin(2*pi*1*t) + 1*cos(2*pi*1*t); %y=A*sin(2*pi*f*t)
y2 = 4*sin(2*pi*0.5*t); %frequenza dimezzata 0.5
y = y1 + y2; %sommo A e B

figure;
subplot(3,1,1); %subplot vuole il numero di righe, il numero di colonne, dove posizionarle
    plot(t,y);
    title('Somma dei segnali');
    xlabel('tempo');
    ylabel('ampiezza');
    xlim([0 Tfine]); %superfluo

% [1 - punto 2]
% Si rappresenti la densità spettrale di potenza del segnale y calcolato al
% punto precendente in modo che lo spettro sia centrato (a) sulla frequenza
% massima rappresentabile e (b) sullo zero.
% Inoltre, si scalino opportunamente l'asse orizzontale (in modo che
% corrisponda alla densità spettrale di potenza).

Fmax = Fcamp;

f = 0:Fcamp/(length(t)-1):Fmax;
Y = fft(y);

fs = -Fmax/2:Fcamp/(length(t)-1):Fmax/2;
Ys = fftshift(Y);

subplot(3,1,2); 
    plot(f,Y);
    title('FFT');
    xlabel('frequenze');
    ylabel('ampiezza');
    xlim([0 Fmax]); %superfluo
subplot(3,1,3);
    plot(fs,Ys);
    title('FFTshift');
    xlabel('frequenze');
    ylabel('ampiezza');
    xlim([-Fmax/2 Fmax/2]); %superfluo
    
%[1 - punto 3] Costruire un seganle composto da una sinusoide a 2Hz e una a 2.5Hz
%(si utilizzi la frequenza di campionamento del punto [1]). Se ne calcoli
%la trasformata di fourier. si utilizzi lo zero padding per modificare la
%dimensione dei frequency bins e poter meglio identificare visivamente le
%due sinusoidi nel dominio delle frequenze.

close all;

y = sin(2*pi*2*t) + sin(2*pi*2.5*t);

Y = fft(y);

padding = 250;

figure;
subplot(3,1,1);
    plot(t,y);
    title('Somma dei segnali');
    xlabel('tempo');
    ylabel('ampiezza');
    xlim([0 Tfine]); %superfluo

close all;
clear;

%[2 - punto a]
% creare una immagine di dimensioni 512x512 a 256 livelli di grigio e
% disegnarvi una croce nel centro corrispondente a livello di grigio 200 su
% sfondo a livello di grigio 128 (per le misure si veda l'immagie sotto 
% riportata).
% a. Calcolare la trasfrmata di fourier e centrare lo spettro al centro
% dell'immagine. Visualizzare in una figura a subplot l'immagine di
% partenza, lo spettro di potenza [rappresentare solo la porzione (1:128, 
% 1:128)] e lo spettro di fase.

%costruisco l'immagine della croce interna.
%creo una matrice 200x200 di colore 200 (il primo valore tra parentesi 
%corrisponde alla y, mentre il secondo alla x)
cross = zeros(200,200);
cross = cross + 200; %aumento i valori per mettere la matrice a grigio
cross(1:90, 1:90) = 128;
cross(110:200, 1:90) = 128;
cross(1:90, 110:200) = 128;
cross(110:200, 110:200) = 128;

%posiziono la croce al centro dell'immagine 512x512 per farlo posso usare 
%padarray oppure creare una nuova matrice e posizionare la croce
%all'interno
img = zeros(512,512);
img = img + 128;
%dobbiamo posizionare cross in mat
img(156:355, 156:355) = cross; %355 perchè l'ultimo è incluso

IMG = fftshift(fft2(img)); %fft2 perchè ho una matrice, quindi due 
%dimensioni fftshift serve a traslare lo spettro

%limito la porzione che vado a visualizzare (1:128, 1:128)
spettro_pot = log(abs(IMG(1:128, 1:128))); %il log serve a visualizzarla meglio
spettro_fase = unwrap(angle(IMG)); %unwrap serve per visualizzarle, "l'angolo"

figure;
subplot(1,3,1);
    title("croce: imm. originale");
    imshow(img, [0 255]);
subplot(1,3,2);
    title("spettro potenza");
    imshow(spettro_pot, []);
subplot(1,3,3);
    title("spettro fase");
    imshow(spettro_fase, []);
    
%close all;
    
%[2 - punto a]
% Fare lo zero padding(raggiungere le dimensioni 612x612) tramite le
% apposite opzioni del comando per ottenere la trasformata di Fourier e
% ricalcolare la trasformata. Creare quindi una nuova figura a subplot in
% cui visualizzare la trasformatacosì ottenuta e l'immagine di partenza
% ricostruita a partire da:
% - la trasformata zero padded
% - il solo contributo della fase

IMG_pad = fft2(img, 612, 612); %gli spazi non occupati dall'immagine sono zeri

img_ricostruita = ifft2(IMG_pad);

%la fase è cos(angolo) + i*sin(angolo)
fase = cos(angle(IMG_pad)) + 1i * sin(angle(IMG_pad));
img_ricostruita_da_fase = ifft2(fase);

figure;
subplot(1, 3, 1);
    imshow(log(abs(IMG_pad)), []); %quando visualizzo la trasformata di fourier devo sempre visualizzarne il
    %modulo (abs) e farne il log per vederla meglio
subplot(1, 3, 2);
    imshow(real(img_ricostruita), []); %real per evitare il warning
subplot(1, 3, 3);
    imshow(real(img_ricostruita_da_fase), []);
    
%close all;

%[3 - punto a]
% Aggiungere rumore gaussiano all'immagine di partenza (media = 0, varianza
% = 0.1). a) filtrare l'immagine con tre diversi filtri gaussiani:
% - Grandezza del filtro = 8; deviazione standard = 5
% - Grandezza del filtro = 8; deviazione standard = 1
% - Grandezza del filtro = 12; deviazione standard = 5

%aggiungiamo rumore gaussiano all'immagine
%mat2grey porta il colore da 0-255 a 0-1
imgNoise = imnoise(mat2gray(img), 'gaussian', 0, 0.1);
%creo i filtri richiesti (per togliere il rumore)
filtro1 = fspecial('gaussian', 8, 5);
filtro2 = fspecial('gaussian', 8, 1);
filtro3 = fspecial('gaussian', 12, 5);
%applico i filtri all'immagine con il rumore
imgF1 = imfilter(imgNoise, filtro1);
imgF2 = imfilter(imgNoise, filtro2);
imgF3 = imfilter(imgNoise, filtro3);
%visualizzo le immagini, compresi i filtri
figure;
subplot(2, 2, 1);
    imshow(real(imgNoise), []);
    title('imm con rumore');
subplot(2, 2, 2);
    imshow(real(imgF1), []);
    title('imm filtro 1');
subplot(2, 2, 3);
    imshow(real(imgF2), []);
    title('imm filtro 2');
subplot(2, 2, 4);
    imshow(real(imgF3), []);
    title('imm filtro 3');

%[3 - punto b]
% Decretare i valori migliori calcolando l'errore del filtraggio.
% Visualizzare in un plot l'immagine con rumore e i risulati dei tre
% filtraggi

%calcoliamo i 3 errori per capire quale sia il filtro migliore
%non possiamo fare la sottrazione semplice perchè ritornerebbe una matrice
%andiamo quindi a sommare righe e colonne
err1 = sum(sum(abs(img-imgF1)))/512^2;
err2 = sum(sum(abs(img-imgF2)))/512^2;
err3 = sum(sum(abs(img-imgF3)))/512^2;

fprintf("Errore1: %f \n", err1);
fprintf("Errore2: %f \n", err2);
fprintf("Errore3: %f \n", err3);

%Il filtro migliore sembra essere il numero 2
