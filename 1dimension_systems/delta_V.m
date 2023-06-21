function V = delta_V(x)
if x > -4 && x < -3.98
    V = 1e9;
elseif x > 3.98 && x < 4
    V = 1e9;
else
    V=0;
end
end