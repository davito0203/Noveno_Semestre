function g12=integral(x)
c=299792458;
mu=pi*4e-7;
ep=1/(c^2*mu);
f=5.8e9;
k0=2*pi*f*sqrt(mu*ep);
er=4.34;%epsilon relativo
h=0.711e-3;%Altura en metros
w=c/(2*f)*sqrt(2/(er+1));%Medida en metros
erf=(er+1)/2+(er-1)/2*(1+12*h/w)^(-1/2);
lref=c/(2*f*sqrt(erf));
deltal=0.412*h*(erf+0.3)*(w/h+0.264)/((erf-0.258)*(w/h+0.8));
l=lref-2*deltal;

g12=(sin((k0.*w/.2).*cos(x))./cos(x)).^2.*besselj(0,k0*l*sin(x)).*(sin(x)).^3;