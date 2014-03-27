n=10;
e_0=8.85e-12;%Permitividad del vacío
mu_0=pi*4e-7;%Permeabilidad del vacío
c=1/sqrt(e_0*mu_0);%Velocidad de la luz en el vacío
%Parámetros de la placa.  Todos los parámetros están acompañados de su
%respectiva incertidumbre absoluta en las mismas unidades y señalada por D_"parámetro"
av_b=1.83e-3;D_b=0.05e-3;%Espesor total de las dos capas dieléctricas más aire entre estas en m
av_t=33e-6;D_t=2e-6;%Espesor del conductor en m
sigma=5.813e7;%Conductividad del conductor (Cobre)
av_er=4.5;D_er=0.25;%Permeabilidad relativa del dieléctrico
av_tand=0.0155;D_tand=0.0025;%Tangente de pérdidas del dieléctrico
%Parámetros de construcción
av_W=2.32e-3;D_W=0.1e-3;%Ancho del camino conductor en m
av_l=9.81e-3;D_l=0.1e-3;%Longitud de la línea en m
%Parámetros de medición
f=linspace(2e9,3e9,n);%Vector con los valores de frecuencia en Hz sobre los que se midió
Zref=50;%Impedancia característica de las líneas del VNA en Ohmios

%Rangos probables de las variables
b=linspace(av_b-D_b,av_b+D_b,n);
t=linspace(av_t-D_t,av_t+D_t,n);
er=linspace(av_er-D_er,av_er+D_er,n);
tand=linspace(av_tand-D_tand,av_tand+D_tand,n);
W=linspace(av_W-D_W,av_W+D_W,n);
l=linspace(av_l-D_l,av_l+D_l,n);
clear av_b av_t av_er av_tand av_W av_l D_b D_t D_er D_tand D_W D_l;
%Predicciones de la medición
S11=eye(n);
S21=eye(n);
%Impedancia Característica de la línea en Ohmios
iZc=1:1:n^3;
i4=1;
for i1=1:1:n%er
    for i2=1:1:n%b
        for i3=1:1:n%W
            if W(i3)/b(i2)<0.35
                We=b(i2)*(W(i3)/b(i2)-(0.35*b(i2)-W(i3)/b(i2))^2);
            else
                We=W(i3);
            end
            iZc(i4)=(30*pi/sqrt(er(i1)))*(b(i2)/(We+0.441*b(i2)));
            i4=i4+1;
        end
    end
