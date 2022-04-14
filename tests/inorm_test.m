%% inorm_test.m
% Numerical Differentiation Toolbox
%
% Unit testing of the inorm function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-14
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% NOTE:
%   --> This script requires that the "Simple Unit Testing Toolbox" be
%       installed:
%       https://github.com/tamaskis/Simple_Unit_Testing_Toolbox-MATLAB
%   --> This script requires that the "Numerical Differentiation Toolbox"
%       be installed.



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% error tolerance
err = 1e-10;



%% TESTS SHOWING ERROR IN USING "norm"

% point at which to differentiate
x0 = [1;
      2;
      3];

% true results
pf2 = x0(2)/norm(x0);
g2 = x0/norm(x0);

% partial derivative test
TEST_UNEQUAL(ipartial(@(x) norm(x), x0, 2), pf2, err);

% gradient test
TEST_UNEQUAL(igradient(@(x) norm(x), x0, 2), g2, err);



%% TESTS FOR "inorm"

% partial derivative test
TEST_EQUAL(ipartial(@(x) inorm(x), x0, 2), pf2, err);

% gradient test
TEST_EQUAL(igradient(@(x) inorm(x), x0), g2, err);



%% PRINTS SUCCESS MESSAGE

fprintf("All tests passed.\n")