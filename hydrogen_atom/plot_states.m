% plot states

% effective potential
V = [];
for i = 1:N
    V(1,i) = l*(l+1)/(power(r0+i*h,2)) - 2/(r0+i*h);
end

%axis([0 90 -0.08 0.23]);
hold on
colors = ['g', 'b', 'y', 'c', 'm', 'k'];

for i = 1:6
    plot(x,psin(:,i+1),colors(i));
end

title("wave function different states for hydrogen radial r'R(r')");
xlabel("r'=r/a");
ylabel("r'R(r')");

s = ['1s', '2s', '3s', '4s', '5s', '6s'];
p = ['2p', '3p', '4p', '5p', '6p', '7p'];
d = ['3d', '4d', '5d', '6d', '7d', '8d'];
f = ['4f', '5f', '6f', '7f', '8f', '9f'];

legend('n=8', 'n=9', 'n=10', 'n=11', 'n=12', 'n=13');

saveas(gcf,strcat('../figures/radial/rR,l=',string(l),'.png'));
