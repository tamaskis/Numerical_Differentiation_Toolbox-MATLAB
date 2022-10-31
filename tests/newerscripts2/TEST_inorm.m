%% TEST_inorm.m
% Numerical Differentiation Toolbox
%
% Unit testing of the inorm function.
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



%% TESTS SHOWING ERROR IN USING "norm"

% point at which to differentiate
x0 = [1;
      2;
      3];

% exact results
pf2 = x0(2)/norm(x0);
g2 = x0/norm(x0);

% partial derivative test
TEST_NOT_EQUAL(ipartial(@(x) norm(x), x0, 2), pf2);

% gradient test
TEST_NOT_EQUAL(igradient(@(x) norm(x), x0, 2), g2);



%% TESTS FOR "inorm"

% partial derivative test
TEST_EQUAL(ipartial(@(x) inorm(x), x0, 2), pf2);

% gradient test
TEST_EQUAL(igradient(@(x) inorm(x), x0), g2);



%% PRINTS SUCCESS MESSAGE

fprintf("All tests in TEST_inorm passed.\n")