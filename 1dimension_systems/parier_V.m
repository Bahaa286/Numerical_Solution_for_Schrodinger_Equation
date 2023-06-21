function V = parier_V(x)
c = 1.2;
if ((x > -9) && (x < -4))
    V = c;
elseif x > 4 && x < 9
    V = c;
else
    V=0;
end
end