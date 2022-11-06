%% TEST_gradient.m
% Numerical Differentiation Toolbox
%
% Unit testing of the cgradient, fgradient, and igradient functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% DEPENDENCIES:
%   • Simple Unit Testing Toolbox (https://github.com/tamaskis/Simple_Unit_Testing_Toolbox-MATLAB)
%   • Numerical Differentiation Toolbox (https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox)



%% SCRIPT SETUP

% clears Workspace and closes all figures
clear; close all;



%% INSTANTIATE TEST SUITE

test_suite = TestSuite('gradient tests',false);



%% UNIVARIATE, SCALAR-VALUED

% test function
f = @(x) x^2;

% true gradient
g_true = @(x) 2*x;

% numerical gradients
g_fd = @(x) fgradient(f,x);
g_cd = @(x) cgradient(f,x);
g_cs = @(x) igradient(f,x);

% evaluation point
x0 = 2;

% unit tests
test_suite.add_test(TestEqual(g_fd(x0),g_true(x0),'fgradient, univariate, scalar-valued',7));
test_suite.add_test(TestEqual(g_cd(x0),g_true(x0),'cgradient, univariate, scalar-valued',11));
test_suite.add_test(TestEqual(g_cs(x0),g_true(x0),'igradient, univariate, scalar-valued'));



%% MULTIVARIATE, SCALAR-VALUED #1

% test function
f = @(x) x(1)^2+x(2)^3;

% true gradient
g_true = @(x) [2*x(1);
               3*x(2)^2];

% numerical gradients
g_fd = @(x) fgradient(f,x);
g_cd = @(x) cgradient(f,x);
g_cs = @(x) igradient(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(g_fd(x0),g_true(x0),'fgradient, multivariate, scalar-valued #1',6));
test_suite.add_test(TestEqual(g_cd(x0),g_true(x0),'cgradient, multivariate, scalar-valued #1',9));
test_suite.add_test(TestEqual(g_cs(x0),g_true(x0),'igradient, multivariate, scalar-valued #1'));



%% MULTIVARIATE, SCALAR-VALUED #2

% test function
f = @(x) x(1)^5+sin(x(2))^3;

% true gradient
g_true = @(x) [5*x(1)^4;
               3*sin(x(2))^2*cos(x(2))];

% numerical gradients
g_fd = @(x) fgradient(f,x);
g_cd = @(x) cgradient(f,x);
g_cs = @(x) igradient(f,x);

% evaluation point
x0 = [5;
      8];

% unit tests
test_suite.add_test(TestEqual(g_fd(x0),g_true(x0),'fgradient, multivariate, scalar-valued #2',3));
test_suite.add_test(TestEqual(g_cd(x0),g_true(x0),'cgradient, multivariate, scalar-valued #2',6));
test_suite.add_test(TestEqual(g_cs(x0),g_true(x0),'igradient, multivariate, scalar-valued #2',11));



%% RUNS TEST SUITE

test_suite.run;