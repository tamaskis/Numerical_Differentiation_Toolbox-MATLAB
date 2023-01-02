%% TEST_ALL.m
% Numerical Differentiation Toolbox
%
% Runs all unit testing scripts.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2023-01-01
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% DEPENDENCIES:
%   • Simple Unit Testing Toolbox (https://tamaskis.github.io/Simple_Unit_Testing_Toolbox-MATLAB)
%   • Numerical Differentiation Toolbox (https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/)



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% adds path to testing scripts
addpath('testsuites')



%% RUNS ALL TESTS

TEST_complexified;
TEST_derivative;
TEST_directional;
TEST_gradient;
TEST_hessian;
TEST_jacobian;
TEST_partial;
TEST_vechessian;