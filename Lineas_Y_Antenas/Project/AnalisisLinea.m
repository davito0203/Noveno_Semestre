e_0=8.85e-12;%Permitividad del vacío
mu_0=pi*4e-7;%Permeabilidad del vacío
c=1/sqrt(e_0*mu_0);%Velocidad de la luz en el vacío
%Parámetros del la placa
b=1.83e-3;%Espesor total de las dos capas dieléctricas más aire entre estas en m
t=33e-6;%Espesor del conductor en m
cond=5.813e7;%Conductividad del conductor (Cobre)
%Parámetros de construcción
W=2.32e-3;%Ancho del camino conductor en m
l=9.81e-3;%Longitud de la línea en m
%Parámetros de medición
f=2e9:0.1e9:3e9;%Valores del barrido de frecuencia en Hz
Zref=50;%Impedancia característica de las líneas del VNA en Ohmios
%Resultados de la medición
%Calibración del VNA
cal_S11_dB=[-21.3475933074951,-20.5986995697021,-21.0209083557129,-19.9011726379395,-18.8058681488037,-17.7603340148926,-17.4778099060059,-17.6047058105469,-18.4733753204346,-19.8934230804443,-21.5443897247314];
cal_S11_deg=[-151.959747314453,-586.483703613281,-996.656311035156,-1400.38647460938,-1799.06860351563,-2196.75366210938,-2595.23071289063,-2989.99438476563,-3381.90161132813,-3774.04418945313,-4167.12255859375];
cal_S21_dB=[-3.92806529998779e-02,0.052651260048151,-5.96819557249546e-02,-0.228095158934593,-0.416193604469299,-0.487559795379639,-0.339172184467316,-0.216461569070816,-0.183401674032211,-0.202559545636177,-0.247147560119629];
cal_S21_deg=[106.241165161133,92.0555114746094,78.542724609375,65.4589614868164,53.1830978393555,41.8338508605957,30.1636085510254,17.1017436981201,3.91837167739868,-9.1939582824707,-22.0171318054199];
%Matriz ABCD de la Calibración
cal_S11=1:1:11;
cal_S21=1:1:11;
ABCD_con=eye(2);
ABCD1=zeros(4,11);
S_1=zeros(4,11);
for i1=1:1:11
    cal_S11(i1)=(10^(cal_S11_dB(i1)/20))*(cosd(cal_S11_deg(i1))+1i*sind(cal_S11_deg(i1)));
    cal_S21(i1)=(10^(cal_S21_dB(i1)/20))*(cosd(cal_S21_deg(i1))+1i*sind(cal_S21_deg(i1)));
    cal_S=[ cal_S11(i1),cal_S21(i1);cal_S21(i1),cal_S11(i1)];
    ABCD_con=s2abcd(cal_S,Zref);
    ABCD_p=sqrtm(ABCD_con);
    ABCD1(:,i1)=[ABCD_p(1,1);ABCD_p(1,2);ABCD_p(2,1);ABCD_p(2,2)];
    S_t=abcd2s([ABCD1(1,i1),ABCD1(2,i1);ABCD1(3,i1),ABCD1(4,i1)],Zref);
    S_1(:,i1)=[S_t(1,1);S_t(1,2);S_t(2,1);S_t(2,2)];
    clear ABCD_p ABCD_con ABCD_t cal_S S_t;
