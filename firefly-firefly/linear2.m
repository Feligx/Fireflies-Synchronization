K=[4,2];  %Adaptation
N=2;   %# fflies

omega=0.9;%Frequency of fireflies flashing (Commmon)

init = 2*pi*rand(N,1); %rand vec de inicio

timeS=60;           
tSpan = [0,timeS];      %Duracion

vars = K;

sol=ode45(@(t,theta) fireflyLinearODE2(t,theta,K),tSpan,init); %Solucionar sistema

%Graph
t=0:0.1:timeS;
y=deval(sol,t)';            %Vector con los phase shifts


%Plot de phase shifts
figure()
for c=1:N
    hold on
    plot(t,y(:,c));
end
title('Phase shift over time')
ylabel('Phase shift')
xlabel('t (s)')

%Plot de las señales de los senos de las luciernagas
figure()
for c=1:N
    hold on
    plot(t,sin(omega*t'+y(:,c)));
end
title('Firefly signal')
ylabel('Signal strength')
xlabel('t (s)')


%Plot de la diferencia de fases entre 2 luciernagas
figure()
for c=1:N
    hold on
    plot(t,y(:,2)-y(:,1));
    ylim([-2*pi 2*pi])
    set(gca,'YTick',-2*pi:pi:2*pi) 
    set(gca,'YTickLabel',{'-2*pi','-pi','0','pi','2*pi'})
end
title('Difference between phases')
ylabel('difference')
xlabel('t (s)')
