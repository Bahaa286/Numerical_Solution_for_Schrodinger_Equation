x = x0:dx:xN-dx;

%subinterval
start_x = round(1);
end_x = round(N);
xs = x(1,start_x:end_x);

%potential
xp = [];
xp(1,1:11) = x0-10*dx:dx:x0;
xp(1,11:N+10) = xs;
xp(1, N+10:N+20) = xN:dx:xN+10*dx;

potential = [];
potentila(1,1:11) = 1;
potential(1,11:N+10) = 0;
potential(1,N+10:N+20) = 1;
potential(1,1)=1;

%plot potential
plot(xp,potential, '--r');
axis([-15 16 0 1]);
hold on
colors = ['g', 'b', 'y', 'c', 'm'];

% plot 5 states
for i = 1:5
    plot(xs, power(psin(start_x:end_x,i),2)/dx + 0.15*i, colors(1,i));
end

title('wave function different states for particle in a box');
xlabel('x');
ylabel('psin');

legend('V(x)', 'psi1', 'psi2', 'psi3', 'psi4', 'psi5');

saveas(gcf,'../figures/states/box.png');