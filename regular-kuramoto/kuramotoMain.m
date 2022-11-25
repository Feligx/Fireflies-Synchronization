function kuramotoMain

K=.25;  %Adaptation
N=2;   %# fflies
hour = [20, 24, 1.5, 5];
init = 2*pi*rand(N,1); %rand vec de inicio

for i=1:1:4
    omega_d=omega(hour(i));%Frequency of fireflies flashing (Commmon)
    
    timeS=60;
    tSpan = [0,timeS];
    
    vars = [K, N, omega_d];
    sol=ode45(@(t,theta) fireflyODE(t,theta,vars),tSpan,init);
    
    %Graph
    t=0:0.1:timeS;
    y=deval(sol,t)';
    
    figure()
    for c=1:N
    hold on
    plot(t,sin(omega_d*t'+y(:,c)));
    end
    title('Firefly signal', [num2str(hour(i))])
    ylabel('Signal strength')
    xlabel('t (s)')
    
end