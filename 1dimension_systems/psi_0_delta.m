function psi = psi_0_delta(x)
if (x>-10 && x<-5) || (x>5 && x < 10)
    psi = sin((x+10)*pi/5);
else 
    psi=0;
end
end