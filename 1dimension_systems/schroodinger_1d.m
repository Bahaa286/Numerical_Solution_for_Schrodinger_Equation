switch type
    case 1
        V = @(x) (x.*x); % potential oscillator
    case 2
        V = @(x) (0); % potential particle in a box
    case 3
        V = @(x) (parier_V(x)); % potential barrier
    case 4
        V = @(x) (delta_V(x)); % potential dirac delta
end

m = 9.1093837e-31;
h_bar=1.05e-34;
N = 2000; % steps number
x0=-1e1; %initial position
xN=1e1; % end position
dx=(xN-x0)/N;

A = sparse([1 1 N N], [1 2 N N-1], [2+dx*dx*V(x0), -1,  2+dx*dx*V(xN), -1],N,N);

for i=2:N-1
    A(i,i) = 2 + dx*dx*V(x0+i*dx);
    A(i,i-1) = -1;
    A(i,i+1) = -1;
end

[psin, En] = eig(full(A));
En = En/(dx*dx);

%plot energies
energies = eig(En);

plot(energies);
title('En states');
xlabel('state');
ylabel('En (energies)');
%saveas(gcf,strcat('../figures/En/',string(type),'.png'));


