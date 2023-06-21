% hydrogen molecule xi solution
xi0 = 1.001;
xiN = 10;
dxi = (xiN-xi0)/N;
xi = xi0:dxi:xiN-dxi;

Axi = sparse(N,N);
Axi(1,1) = dxi*dxi*( 2*R - (6-2*power(xi(1),2))/power(xi(1),4) - m*m/(power(xi(1),4)-power(xi(1),2)) - Lambda/power(xi(1),2) ) - dxi*(4-2*power(xi(1),2))/power(xi(1),3) - 2*(power(xi(1),2)-1)/power(xi(1),2);
Axi(1,2) = (power(xi(1),2)-1)/power(xi(1),2) + dxi*(4-2*power(xi(1),2))/power(xi(1),3);
Axi(N,N) = dxi*dxi*( 2*R - (6-2*power(xi(N),2))/power(xi(N),4) - m*m/(power(xi(N),4)-power(xi(N),2)) - Lambda/power(xi(N),2) ) - dxi*(4-2*power(xi(N),2))/power(xi(N),3) - 2*(power(xi(N),2)-1)/power(xi(N),2);
Axi(N,N-1) = (power(xi(N),2) - 1)/power(xi(N),2);

for i = 2:N-1
    Axi(i,i-1) = (power(xi(i),2) - 1)/power(xi(i),2);
    Axi(i,i) = dxi*dxi*( 2*R - (6-2*power(xi(i),2))/power(xi(i),4) - m*m/(power(xi(i),4)-power(xi(i),2)) - Lambda/power(xi(i),2) ) - dxi*(4-2*power(xi(i),2))/power(xi(i),3) - 2*(power(xi(i),2)-1)/power(xi(i),2);
    Axi(i,i+1) = (power(xi(i),2)-1)/power(xi(i),2) + dxi*(4-2*power(xi(i),2))/power(xi(i),3);
end
%Axi = - Axi;
[XI,Exi] = eig(full(Axi));

XI = XI ./ (power(xi,2)');
