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



%% NOTE

% See https://www.wolframalpha.com/input?i=min%28x%2Cx%5E3%29 for a plot of
% f(x) and the definition of its derivative, f'(x).



%% UNIT TESTS

% function
f = @(x) imin(x,x^3);

% units tests
TEST_EQUAL(iderivative(f,-1.5),dfdx(-1.5));
TEST_EQUAL(iderivative(f,-0.5),dfdx(-0.5));
TEST_EQUAL(iderivative(f,0.5),dfdx(0.5));
TEST_EQUAL(iderivative(f,1.5),dfdx(1.5));



%% PRINTS SUCCESS MESSAGE

fprintf("All tests passed.\n")



%% AUXILIARY FUNCTION

% f'(x)
function df = dfdx(x)
    if ((-1 < x) && (x < 0)) || (x > 1)
        df = 1;
    elseif ((0 < x) && (x < 1)) || (x < -1)
        df = 3*x^2;
    else
        df = NaN;
    end
end