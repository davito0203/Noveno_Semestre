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
h=1.2e-3;
t=50e-6;
%--------------------------------------------------------------------------
load data.txt
f=data(:,1);
s_roc=data(:,2);
s_ioc=1i*data(:,3);
s_rcc=data(:,4);
s_icc=1i*data(:,5);
s_oc=s_roc+s_ioc;
s_cc=s_rcc+s_icc;
%--------------------------------------------------------------------------
% load data_project.txt
% f=data_project(:,1);
% s_roc=data_project(:,2);
% s_ioc=1i*data_project(:,3);
% s_rcc=data_project(:,4);
% s_icc=1i*data_project(:,5);
%--------------------------------------------------------------------------
%Conversion de unidades
% for v=1:1:length(f)
% s_roc(v,:)=10.^(s_roc(v)/20);
% s_ioc(v,:)=s_ioc(v)*pi/180;
% s_roc(v,:)=s_roc(v)*cos(s_ioc(v));%Parte real de gammalL
% s_ioc(v,:)=1i*s_roc(v)*sin(s_ioc(v));%Parte Imaginaria de gammaL
% s_rcc(v,:)=10.^(s_rcc(v)/20);%conversion a magnitud
% s_icc(v,:)=s_ioc(v)*pi/180;%conversion a radianes
% s_rcc(v,:)=s_roc(v)*cos(s_ioc(v));%Parte real de gammalL
% s_icc(v,:)=1i*s_roc(v)*sin(s_ioc(v));%Parte Imaginaria de gammaL
% end
for k=1:1:length(f)
    gammaocl(k,:)=acoth((s_oc(k)+1)/(1-s_oc(k)));
end
alfaocl=real(gammaocl);
betaocl=unwrap(2.*angle(gammaocl))./2;
figure;
plot(f,betaocl)
grid on;
title('Beta Open')
for k=1:1:length(f)
    ereffoc(k,:)=((betaocl(k,:).*c)/(2*pi.*f(k)*l))^2;
    eroc(k,:)=epsilonrelative(ereffoc(k,:),h,w);
end
figure;
plot(f,eroc)
title('epsilon Relative Open')
grid on;
for k=1:1:length(f)
    gammacc(k,:)=atanh(((s_rcc(k)+s_icc(k))+1)/(1-(s_rcc(k)+s_icc(k))))/l;
%     mgammacc(k,:)=abs(gammacc(k));
%     agammacc(k,:)=angle(gammacc(k));
%     gammacc(k,:)=mgammacc(k,:).*exp(1i*agammacc(k,:));
    alfacc(k,:)=real(gammacc(k));
    betacc(k,:)=imag(gammacc(k));
    ereffcc(k,:)=((betacc(k,:).*c)/(2*pi.*f(k)))^2;
    ercc(k,:)=epsilonrelative(ereffcc(k,:),h,w);
end
% plot(f,ercc,'r')
% legend('Relative Epsilon Open','Relative Epsilon Short')
% grid on;
% title('Relative Epsilon');
% xlabel('Frequency')
% ylabel('Value Relative Epsilon')
% hold off;
%--------------------------------------------------------------------------
z0oc=z0(w,h,ereffoc);% Impedancia caracteristica
for m=1:1:length(f)
rsoc(m,:)=sqrt(2*pi*f(m)*mu0/(2*sigma));
alfacoc(m,:)=alfac(rsoc(m,:),h,w,t,z0oc); %Alfa por conduccion
lambda0oc(m,:)=c./f(m);
tanlossoc(m,:)=tanloss(alfacoc(m),alfaocl(m),ereffoc(m),eroc(m),lambda0oc(m));
end
% figure;
% plot(f,betaocl)
% grid on;
%hold on;
%--------------------------------------------------------------------------
z0cc=z0(w,h,ereffcc);% Impedancia caracteristica
for m=1:1:length(f)
rscc(m,:)=sqrt(2*pi*f(m)*mu0/(2*sigma));
alfaccc(m,:)=alfac(rscc(m,:),h,w,t,z0cc); %Alfa por conduccion
lambda0cc(m,:)=c./f(m);
tanlosscc(m,:)=tanloss(alfaccc(m),alfacc(m),ereffcc(m),ercc(m),lambda0cc(m));
end
% figure;
% plot(f,betacc,'r')
% grid on;
% title('Figure Beta')
% hold off;
% figure;
% plot(f,(tanlossoc),'r',f,(tanlosscc))
% title('Figure tanloss')
% figure;
% plot(f,atan(tanlossoc),'r',f,atan(tanlosscc))
% title('Figure atan(tanloss)')