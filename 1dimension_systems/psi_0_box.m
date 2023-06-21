function psi = psi_0_box(x)
if x > -10 && x < 0
    psi = sin((x+10)*pi/10)/sqrt(472.7194*0.01);
else
    psi=0;
end
end