end
clear i1;
%Medición del Prototipo
med_S11_dB=[-4.35527420043945,-5.54119396209717,-5.81063508987427,-5.39877080917358,-5.03910350799561,-4.82129955291748,-4.89007997512817,-4.97867059707642,-5.13187742233276,-5.23040533065796,-5.18777704238892];
med_S11_deg=[-203.422149658203,-225.313552856445,-245.783477783203,-268.490173339844,-293.007537841797,-318.589294433594,-343.721923828125,-367.237518310547,-389.055633544922,-409.692077636719,-429.567260742188];
med_S21_dB=[-3.84429740905762,-1.79273808002472,-1.71961343288422,-2.28611421585083,-3.1429123878479,-3.82259607315063,-3.85493326187134,-3.4887170791626,-3.03239560127258,-2.70552253723145,-2.72499394416809];
med_S21_deg=[9.05584526062012,-19.8256492614746,-46.3264541625977,-69.2580642700195,-88.6016311645508,-103.510932922363,-116.779800415039,-132.156402587891,-150.240081787109,-170.51789855957,-191.545471191406];
med_S12_dB=[-3.70592403411865,-1.93231356143951,-1.94651401042938,-2.30102443695068,-2.26482439041138,-3.18670701980591,-3.59287285804749,-3.47018194198608,-3.30359029769897,-3.36830496788025,-3.43106365203857];
med_S12_deg=[12.7936506271362,-19.0639953613281,-43.7684516906738,-62.1195640563965,-86.1935501098633,-103.420585632324,-119.08666229248,-132.837478637695,-152.044143676758,-169.420303344727,-185.209106445313];
med_S22_dB=[-7.83760166168213,-7.07417869567871,-7.09317779541016,-6.34700918197632,-5.55870771408081,-5.11439514160156,-4.75020980834961,-4.67508554458618,-4.82098817825317,-5.10911273956299,-5.52662134170532];
med_S22_deg=[-153.762756347656,-211.67106628418,-246.995803833008,-277.821136474609,-310.325073242188,-341.520629882813,-372.987548828125,-404.033050537109,-433.165588378906,-461.503387451172,-488.54443359375];
%Matrices ABCD y S de la Medición
med_S11=1:1:11;
med_S21=1:1:11;
med_S12=1:1:11;
med_S22=1:1:11;
ABCD_med=eye(2);
S_p=eye(2);
ABCDr=zeros(4,11);
S_r=zeros(4,11);
for i1=1:1:11
     med_S11(i1)=(10^(med_S11_dB(i1)/20))*(cosd(med_S11_deg(i1))+1i*sind(med_S11_deg(i1)));
     med_S21(i1)=(10^(med_S21_dB(i1)/20))*(cosd(med_S21_deg(i1))+1i*sind(med_S21_deg(i1)));
     med_S12(i1)=(10^(med_S12_dB(i1)/20))*(cosd(med_S12_deg(i1))+1i*sind(med_S12_deg(i1)));
     med_S22(i1)=(10^(med_S22_dB(i1)/20))*(cosd(med_S22_deg(i1))+1i*sind(med_S22_deg(i1)));
     med_S=[ med_S11(i1),med_S12(i1);med_S21(i1),med_S22(i1)];
     ABCD_med=s2abcd(med_S,Zref);
     ABCD_p=[ABCD1(1,i1),ABCD1(2,i1);ABCD1(3,i1),ABCD1(4,i1)]\ABCD_med/[ABCD1(1,i1),ABCD1(2,i1);ABCD1(3,i1),ABCD1(4,i1)];
     ABCDr(:,i1)=[ABCD_p(1,1);ABCD_p(1,2);ABCD_p(2,1);ABCD_p(2,2)];
     S_p=abcd2s([ABCDr(1,i1),ABCDr(2,i1);ABCDr(3,i1),ABCDr(4,i1)],Zref);
     S_r(:,i1)=[S_p(1,1);S_p(1,2);S_p(2,1);S_p(2,2)];
     clear ABCD_p ABCD_med med_S S_p;
end
clear i1;
%Cálculo de Permitividad Relativa y Tangente de Pérdidas
%Con S11 y S21
A1=1:1:11;
E1=1:1:11;
Alfa1=1:1:11;
Beta1=1:1:11;
Gama1=1:1:11;
Zc1=1:1:11;
er1=1:1:11;
al_c1=1:1:11;
tand1=1:1:11;
for i1=1:1:11
    an=-(S_r(1,i1)^2)-(2*S_r(1,i1))+(S_r(3,i1)^2)-1;
    ad=-(S_r(1,i1)^2)+(2*S_r(1,i1))+(S_r(3,i1)^2)-1;
    A1(i1)=sqrt(an/ad);
    E1(i1)=(S_r(3,i1)*(0.5*A1(i1)+0.5))-((S_r(1,i1)-1)*(S_r(1,i1)+(S_r(1,i1)*A1(i1))-A1(i1)+1)/(2*S_r(3,i1)));
    Gama1(i1)=(-log(E1(i1)))/l;
    Alfa1(i1)=real(Gama1(i1));
    Beta1(i1)=(imag(Gama1(i1)));
    Zc1(i1)=Zref*A1(i1);
    er1(i1)=(c*Beta1(i1)/(2*pi*f(i1)))^2;
     if Zc1(i1)*sqrt(er1(i1))<120
        a_c=1+(2*W/(b-t))+((b+t)*log((2*b-t)/t)/(b-t));
        al_c1(i1)=a_c*2.7e-3*sqrt(mu_0*pi*f(i1)/cond)*er1(i1)*real(Zc1(i1))/(30*pi*(b-t));
    else
         a_c=1+(b/(0.5*W+0.7*t))*(0.5+(0.414*t/W)+log(4*pi*W/t)/(2*pi));
        al_c1(i1)=a_c*0.16*sqrt(mu_0*pi*f(i1)/cond)/(real(Zc1(i1))*b);
    end
    tand1(i1)=2*(Alfa1(i1)-al_c1(i1))/Beta1(i1)+0.015;
    clear a_c;
    clear ad an;
