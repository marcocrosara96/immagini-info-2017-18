%{
Costruire	un	segnale	z	ottenuto	come	somma	di
1) Un	segnale	seno	e	un	segnale	coseno	aventi	lo	stesso	periodo T0=1	s	usando	un	passo	di	
campionamento	pari	a	Ts=1ms
2) Un	segnale	seno	e	un	segnale	coseno	di	cui	il	secondo	ha	periodo	uguale	alla	metà	del	
primo
3) Rappresentare	tali	segnali	su	una	figura	usando	tutti	i	comandi	considerati
4) Traslare	entrambi	i	segnali	di	T0/4	dove	T0	è	il	periodo	e	rappresentarli
5) Fare	uno	scaling	di	entrambi	i	segnali	raddoppiandone	la	frequenza	e	rappresentarli
%}

%1
%{
x = linspace(0,1,1000);
y = sin(2*pi*x);
z = cos(2*pi*x);
u = y + z;
hold on
plot(x,y,'r');
plot(x,z,'g');
plot(x,u,'b');
hold off
xlabel('secondi');
ylabel('ampiezza');
%}

%2
%{
x = linspace(0,1,1000);
y = sin(2*pi*x);
z = cos(4*pi*x);
u = y + z;
hold on
plot(x,y,'r');
plot(x,z,'g');
plot(x,u,'b');
hold off
xlabel('secondi');
ylabel('ampiezza');
%}

x = linspace(0,1,1000);
t = (2*pi)/4;
t1 = (4*pi)/4;
y = sin(2*pi*x) + cos(2*pi*x);
y2 = sin(2*pi*x - t) + cos(2*pi*x - t);
y3 = sin((2*pi*x - t)*2) + cos((2*pi*x - t)*2);
u = sin(2*pi*x) + cos(4*pi*x);
u2 = sin(2*pi*x - t) + cos(4*pi*x - t1);
u3 = sin((2*pi*x - t)*2) + cos((4*pi*x - t1)*2);
hold on
figure
plot(x,y,'r');
plot(x,y2,'y');
plot(x,y3,'k');
plot(x,u,'g');
plot(x,u2,'b');
plot(x,u3,'m');
hold off
xlabel('secondi');
ylabel('ampiezza');

