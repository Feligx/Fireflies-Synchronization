function [dotTheta] = fireflyODE(t,theta,vars)
omega = vars(3);
K = vars(1); 
N = vars(2);
dotTheta=theta;
p = K/N; 

for i=1:N,
    dotTheta(i) = 0;
    for j=1:N,
        dotTheta(i) =  dotTheta(i) +omega+ (p*sin(theta(j)-theta(i)));
    end
end
