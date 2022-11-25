function kuramotoMain

K=.25;  %Adaptation
N=2;   %# fflies
hour = 2;

%omega_d=omega(hour);%Frequency of fireflies flashing (Commmon)
omega_d = 0.9;
init = 2*pi*rand(N,1); %rand vec de inicio

timeS=60;
tSpan = [0,timeS];

vars = [K, N, omega_d];

sol=ode45(@(t,theta) fireflyODE(t,theta,vars),tSpan,init);

%Graph
t=0:0.1:timeS;
y=deval(sol,t)';


for c=1:N
    hold on
    plot(t,y(:,c));
end
title('Phase shift over time')
ylabel('Phase shift')
xlabel('t (s)')
figure()

for c=1:N
hold on
plot(t,sin(omega_d*t'+y(:,c)));
end
title('Firefly signal')
ylabel('Signal strength')
xlabel('t (s)')
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
