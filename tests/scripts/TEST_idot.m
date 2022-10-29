%% TEST_idot.m
% Numerical Differentiation Toolbox
%
% Unit testing of the idot function.
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
n = 12;



%% FUNCTIONS/PARAMETERS USED FOR BOTH TESTS

% vector valued functions of x
f = @(x) [x(1)^2;x(2)^2;x(3)^2];
g = @(x) [x(1)^3;x(2)^3;x(3)^3];

% derivatives of f and g
dfdx = @(x) [2*x(1);2*x(2);2*x(3)];
dgdx = @(x) [3*x(1)^2;3*x(2)^2;3*x(3)^2];

% derivative of dot product of f and g
dhdx = @(x) dot(dfdx(x),g(x))+dot(f(x),dgdx(x));

% point at which to differentiate
x0 = [1;2;3];



%% TESTING "CLASSIC" DOT PRODUCT

% "classic" dot product
h = @(x) dot(f(x),g(x));

% exact and numerical results
dh_exact = dhdx(x0);
dh_numerical = iderivative(h,x0);

% unit test
TEST_NOT_EQUAL(dh_numerical,dh_exact);



%% TESTING "COMPLEXIFIED" DOT PRODUCT

% "complexified" dot product
h = @(x) idot(f(x),g(x));

% exact and numerical results
dh_exact = dhdx(x0);
dh_numerical = iderivative(h,x0);

% unit test
TEST_EQUAL(dh_numerical,dh_exact,n);



%% PRINTS SUCCESS MESSAGE

fprintf("All tests in TEST_idot.m passed.\n")