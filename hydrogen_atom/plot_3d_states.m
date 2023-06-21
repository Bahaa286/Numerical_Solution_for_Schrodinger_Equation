%plot 3d states
l=7;
m=0;
N=400;

dtheta = 2*pi/N;
dphi = dtheta;
theta=-pi:dtheta:pi-dtheta;
phi = 0:dphi:2*pi-dphi;

[phi,theta] = meshgrid(phi,theta);

P = legendre(l,cos(theta));
Pnm = [];

if l==0
    Pnm = P(m+1,:);
else
    for i=1:N
        Pnm(:,i) = P(m+1,:,i);
    end
end

PHI = exp(j*m*phi);

Y = Pnm .* PHI;
Ylm = abs(Y .* Y);

xY = sin(theta) .* cos(phi) .* Ylm;
yY = sin(theta) .* sin(phi) .* Ylm;
zY = cos(theta) .* Ylm;

figure();
xlim([-1 1]);
ylim([-1 1]);
zlim([-1 1]);
axis equal
surf(xY,yY,zY);


saveas(gcf, strcat('../figures/spherical/l=',string(l),'.jpg'));