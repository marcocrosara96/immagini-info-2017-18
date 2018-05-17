% [1] Primo Esercizio
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
Tcamp = 0.01;%ms
Tfine = 5*2;    %(*1) --> 2 poichè B ha un periodo doppio rispetto a quello
                %di A(frequenza dimezzata) e A ha un periodo di 1s
x = linspace(0, Tfine, Fcamp);%costruisco l'asse temporale

%costruisco i 3 segnali
y1 = 2*sin(2*pi*1*x) + 1*cos(2*pi*1*x);
y2 = 4*sin(2*pi*0.5*x); %frequenza dimezzata 0.5
ys = y1 + y2; %sommo A e B

figure;
    subplot(3,1,1);
        plot(x,y1);
    subplot(3,1,2);
        plot(x,y2);
    subplot(3,1,3);
        plot(x,ys);
        title('Somma dei segnali');
        xlabel('tempo');
        ylabel('ampiezza');
        %xlim([0 Tfine]); %superfluo

% [2] Secondo Esercizio
% Si rappresenti la densità spettrale di potenza del segnale y calcolato al
% punto precendente in modo che lo spettro sia centrato (a) sulla frequenza
% massima rappresentabile e (b) sullo zero.
% Inoltre, si scalino opportunamente l'asse orizzontale (in modo che
% corrisponda alla densità spettrale di potenza).

