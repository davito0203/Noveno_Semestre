function tanloss=tanloss(alfac,alfa,erf,er,lambda0)

q=(erf-1)/(er-1);
tanloss=(alfa-alfac)*lambda0/(sqrt(erf)*q*pi);