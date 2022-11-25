function [dotTheta] = fireflyLinearODE2(t,theta,K) 
dotTheta=theta; 

for i=1:2,
    dotTheta(i) = 0;
    dotTheta(i) = (theta(2)-theta(1));
end

dotTheta(1) = dotTheta(1)/K(1);  %Divido theta 1 entre A
dotTheta(2) = -dotTheta(2)/K(2); %Hago que theta 2 baje y divido entre B