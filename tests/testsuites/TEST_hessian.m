%% TEST_hessian.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fhessian, chessian, and ihessian functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-12
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% DEPENDENCIES:
%   • Simple Unit Testing Toolbox (https://github.com/tamaskis/Simple_Unit_TestinH_Toolbox-MATLAB)
%   • Numerical Differentiation Toolbox (https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox)



%% SCRIPT SETUP

% clears Workspace and closes all figures
clear; close all;



%% INSTANTIATE TEST SUITE

test_suite = TestSuite('Hessian tests',false);



%% UNIVARIATE, SCALAR-VALUED

% test function
f = @(x) x^3;

% true Hessian
H_true = @(x) 6*x;

% numerical Hessians
H_fd = @(x) fhessian(f,x);
H_cd = @(x) chessian(f,x);
H_cs = @(x) ihessian(f,x);

% evaluation point
x0 = 2;

% unit tests
test_suite.add_test(TestEqual(H_fd(x0),H_true(x0),'fhessian, univariate, scalar-valued',3));
test_suite.add_test(TestEqual(H_cd(x0),H_true(x0),'chessian, univariate, scalar-valued',6));
test_suite.add_test(TestEqual(H_cs(x0),H_true(x0),'ihessian, univariate, scalar-valued',10));



%% MULTIVARIATE, SCALAR-VALUED #1

% test function
f = @(x) x(1)^2+x(2)^3;

% true Hessian
H_true = @(x) [2  0;
               0  6*x(2)];

% numerical Hessians
H_fd = @(x) fhessian(f,x);
H_cd = @(x) chessian(f,x);
H_cs = @(x) ihessian(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(H_fd(x0),H_true(x0),'fhessian, multivariate, scalar-valued #1',3));
test_suite.add_test(TestEqual(H_cd(x0),H_true(x0),'chessian, multivariate, scalar-valued #1',5));
test_suite.add_test(TestEqual(H_cs(x0),H_true(x0),'ihessian, multivariate, scalar-valued #1',10));



%% MULTIVARIATE, SCALAR-VALUED #2

% test function
f = @(x) x(1)^5*x(2)+x(1)*sin(x(2))^3;

% true Hessian
H_true = @(x) [20*x(1)^3*x(2),5*x(1)^4+3*sin(x(2))^2*cos(x(2));
               5*x(1)^4+3*sin(x(2))^2*cos(x(2)),...
               6*x(1)*sin(x(2))*cos(x(2))^2-3*x(1)*sin(x(2))^3];

% numerical Hessians
H_fd = @(x) fhessian(f,x);
H_cd = @(x) chessian(f,x);
H_cs = @(x) ihessian(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(H_fd(x0),H_true(x0),'fhessian, multivariate, scalar-valued #2',2));
test_suite.add_test(TestEqual(H_cd(x0),H_true(x0),'chessian, multivariate, scalar-valued #2',4));
test_suite.add_test(TestEqual(H_cs(x0),H_true(x0),'ihessian, multivariate, scalar-valued #2',7));



%% RUNS TEST SUITE

test_suite.run;