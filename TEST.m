clear;clc;close all;




%% hessian

f = @(x) x(1)^5+x(2)^3;
x0 = [5;8];

H = ihessian(f,x0);

% 
% 
f = @(x) [x(1);x(2)];
x0 = [5;5];
grad = ijacobian(f,x0)


f = @(x) [x(1);5*x(3);4*x(2)^2-2*x(3);x(3)*sin(x(1))];
x0 = [5;5;5];
J = ijacobian(f,x0);

% grad_real = @(x) [1,0,0;
%                   0,0,5;
%                   0,8*x(2),-2;
%                   x(3)*cos(x(1)),0,sin(x(1))];
%               
%               
% grad_real(x0)


