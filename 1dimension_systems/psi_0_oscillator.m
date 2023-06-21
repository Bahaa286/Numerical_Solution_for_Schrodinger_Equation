function psi = psi_0_oscillator(x)
if x > -5 && x < 5
    psi = cos((x+10)*pi/10)/sqrt(500);
else
    psi=0;
end
end