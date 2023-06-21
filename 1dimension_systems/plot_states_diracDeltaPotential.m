%plot some states ------------------

x = x0:dx:xN-dx;

%subinterval
start_x = 1;
end_x = N;
xs = x(1,start_x:end_x);

%potential
potential = [];
for i = start_x:end_x
    potential(1,i-start_x+1) = V(x0 + i*dx);
end

%plot potential
plot(xs,potential, '--r');
axis([-10 15 0 3]);
hold on
colors = ['g', 'b', 'y', 'c', 'm', 'k'];

% plot 5 states
for i = 1:6
    plot(xs, power(psin(start_x:end_x,i),2)/dx + 0.37*i, colors(1,i));
end

title('wave function different states for dirac delta potential');
xlabel('x');
ylabel('psin');

legend('V(x)', 'psi1', 'psi2', 'psi3', 'psi4', 'psi5', 'psi6');

saveas(gcf,'../figures/states/derac.png');
