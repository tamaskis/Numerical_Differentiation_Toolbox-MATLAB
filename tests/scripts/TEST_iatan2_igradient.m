%% TEST_iatan2_igradient.m
% Numerical Differentiation Toolbox
%
% Unit testing of the iatan2 and igradient functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-10-16
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
n = 15;



%% FOUR QUADRANT INVERSE TANGENT

% true gradient
g = @(x,y) [-y/(x^2+y^2);x/(x^2+y^2)];

% quadrant I
theta = pi/4;
x0 = cos(theta);
y0 = sin(theta);
TEST_EQUAL(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]), g(x0,y0), n);

% quadrant II
theta = 3*pi/4;
x0 = cos(theta);
y0 = sin(theta);
TEST_EQUAL(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]), g(x0,y0), n);

% quadrant III
theta = 5*pi/4;
x0 = cos(theta);
y0 = sin(theta);
TEST_EQUAL(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]), g(x0,y0));

% quadrant IV
theta = 7*pi/4;
x0 = cos(theta);
y0 = sin(theta);
TEST_EQUAL(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]), g(x0,y0));



%% PRINTS SUCCESS MESSAGE

fprintf("All tests in TEST_iatan2_igradient passed.\n")