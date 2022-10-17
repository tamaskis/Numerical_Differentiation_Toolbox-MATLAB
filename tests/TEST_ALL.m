%% TEST_ALL.m
% Numerical Differentiation Toolbox
%
% Unit testing of the inorm function.
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

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to testing script
addpath('scripts')



%% RUNS ALL TEST

TEST_cross;
TEST_iatan2_igradient;
TEST_iderivative;
TEST_idot;
TEST_imax;
TEST_imin;
TEST_inorm;



%% PRINTS SUCCESS MESSAGE

fprintf("\n==========================\n")
fprintf("SUCCESS: All tests passed.\n")
fprintf("==========================\n\n")