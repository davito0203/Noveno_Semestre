clear all; format long;
num=200;
den=[1 10 100];
g1=tf(num,den);
%bode(g1)
%--------------------------------------------------------------------------
den1=den(3); den2=num; error=3/100;
kc=kc(num,den1,den2,error);
num1=200*kc;
den1=[1 10 100];
glc=tf(num1,den1);
[gm,pm,wp,wg] = margin(glc);%función para determinar las fases y ganancias del sistema
bode(glc)
grid;
%--------------------------------------------------------------------------
%Para determinar el adelanto
phasem=55;%grtados de fase
th=5;
yu=phasem-pm;
thm=yu+th;%Paso 3wgp=94.25317475;
b=(1+sin(thm*pi/180))/(1-sin(thm*pi/180));
gmp=6.124694582;%nueva fase para w=94.25317475
wgp=94.25317475;
t2=1/(sqrt(b)*wgp);
num2=kc*[t2*b 1];
den2=[t2 1];
numt=conv(num,num2);
dent=conv(den,den2);
glct=tf(numt,dent);
hold;
bode(glct)
%--------------------------------------------------------------------------
%Adelanto practico
load('adelanto.txt');
tiempo = adelanto(:,1);
entrada = adelanto(:,2);
compensador = adelanto(:,3);
salida = adelanto(:,4);
vect=[tiempo salida];

% ejep=iddata(Y,E,0.001);
% gain=etfe(ejep,2^10,2^9);
% bode(gain)
% grid on;