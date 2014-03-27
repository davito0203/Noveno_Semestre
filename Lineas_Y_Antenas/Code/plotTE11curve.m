x = linspace(1.01,10,20);

n=1;

for cont = 1:length(x)
    
    thisx = x(cont);
    
    f2zero = @(ysqrt) dbesselj(n,ysqrt^2).*dbessely(n,thisx*ysqrt^2)-...
        dbesselj(n,thisx*ysqrt^2).*dbessely(n,ysqrt^2);

    
    [thisy,FVAL,EXITFLAG]=fzero(f2zero,0.3);
    
    y(cont) = thisy^2;
end

plot(x,y,'*');

ylabel('k_c*a');
xlabel('b/a');
grid on
hold on

return

plot(x,1./x,'r');

plot(x,1./(4*x/9+5/9),'--k');

plot(x,2./(x+1),'b');