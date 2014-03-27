clear all; format long;
%--------------------------------------------------------------------------
%Constantes fisicas
c=299792458;
mu=pi*4e-7;
ep=1/(c^2*mu);
%--------------------------------------------------------------------------
%Constantes del diseno
n=4;%numero de antenas
f=5.8e9;
er=4.34;%epsilon relativo
h=0.711e-3;%Altura en metros
w=c/(2*f)*sqrt(2/(er+1));%Medida en metros
erf=(er+1)/2+(er-1)/2*(1+12*h/w)^(-1/2);
lref=c/(2*f*sqrt(erf));
deltal=0.412*h*(erf+0.3)*(w/h+0.264)/((erf-0.258)*(w/h+0.8));
L=lref-2*deltal;
%lambdam=c/(f*sqrt(erf));
lammd0=c/f;
k0=(2*pi)/lammd0;
X=k0*w;
Si=quad(@(x)sinc(x/pi),0,X);
Ge= (-2+cos(X)+X*Si+(sin(X)/X))/(120*(pi)^2);
A=1/(120*(pi)^2);
B=quad(@(O)((sin(X/2.*cos(O))./cos(O)).^2).*besselj(0,k0*L*sin(O)).*(sin(O)).^3,0,pi);
G12=A*B;
Rin=1/(2*(Ge+G12));
