% hydrogen molecule eta solution
eta0 = -1;
etaN = 0.9999;
deta = (etaN-eta0)/N;
eta = eta0+deta:deta:etaN;

Aeta = sparse(N,N);
Aeta(1,1) = power(eta(1),2)*(power(deta,2)*k_2 - 2) - power(deta*m,2)/(1-power(eta(1),2)) - 2*eta(1)*deta + 2;
Aeta(1,2) = power(eta(1),2) + 2*deta*eta(1) - 1;
Aeta(N,N) = power(eta(N),2)*(power(deta,2)*k_2 - 2) - power(deta*m,2)/(1-power(eta(N),2)) - 2*eta(N)*deta + 2;
Aeta(N,N-1) = power(eta(N),2) - 1;

for i = 2:N-1
    Aeta(i,i-1) = power(eta(i),2) - 1;
    Aeta(i,i) = power(eta(i),2)*(power(deta,2)*k_2 - 2) - power(deta*m,2)/(1-power(eta(i),2)) - 2*eta(i)*deta + 2;
    Aeta(i,i+1) = power(eta(i),2) + 2*deta*eta(i) - 1;
end
[ETA,Eeta] = eig(full(Aeta));



