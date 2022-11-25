K=[.5 .1 .25 .3];  %Adaptation
K2 = 0.25;
N=4;   %# fflies
hour = [0];
init = 2*pi*rand(N,1); %rand vec de inicio

for i=1:1:length(hour)
    omega_d=omega(hour(i));%Frequency of fireflies flashing (Commmon)
    omega_d2 = 0.9; %Natural frequency
    
    timeS=30;
    tSpan = [0,timeS];
    
    vars = [K, N, omega_d];
    %vars2 = [K2, N, omega_d2];
    sol = ode45(@(t,theta) fireflyODEmod(t,theta,vars),tSpan,init);
    %sol2 = ode45(@(t,theta) fireflyODE(t,theta,vars2),tSpan,init);


    %Graph
    t=0:0.1:timeS;
    y=deval(sol,t)';
    %y2 = deval(sol2, t)';
    
    figure()
    for c=1:N
        hold on
        plot(t,sin(omega_d*t'+y(:,c)));
    end
%     for c=1:N
%         hold on
%         plot(t,sin(omega_d2*t'+y2(:,c)));
%     end
    title('Firefly signal', [num2str(hour(i))])
    ylabel('Signal strength')
    xlabel('t (s)')
    legend()

    figure()
    for c=1:N
        hold on
        plot(t,y(:,c));
        %plot(t,y2(:,c));
    end
    title('Phase shift over time')
    ylabel('Phase shift')
    xlabel('t (s)')
    legend()
end