function kc1=kc(num,den1,den2,error)
%clear all; format long;
%num=200; den1=100; den2=200; error=0.03;
syms kcp;

fr=1-num*kcp/(den1+den2*kcp)-error;

kc1=eval(solve(fr));


%num=200; den1=100; den2=200; error=0.03;




