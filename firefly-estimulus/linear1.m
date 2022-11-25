K=4;  %Adaptation
N = 1;
omega=0.8;%Frequency of fireflies flashing (Commmon)

init = 2*pi*rand(); %rand vec de inicio
est = 2*pi*rand(); %rand vec de inicio

timeS=30;
tSpan = [0,timeS];

 
sol=ode45(@(t,theta) fireflyLinearODE1(t,theta,K,est),tSpan,init);
 
%Graph
t=0:0.1:timeS;
y=deval(sol,t)';

%Plot del phase shift de la luciernaga y el estimulo
figure()
hold on

plot(t,y(:,1));                 %Luciernaga
yline(est);                     %Linea constante con el valor del estimulo

title('Phase shift over time')
ylabel('Phase shift')
xlabel('t (s)')

%Plot del seno de la luciernaga y el estimulo
figure()
hold on

plot(t,sin(omega*t'+y(:,1)));   %Luciernaga
plot(t,sin(omega*t'+est));      %Estimulo

title('Firefly signal')
ylabel('Signal strength')
xlabel('t (s)')

%Plot de la diferencia de fases entre el estímulo y la luciernaga
figure()
hold on

plot(t,y(:,1)-est);
ylim([-2*pi 2*pi])
set(gca,'YTick',-2*pi:pi:2*pi) 
set(gca,'YTickLabel',{'-2*pi','-pi','0','pi','2*pi'})
title('Difference between phases')
ylabel('difference')
xlabel('t (s)')