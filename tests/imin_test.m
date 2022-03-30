%% imin_test.m
% Numerical Differentiation Toolbox
%
% Unit testing of the imin function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-03-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to "Numerical Differentiation Toolbox" functions
addpath(genpath("../toolbox"));



%% UNIT TESTS

% function
h = @(x) imin(x,1-0.5*x);

% units tests
TEST_EQUAL(iderivative(h,-1),dhdx(-1));
TEST_EQUAL(iderivative(h,0),dhdx(0));
TEST_EQUAL(iderivative(h,1),dhdx(1));
TEST_EQUAL(iderivative(h,2),dhdx(2));
TEST_EQUAL(iderivative(h,3),dhdx(3));



%% PRINTS SUCCESS MESSAGE

fprintf("All tests passed.\n")



%% AUXILIARY FUNCTION

% h'(x)
function dh = dhdx(x)
    if x < 1
        dh = 1;
    else
        dh = -0.5;
    end
end