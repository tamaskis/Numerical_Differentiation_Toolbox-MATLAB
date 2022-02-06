%% cross_test.m
% Numerical Differentiation Toolbox
%
% Unit testing for complex-step differentiation of the "cross" function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-02-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to "Numerical Differentiation Toolbox" functions
addpath(genpath("../toolbox"));



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

% expected and actual results
dh_exp = dhdx(x0);
dh_act = iderivative(h,x0);

% unit test
TEST_EQUAL(dh_act,dh_exp);



%% PRINTS SUCCESS MESSAGE

fprintf("All tests passed.\n")