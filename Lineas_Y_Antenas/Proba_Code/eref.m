function eref=eref(z0,w,h)
if(w/h <= 1)
    eref=(z0^2)/(3600*(log((w^2+32*h^2)/(4*h*w)))^2);
elseif(w/h >= 1)
    eref=(319455.6471*h^2)/(z0^2*(h*log(w/h+1.44)+1.499250375*(w+1.393*h))^2);
end