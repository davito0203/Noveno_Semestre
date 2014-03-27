%Constantes físicas
clear all; format long;
mu0=pi*4e-7;% Permeabilidad magnetica en el vacio
c=299792458;% Velocidad de la luz en el vacio
ep0=1/(mu0*c^2);% Permitividad electrica en el vacio
%--------------------------------------------------------------------------
sigma=5.813e7;% Conductividad del cobre
%--------------------------------------------------------------------------
%Condiciones Físicas
w=4e-3;
l=75e-3;
h=1.66e-3;
t=50e-6;
%--------------------------------------------------------------------------
load data.txt
f=data(:,1);
s_rcc=data(:,2);
s_icc=1i*data(:,3);
s_cc=s_rcc+s_icc;
%--------------------------------------------------------------------------
z0con=50;
% Impedancia de entrada para el corto circuito
for k=1:1:length(f)
    zincc(k,:)=-z0con*(s_cc(k)+1)/(s_cc(k)-1);
end
%--------------------------------------------------------------------------
% Gamma transmitido a la linea
for k=1:1:length(f)
    betalin(k,:)=2*pi*f(k)./c;%beta al final de la linea de 50 ohms
    gammalin(k,:)=s_cc(k)*exp(-2*1i*betalin(k)*l);%gamma que entra  a la linea en CC
end
% 
% for k=1:1:length(f)
%     zclcc(k,:)=zincc(k)*(1-gammalin(k))/(1+gammalin(k));
% end
%--------------------------------------------------------------------------
% for k=1:1:length(f)
%     alfaline(k,:)=-1/(l)*log(abs(gammalin(k)));
%     betaline(k,:)=(angle(gammalin(k)));
% end
% betaline=unwrap(2*betaline)/(2*l);
% for k=1:1:length(f)
%     erefcc(k,:)=((betaline(k).*c)./(2*pi.*f(k)))^2;
% end
for k=1:1:length(f)
    gammaline(k,:)=acoth((gammalin(k)+1)/(1-gammalin(k)));
end
alfaline=real(gammaline);
betaline=6*pi*angle(gammaline);
erf=(betaline.*c./(2.*pi.*f)).^2;