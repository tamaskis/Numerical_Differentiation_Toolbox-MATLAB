%% TEST_cross.m
% Numerical Differentiation Toolbox
%
% Unit testing for complex-step differentiation of the "cross" function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-10-29
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% DEPENDENCIES:
%   • Simple Unit Testing Toolbox (https://github.com/tamaskis/Simple_Unit_Testing_Toolbox-MATLAB)
%   • Numerical Differentiation Toolbox (https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox)



%% SCRIPT SETUP

% clears Workspace and closes all figures
clear; close all;

% decimal places of precision
n = 13;



%% TESTING CROSS PRODUCT

% vector valued functions of x
f = @(x) [x(1)^2;x(2)^2;x(3)^2];
g = @(x) [x(1)^3;x(2)^3;x(3)^3];

% cross product of f and g
h = @(x) cross(f(x),g(x));

% derivatives of f and g
dfdx = @(x) [2*x(1);2*x(2);2*x(3)];
dgdx = @(x) [3*x(1)^2;3*x(2)^2;3*x(3)^2];

% derivative of h (cross product of f and g)
dhdx = @(x) cross(dfdx(x),g(x))+cross(f(x),dgdx(x));

% point at which to differentiate
x0 = [1;2;3];

% numerical and exact results
dh_numerical = dhdx(x0);
dh_exact = iderivative(h,x0);

% unit test
TEST_EQUAL(dh_numerical, dh_exact,n);



%% PRINTS SUCCESS MESSAGE

fprintf("All tests in TEST_cross.m passed.\n")