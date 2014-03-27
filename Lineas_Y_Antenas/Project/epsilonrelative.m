function er=epsilonrelative(ereff,h,w)

if(w/h >= 1)
    er=((2*ereff-1)*sqrt(1+12*h/w)+1)/(sqrt(1+12*h/w)+1);
elseif (w/h <= 1)
    er=(ereff + 0.02*(w/h - 1)^2 + 1/(2*((12*h)/w + 1)^(1/2)) - 1/2)/(0.02*(w/h - 1)^2 + 1/(2*((12*h)/w + 1)^(1/2)) + 1/2);
end