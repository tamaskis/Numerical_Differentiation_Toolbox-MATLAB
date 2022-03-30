%% imax_test.m
% Numerical Differentiation Toolbox
%
% Unit testing of the imax function.
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
g = @(x) imax(x,1-0.5*x);

% units tests
TEST_EQUAL(iderivative(g,-1),dgdx(-1));
TEST_EQUAL(iderivative(g,0),dgdx(0));
TEST_EQUAL(iderivative(g,1),dgdx(1));
TEST_EQUAL(iderivative(g,2),dgdx(2));
TEST_EQUAL(iderivative(g,3),dgdx(3));



%% PRINTS SUCCESS MESSAGE

fprintf("All tests passed.\n")



%% AUXILIARY FUNCTION

% g'(x)
function dg = dgdx(x)
    if x < 1
        dg = -0.5;
    else
        dg = 1;
    end
end