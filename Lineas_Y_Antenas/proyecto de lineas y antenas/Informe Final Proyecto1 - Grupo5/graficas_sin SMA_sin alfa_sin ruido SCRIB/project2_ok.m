function [er, pTan]=project1s_ok(f,S11,S21,l,h,W)
l1Data = load('l2.s2p','-ascii')
disp('Calculo de parametros MICROSTRIP GRUPO 5')
%
%f=input('Ingrese la frecuencia de operacion (GHz) =')
%disp('')
%f=2:0.005:3;
%f=f.*(10.^9);
f=l1Data(:,1);
%S11=input('Ingrese el valor de S11 = ')
%disp('')
%
%S21=input('Ingrese el valor de S21 = ')
%disp('')

%l=input('Ingrese la longitud (cm)= ')
%disp('')
l=3.1491;
l=(l/100);
%h=input('Ingrese la altura del substrato (mm) = ')
h=1.6;
h=(h/1000);
%disp('')

%W=input('Ingrese el ancho W (cm) =')
W=0.3638;
W=(W/100);
%disp('')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% constantes
c=3*(10^8);
u0=4*pi*(10^(-7));
e0=8.85*(10^(-12));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      A
%l1Data = load('l1.s2p','-ascii')
S11=l1Data(:,2); 
figure(1)
plot(f,S11)
xlabel('frecuencia Hz')
ylabel('Parte real S11 (dB)')

S21=l1Data(:,4);
figure(2)
plot(f,S21)
xlabel('frecuencia Hz')
ylabel('Parte real S21 (dB)')

disp('parametro A:')
Afar=( (S11.^2).+(2.*S11).-(S21.^2).+1 );  
Afab=( (-1.*(S11.^2)).+(2.*S11).+(S21.^2).-1 );
A=(-1.*(Afar./Afab)).^(1/2);
figure(3)
plot(f,real(A))
xlabel('frecuencia Hz')
ylabel('Parte real parametro A')

%
Zr=50;
disp('impedancia  Zo:')
Zo=Zr.*A;
figure(4)
plot(f,real(Zo))
xlabel('frecuencia Hz')
ylabel('Parte real de Zo')
Zo=mean(Zo)
%%%%%%%%%%%%%%%%%  gamma
disp('Gamma:')
Gamma=((log((S21).*((A./2).+(1./2)).-(((S11.-1).*(S11.+S11.*A.-A.+1))./(2.*S21))))./-l);
%figure(5)
%plot(f,real(Gamma))
%xlabel('frecuencia Hz')
%ylabel('Parte real de Gamma')

%cduc=5.8*10^(-7);
%Rs=sqrt( (2*pi*f*u0)/(2*cduc));
%Zoa=1;
%alfa_c=( Rs./(Zoa.*W) );
%Gamma=Gamma-alfa_c;

%%%%%%%%%%%%%%%%% permitividad 
disp('Permitividad relativa efectiva:')
ereff= (-1.*((Gamma.^2).*(c.^2))./((2.*pi.*f).^2));

disp('Permitividad relativa:')
M=sqrt(1+(12*h/W));
er=(((2.*ereff).+(M.-1))./(M.+1));
figure(5)
plot(f,abs(er))
xlabel('frecuencia Hz')
ylabel('Parte real de er (permitividad relativa)')
er=mean(er)

disp('Perdidas tangenciales:')
pTan=((imag(er))./(real(er)));
figure(6)
plot(f,real(pTan))
xlabel('frecuencia Hz')
ylabel('Parte real de pTan(perdidas tangenciales)')
pTan=mean(pTan)
%%%%%%%%%%%%%%%%%% permitividad 
%disp('Permitividad relativa:')
%er= (-1*((Gamma^2)*((c)^2))/((2*pi*f)^2))
%%%%%%%%%%%%%%%%%
%disp('Permitividad electrica efectiva:')
%cte=((1+12*(h/W))^(-1/2));
%%%ereff=(((2*er)-1+cte)/(1+cte))
%ereff= ((er+1)/2)+(((er-1)/2)* ( (1+10*(h/W))^(-0.5) ))
%%%%%%%%%%%%%%%%%%%%%%
%disp('Perdidas tangenciales:')
%pTan=((imag(er))/(real(er)))
%
%%%% calculo de la impedancia caracteristica
%disp('Impedancia caracteristica:')
%zo=(120*pi) / (  (ereff^0.5)*( (W/h)+1.393+0.667*(log ((W/h) + 1.444 ) ) ) )
%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% calculo de W

%W =(c/(2*f))* ( (2/(er+1))^(1/2) )

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% calculo de 

%%%%%  calculo de la longitud efectiva
%disp('Longitud Efectiva....')
%Ld=0.412* (  (ereff+0.3)/(ereff-0.258) )* (  ( (W/h)+0.264 ) / ( (W/h) +0.813) )
%disp('Delta Longitud :')
%Ld= Ld/h
%Le=1/ ( 2*f*sqrt(ereff*u0*e0) );
%disp('Longitud :')
%L= Le-(2*Ld)
%
 
