function psi = psi_0_parier(x)
if x > -5 && x < 5
    psi = 10*sin((x+10)*pi/5)/sqrt(5e4);
else
    psi=0;
end
end