end
mZc=min(iZc);
MZc=max(iZc);
Zc=linspace(mZc,MZc,n);
clear i1 i2 i3 i4 iZc mZc MZc;
%Barrido de frecuencia a parámetros
for i0=1:1:n;%f
    %Número de Onda
    k=1:1:n;
    i3=1;
    for i2=1:1:n%er
        k(i3)=2*pi*f(i0)*sqrt(er(i2))/c;
        i3=i3+1;
    end
    clear i1 i2 i3;
    %Pérdidas del Dieléctrico en Np/m
    al_d=1:1:n^2;
    i4=1;
    for i1=1:1:n%k
        for i2=1:1:n%tand
            al_d(i4)=k(i1)*tand(i2)/2;
            i4=i4+1;
        end
    end
    mal_d=min(al_d);
    Mal_d=max(al_d);
    Al_d=linspace(mal_d,Mal_d,n);
    clear i1 i2 i4 al_d mal_d Mal_d;
    %Resistencia Superficial del Conductor    
    Rs=sqrt(pi*mu_0*f(i0)/sigma);
    %Pérdidas del Conductor en Np/m
    al_c=1:1:n^5;
    B=1:1:n^5;
    D=1:1:n^5;
    i6=1;
    for i1=1:1:n%Zc
        for i2=1:1:n%er        
            for i3=1:1:n%b
                for i4=1:1:n%t
                    for i5=1:1:n%W
                        if (Zc(i1)*sqrt(er(i2)))<120
                            B(i6)=1+(2*W(i5)/(b(i3)-t(i4)))+((b(i3)+t(i4))*log((2*b(i3)-t(i4))/t(i4))/(pi*(b(i3)-t(i4))));
                            al_c(i6)=B(i6)*(2.7e-3*Rs*er(i2)*Zc(i1))/(30*pi*(b(i3)-t(i4)));
                        else
                            D(i6)=1+(b(i3)/(0.5*W(i5)+0.7*t(i4)))*(0.5+(0.414*t(i4)/W(i5))+(1/(2*pi))*log(4*pi*W(i5)/t(i4)));
                            al_c(i6)=D(i6)*(0.16*Rs/(Zc(i1)*b(i3)));
                        end
                        i6=i6+1;
                    end
                end
            end
        end
    end
    mal_c=min(al_c);
    Mal_c=max(al_c);
    Al_c=linspace(mal_c,Mal_c,n);
    clear i1 i2 i3 i4 i5 i6 B D al_c mal_c Mal_c;
    %Constante de Atenuación en Np/m
    alfa=1:1:n^2;
    i3=1;
    for i1=1:1:n%Al_d
        for i2=1:1:n%Al_c
            alfa(i3)=Al_d(i1)+Al_c(i2);
            i3=i3+1;
        end
    end
    malfa=min(alfa);
    Malfa=max(alfa);
    Alfa=linspace(malfa,Malfa,n);
    clear i1 i2 i3 alfa malfa Malfa;
    %Constante de fase en rad/m
    beta=1:1:n;
    i3=1;
    for i2=1:1:n%er
        beta(i3)=2*pi*f(i0)*sqrt(er(i2))/c;
        i3=i3+1;
    end
    mbeta=min(beta);
    Mbeta=max(beta);
    Beta=linspace(mbeta,Mbeta,n);
    clear i1 i2 i3 beta mbeta Mbeta;
    %Parámetros S
    %Coeficiente de Reflección
    CR=1:1:n;
    i2=1;
    for i1=1:1:n
        CR(i2)=(Zref-Zc(i1))/(Zref+Zc(i1));
        i2=i2+1;
    end
    clear i1 i2;
    %Zl
    zl=1:1:n^5;
    i6=1;
    for i1=1:1:n%Zc
        for i2=1:1:n%CR
            for i3=1:1:n%Alfa
                for i4=1:1:n%Beta
                    for i5=1:1:n%l
                        zl(i6)=Zc(i1)*((1+CR(i2)*exp(-2*(Alfa(i3)+1i*Beta(i4))*l(i5)))/(1-CR(i2)*exp(-2*(Alfa(i3)+1i*Beta(i4))*l(i4))));
                        i6=i6+1;
                    end
                end
            end
        end
    end
    mzl=min(zl);
    Mzl=max(zl);
    Zl=linspace(mzl,Mzl,n);
    clear i1 i2 i3 i4 i5 i6 zl mzl Mzl;
    %S11=S22
    S11(:,i0)=1:1:n;
    for i1=1:1:n%Zl
        S11(i1,i0)=(Zl(i1)-Zref)/(Zl(i1)+Zref);
    end
    clear i1 i2;
    %S21=S12
    s21=1:1:n^5;
    i6=1;
    for i1=1:1:n%CR
        for i2=1:1:n%Zl
            for i3=1:1:n%Alfa
                for i4=1:1:n%Beta
                    for i5=1:1:n%l                       
                        ns21=(1+CR(i1))/(exp((Alfa(i3)+1i*Beta(i4))*l(i5))+CR(i1)*exp((-Alfa(i3)-1i*Beta(i4))*l(i5)));
                        ds21=(1+(Zref/Zl(i2)))/2;
                        s21(i6)=ns21/ds21;
                        i6=i6+1;
                    end
                end
            end
        end
    end
    ms21=min(s21);
    Ms21=max(s21);
    S21(:,i0)=linspace(ms21,Ms21,n);
    clear i1 i2 i3 i4 i5 i6 s21 ms21 Ms21 ns21 ds21;      
