N = 10;
M = 10;
x = rand(1, N) * M;
y = rand(1, N) * M;
hour = 23;

% close all
%cone
v= VideoWriter('firelies.avi');
v.FrameRate = 10;
open(v);
K=[.25 .5 .2 .3 .5 .25 .4 .25];  %Adaptation
omega_d=omega(hour); %Frequency of fireflies flashing (Commmon)

init = 2*pi*rand(N,1); %rand vec de inicio

timeS=60;
tSpan = 0:timeS/100:timeS;

vars = [K, N, omega_d];

[t, sol]=ode45(@(t,theta) fireflyODEmod(t,theta,vars),tSpan,init);


for i=1:1:length(t)
    for j=1:1:N
        s = scatter(x(j), y(j));
        s.Marker = '+';
        s.MarkerEdgeColor = 'yellow';
        s.LineWidth = 10;
        set(gca,'Color','black')
        intensity = sin(omega_d*t(i)+sol(i,j));
        if intensity > 0
            s.MarkerEdgeAlpha = intensity;
        else
            s.MarkerEdgeAlpha = 0;
        end
        hold on
        title([num2str(t(i))])
    end
    hold off
    xlim([0,M])
    ylim([0,M])
    frame = getframe(gcf);
    writeVideo(v, frame);
end
close(v);