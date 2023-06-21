%plot some states ------------------

x = x0:dx:xN-dx;

%subinterval
start_x = round(13*N/31);
end_x = round(18*N/31);
xs = x(1,start_x:end_x);

%potential
potential = V(xs);

%plot potential
plot(xs,potential, '--r');
axis([-2 2.8 0 2.9]);
hold on
colors = ['g', 'b', 'y', 'c', 'm'];

% plot 5 states
for i = 1:5
    plot(xs, power(psin(start_x:end_x,i),2)/dx + 0.6*i-0.5, colors(1,i));
end

title('wave function different states for harmonic ocsillator');
xlabel('x');
ylabel('psin');

legend('V(x)', 'psi1', 'psi2', 'psi3', 'psi4', 'psi5');

saveas(gcf,'../figures/states/oscillator.png');
