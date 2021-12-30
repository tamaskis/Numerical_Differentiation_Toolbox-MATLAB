%% iatan2_igradient_test.m
% Numerical Differentiation Toolbox
%
% Unit testing of the iatan2 and igradient functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to "Numerical Differentiation Toolbox" functions
addpath(genpath("../toolbox"));



%% FOUR QUADRANT INVERSE TANGENT

% true gradient
g = @(x,y) [-y/(x^2+y^2);x/(x^2+y^2)];

% quadrant I
theta = pi/4;
x0 = cos(theta);
y0 = sin(theta);
TEST_EQUAL(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]), g(x0,y0));

% quadrant II
theta = 3*pi/4;
x0 = cos(theta);
y0 = sin(theta);
TEST_EQUAL(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]), g(x0,y0));

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

% prints success message
fprintf("All tests passed.\n")