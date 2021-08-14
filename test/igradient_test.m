%% igradient_test.m
% Unit testing of the igradient function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-14
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear;clc;close all;

% adds path to "Numerical Differentiation Toolbox" functions
addpath(genpath("../src"));



%% FOUR QUADRANT INVERSE TANGENT

% true gradient
g = @(x,y) [-y/(x^2+y^2);x/(x^2+y^2)];

% quadrant I
theta = pi/4;
x0 = cos(theta);
y0 = sin(theta);
true = round(g(x0,y0),6);
approx = round(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]),6);
assert(approx(1) == true(1));
assert(approx(2) == true(2));

% quadrant II
theta = 3*pi/4;
x0 = cos(theta);
y0 = sin(theta);
true = round(g(x0,y0),6);
approx = round(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]),6);
assert(approx(1) == true(1));
assert(approx(2) == true(2));

% quadrant III
theta = 5*pi/4;
x0 = cos(theta);
y0 = sin(theta);
true = round(g(x0,y0),6);
approx = round(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]),6);
assert(approx(1) == true(1));
assert(approx(2) == true(2));

% quadrant IV
theta = 7*pi/4;
x0 = cos(theta);
y0 = sin(theta);
true = round(g(x0,y0),6);
approx = round(igradient(@(x) iatan2(x(2),x(1)),[x0;y0]),6);
assert(approx(1) == true(1));
assert(approx(2) == true(2));