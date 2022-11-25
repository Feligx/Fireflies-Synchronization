function [dotTheta] = fireflyLinearODE1(t,theta,gamma,est)
dotTheta = theta;
dotTheta = (est-theta)/gamma;
