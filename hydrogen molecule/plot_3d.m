% plot 3d 

% constats
R=2.5;
m=0;
k_2 = -2.2*2.5*2.5/4;
Lambda = -1.8;
N=80;

hydrogen_molecule_eta
hydrogen_molecule_xi

rA = R * (xi + eta)/2;
rB = R * (xi - eta)/2;
Rl = zeros(1,N);
Rl(:) = R;

cosine = (power(Rl,2) + power(rA,2) - power(rB,2) ) ./ ( 2 * rA .* Rl);
% x = rA*cos(theta)
x = rA .* cosine;
y = rA .* cosine;

psi = ETA(:,2) * (XI(:,3) ./ power(xi,2)')';

[X,Y] = meshgrid(xi,eta);

surf(X,Y,power(abs(psi),2));
xlabel('xi');
ylabel('eta');
zlabel('psi^2');
title('psi^2 (xi,eta)');

saveas(gcf, '../figures/H2/xi_eta.jpg');