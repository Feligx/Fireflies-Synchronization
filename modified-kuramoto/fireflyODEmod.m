function [dotTheta] = fireflyODEmod(t,theta,vars)
N = vars(length(vars)-1);
omega = vars(length(vars));
K = [];
for i=1:N
    K = [K vars(i)];
end
dotTheta=theta;
p = K/N;

for i=1:N,
    dotTheta(i) = 0;
    for j=1:N,
        dotTheta(i) =  dotTheta(i) + (p(i)*sin(theta(j)-theta(i)));
    end
end