end
clear i0;

%Cálculo de Permitividad Relativa y Tangente de Pérdidas
%Parámetros S
A_N=-(S11.^2)-(2.*S11)+(S21.^2)-1;
A_D=-(S11.^2)+(2.*S11)+(S21.^2)-1;
As=sqrt(A_N./A_D);
clear A_N A_D;
Zc_cs=Zref.*As;
E_cs=(S21.*(0.5.*As+0.5))-((S11-1).*(S11+S11.*As-As+1))./(2.*S21);
Gama_cs=-log(E_cs)./mean(l);
Alfa_cs=real(Gama_cs);
Beta_cs=imag(Gama_cs);
er_cs=(mean(Beta_cs).*c./(2*pi.*f)).^2;
Al_ccs=1:1:n;
tand_cs=1:1:n;
for i1=1:1:n
    a_cs=1+(2*mean(W)/(mean(b)-mean(t)))+((mean(b)+mean(t))*log((2*mean(b)-mean(t))/mean(t))/(mean(b)-mean(t)));
    Al_ccs(i1)=a_cs*2.7e-3*sqrt(mu_0*pi*f(i1)/sigma)*er_cs(i1)*real(mean(Zc_cs(:,i1)))/(30*pi*(mean(b)-mean(t)));
    tand_cs(i1)=(2*(mean(Alfa_cs(:,i1))-Al_ccs(i1))/mean(Beta_cs(:,i1)))+0.015;
    clear a_cs;
end
clear i1 ;
%Parámetros ABCD
ABCD=zeros(4,n);
Zc_cabcd=1:1:n;
Alfa_cabcd=1:1:n;
Beta_cabcd=1:1:n;
Gama_cabcd=1:1:n;
er_cabcd=1:1:n;
Al_ccabcd=1:1:n;
tand_cabcd=1:1:n;
for i1=1:1:n
    ABCD_p=s2abcd([mean(S11(:,i1)),mean(S21(:,i1));mean(S21(:,i1)),mean(S11(:,i1))],Zref);
    ABCD(:,i1)=[ABCD_p(1,1);ABCD_p(1,2);ABCD_p(2,1);ABCD_p(2,2)];
    Zc_cabcd(i1)=sqrt(ABCD_p(1,2)/ABCD_p(2,1));
    Gama_cabcd(i1)=acosh(ABCD_p(1,1))/mean(l);
    Alfa_cabcd(i1)=real(Gama_cabcd(i1));
    Beta_cabcd(i1)=(imag(Gama_cabcd(i1)));
    er_cabcd(i1)=(Beta_cabcd(i1)*c/(2*pi*f(i1)))^2;
    a_cabcd=1+(2*mean(W)/(mean(b)-mean(t)))+((mean(b)+mean(t))*log((2*mean(b)-mean(t))/mean(t))/(mean(b)-mean(t)));
    Al_ccabcd(i1)=a_cabcd*2.7e-3*sqrt(mu_0*pi*f(i1)/sigma)*er_cabcd(i1)*real(Zc_cabcd(i1))/(30*pi*(mean(b)-mean(t)));
    tand_cabcd(i1)=(2*(Alfa_cabcd(i1)-Al_ccabcd(i1))/Beta_cabcd(i1))+0.015;
    clear a_cabcd ABCD_p a_cabcd;
end
clear i1;
%Gráficos
%Parámetros S
figure;[s11,Plot_S11]=smithchart(S11);
figure;[s21,Plot_S21]=smithchart(S21);
%Parámetros Eléctricos
figure;plot(f,er,'.',f,er_cs,'+',f,er_cabcd,'*');
figure;plot(f,tand,'.',f,tand_cs,'+',f,tand_cabcd,'*');