end
clear i1;
%Con S22 y S12
A2=1:1:11;
E2=1:1:11;
Alfa2=1:1:11;
Beta2=1:1:11;
Gama2=1:1:11;
Zc2=1:1:11;
er2=1:1:11;
al_c2=1:1:11;
tand2=1:1:11;
for i1=1:1:11
    an=-S_r(4,i1)^2-2*S_r(4,i1)+S_r(2,i1)^2-1;
    ad=-S_r(4,i1)^2+2*S_r(4,i1)+S_r(2,i1)^2-1;
    A2(i1)=sqrt(an/ad);
    E2(i1)=S_r(2,i1)*(0.5*A2(i1)+0.5)-(S_r(4,i1)-1)*(S_r(4,i1)+S_r(4,i1)*A1(i1)-A2(i1)+1)/(2*S_r(2,i1));
    Gama2(i1)=(-log(E2(i1)))/l;
    Alfa2(i1)=real(Gama2(i1));
    Beta2(i1)=imag(Gama2(i1));
    Zc2(i1)=Zref*A2(i1);
    er2(i1)=(c*Beta2(i1)/(2*pi*f(i1)))^2;
    if Zc2(i1)*sqrt(er2(i1))<120
        a_c=1+(2*W/(b-t))+((b+t)*log((2*b-t)/t)/(b-t));
        al_c2(i1)=a_c*2.7e-3*sqrt(mu_0*pi*f(i1)/cond)*er2(i1)*real(Zc2(i1))/(30*pi*(b-t));
    else
         a_c=1+(b/(0.5*W+0.7*t))*(0.5+(0.414*t/W)+log(4*pi*W/t)/(2*pi));
        al_c2(i1)=a_c*0.16*sqrt(mu_0*pi*f(i1)/cond)/(real(Zc2(i1))*b);
    end
    tand2(i1)=2*(Alfa2(i1)-al_c2(i1))/Beta2(i1)+0.015;
    clear a_c;
    clear ad an;
end
clear i1;
%Con ABCD
Alfa3=1:1:11;
Beta3=1:1:11;
Gama3=1:1:11;
Zc3=1:1:11;
er3=1:1:11;
al_c3=1:1:11;
tand3=1:1:11;
for i1=1:1:11
    if imag(acosh(ABCDr(4,i1)))<0
        Gama3(i1)=(-acosh(ABCDr(4,i1)))/l;
    else
        Gama3(i1)=(acosh(ABCDr(4,i1)))/l;
    end
    Alfa3(i1)=real(Gama3(i1));
    Beta3(i1)=imag(Gama3(i1));
    Zc3(i1)=sqrt(ABCDr(2,i1)/ABCDr(3,i1));
    er3(i1)=(c*Beta3(i1)/(2*pi*f(i1)))^2;
    if Zc3(i1)*sqrt(er3(i1))<120
        a_c=1+(2*W/(b-t))+((b+t)*log((2*b-t)/t)/(b-t));
        al_c3(i1)=a_c*2.7e-3*sqrt(mu_0*pi*f(i1)/cond)*er3(i1)*real(Zc3(i1))/(30*pi*(b-t));
    else
         a_c=1+(b/(0.5*W+0.7*t))*(0.5+(0.414*t/W)+log(4*pi*W/t)/(2*pi));
        al_c3(i1)=a_c*0.16*sqrt(mu_0*pi*f(i1)/cond)/(real(Zc3(i1))*b);
    end
    tand3(i1)=2*(Alfa3(i1)-al_c3(i1))/Beta3(i1)+0.015;
    clear a_c;
end
clear i1;
%Gráficas
%Parámetros S 
figure;[s11,Plot_S11]=smithchart(S_r(1,:));
figure;[s12,Plot_S12]=smithchart(S_r(2,:));
figure;[s21,Plot_S21]=smithchart(S_r(3,:));
figure;[s22,Plot_S22]=smithchart(S_r(4,:));
%Parámeyros Eléctricos
figure;plot(f,er1,'.',f,er2,'+',f,er3,'*');
figure;plot(f,tand1,'.',f,tand2,'+',f,tand3,'*');