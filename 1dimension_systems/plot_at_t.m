% plot the time 

switch type
    case 1
        psi_0 = @(x) (psi_0_oscillator(x)); % psi(t=0) potential oscillator
    case 2
        psi_0 = @(x) (psi_0_box(x)); % psi(t=0) particle in a box
    case 3
        psi_0 = @(x) (psi_0_parier(x)); % psi(t=0) potential parier
    case 4
        psi_0 = @(x) (psi_0_delta(x)); % psi(t=0) potential dirac delta
end

%determine psi from the combination at time t

%psi initial
x = x0:dx:xN-dx;
psi_i = [];
for i = 1:N
    psi_i(1,i) = psi_0(x0+i*dx);
end

psi = [];
psi(N,1)=0;
c = psin' * psi_i';


% animation
ani = animatedline;
grid on
n=4;
minimum = - abs(min(psin(:,n))) - abs(max(psin(:,n)));
maximum =  abs(min(psin(:,n))) + abs(max(psin(:,n)));
axis( [x(1), x(N-1), minimum, maximum]  );

myVideo = VideoWriter('../animation/dirac/psi');
myVideo.FrameRate = 10;  
open(myVideo)


for t = 0:0.0002:0.01 
    clearpoints(ani);
    addpoints(ani,x,real(psin(:,n)*exp(-j*t*En(n,n)/h_bar)));
    drawnow;
    pause(0.06);
    ylabel('psi');
    xlabel('x');
    title('psi state');
    frame = getframe(gcf);
    writeVideo(myVideo, frame);
end
close(myVideo);


myVideo = VideoWriter('../animation/dirac/psi.gif');
myVideo.FrameRate = 10;  
open(myVideo)
axis( [x(1), x(N-1), 0, 10]  );
for t = 0:2e-22:100e-22
    for i = 1:N
        psi = psi + c(i,1)*psin(:,i)*exp(-j*t*En(i,i)/h_bar);
    end
    psi_2 = power(abs(psi),2);
    
    clearpoints(ani);
    addpoints(ani,x,psi_2);
    drawnow;
    pause(0.06);
    ylabel('psi^2');
    xlabel('x');
    title('psi^2 vs x');
    frame = getframe(gcf);
    writeVideo(myVideo, frame);
end
close(myVideo);

hold on
colors = ['g', 'b', 'y', 'c', 'm'];

for t = 0:2e-23:12e-23
    for i = 1:N
        psi = psi + c(i,1)*psin(:,i)*exp(-j*t*En(i,i)/h_bar);
    end
    psi_2 = power(abs(psi),2);

    plot(x,psi_2);
end
xlabel('x');
ylabel('pasi^2');
title('psi^2 vs x for different step time');

saveas(gcf,'../animation/dirac/steps.png');