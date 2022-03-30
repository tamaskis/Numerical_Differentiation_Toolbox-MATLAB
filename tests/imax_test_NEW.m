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
f = @(x) imax(x,2-x^2);
%f = @(x) imax(2-x^2,x);

% units tests
dfdx(1)
iderivative(f,1)

TEST_EQUAL(iderivative(f,-3),dfdx(-3));
TEST_EQUAL(iderivative(f,-2),dfdx(-2));
TEST_EQUAL(iderivative(f,-1),dfdx(-1));
TEST_EQUAL(iderivative(f,0),dfdx(0));
TEST_EQUAL(iderivative(f,1),dfdx(1));
TEST_EQUAL(iderivative(f,2),dfdx(2));



%% PRINTS SUCCESS MESSAGE

fprintf("All tests passed.\n")



%% AUXILIARY FUNCTION

% f'(x)
function df = dfdx(x)
    if x <= -2
        df = 1;
    elseif (x > -2) && (x < 1)
        df = -2*x;
    else
        df = 1;
    end
end