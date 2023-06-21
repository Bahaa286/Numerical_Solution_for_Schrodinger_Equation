% hydrogen atom radial solution

N = 2000; % steps number
r0=1e-3; %initial position
rN=200; % end position
h=(rN-r0)/N;

A = sparse(N,N);
A(1,1) = l*(l+1)/(r0*r0) - 2/r0 + 2/(h*h);
A(1,2) = -1/(h*h);
A(N,N) = l*(l+1)/(rN*rN) - 2/rN + 2/(h*h);
A(N,N-1) = -1/(h*h); 

r=r0;
for i=2:N-1
    r=r0+h*i;
    A(i,i) = l*(l+1)/(r*r) - 2/r + 2/(h*h);
    A(i,i-1) = -1/(h*h);
    A(i,i+1) = -1/(h*h);
end

[psin, En] = eig(full(A));
psin = -psin;

x = r0:h:rN-h;
