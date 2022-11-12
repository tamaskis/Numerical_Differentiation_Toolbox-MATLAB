%% TEST_vecvechessian.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fvechessian, cvechessian, and ivechessian functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-05
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

test_suite = TestSuite('Vector Hessian tests',false);



%% UNIVARIATE, SCALAR-VALUED

% test function
f = @(x) x^3;

% true vector Hessian
H_true = @(x) 6*x;

% numerical vector Hessians
H_fd = @(x) fvechessian(f,x);
H_cd = @(x) cvechessian(f,x);
H_cs = @(x) ivechessian(f,x);

% evaluation point
x0 = 2;

% unit tests
test_suite.add_test(TestEqual(H_fd(x0),H_true(x0),'fvechessian, univariate, scalar-valued',3));
test_suite.add_test(TestEqual(H_cd(x0),H_true(x0),'cvechessian, univariate, scalar-valued',6));
test_suite.add_test(TestEqual(H_cs(x0),H_true(x0),'ivechessian, univariate, scalar-valued',10));



%% MULTIVARIATE, SCALAR-VALUED #1

% test function
f = @(x) x(1)^2+x(2)^3;

% true vector Hessian
H_true = @(x) [2  0;
               0  6*x(2)];

% numerical vector Hessians
H_fd = @(x) fvechessian(f,x);
H_cd = @(x) cvechessian(f,x);
H_cs = @(x) ivechessian(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(H_fd(x0),H_true(x0),'fvechessian, multivariate, scalar-valued #1',3));
test_suite.add_test(TestEqual(H_cd(x0),H_true(x0),'cvechessian, multivariate, scalar-valued #1',5));
test_suite.add_test(TestEqual(H_cs(x0),H_true(x0),'ivechessian, multivariate, scalar-valued #1',10));



%% MULTIVARIATE, SCALAR-VALUED #2

% test function
f = @(x) x(1)^5*x(2)+x(1)*sin(x(2))^3;

% true vector Hessian
H_true = @(x) [20*x(1)^3*x(2),5*x(1)^4+3*sin(x(2))^2*cos(x(2));
               5*x(1)^4+3*sin(x(2))^2*cos(x(2)),...
               6*x(1)*sin(x(2))*cos(x(2))^2-3*x(1)*sin(x(2))^3];

% numerical vector Hessians
H_fd = @(x) fvechessian(f,x);
H_cd = @(x) cvechessian(f,x);
H_cs = @(x) ivechessian(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(H_fd(x0),H_true(x0),'fvechessian, multivariate, scalar-valued #2',2));
test_suite.add_test(TestEqual(H_cd(x0),H_true(x0),'cvechessian, multivariate, scalar-valued #2',4));
test_suite.add_test(TestEqual(H_cs(x0),H_true(x0),'ivechessian, multivariate, scalar-valued #2',7));



%% MULTIVARIATE, VECTOR-VALUED

% test function
f = @(x) [x(1)^5*x(2)+x(1)*sin(x(2))^3;
          x(1)^3+x(2)^4-3*x(1)^2*x(2)^2];

% true vector Hessians
H1 = @(x) [20*x(1)^3*x(2),5*x(1)^4+3*sin(x(2))^2*cos(x(2));
           5*x(1)^4+3*sin(x(2))^2*cos(x(2)),...
           6*x(1)*sin(x(2))*cos(x(2))^2-3*x(1)*sin(x(2))^3];
H2 = @(x) [6*x(1)^2-6*x(2)^2  -12*x(1)*x(2);
           -12*x(1)*x(2)       12*x(2)^2-6*x(1)^2];
H_true = @(x) cat(3,H1(x),H2(x));

% numerical vector Hessians
H_fd = @(x) fvechessian(f,x);
H_cd = @(x) cvechessian(f,x);
H_cs = @(x) ivechessian(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(H_fd(x0),H_true(x0),'fvechessian, multivariate, scalar-valued #2',2));
test_suite.add_test(TestEqual(H_cd(x0),H_true(x0),'cvechessian, multivariate, scalar-valued #2',4));
test_suite.add_test(TestEqual(H_cs(x0),H_true(x0),'ivechessian, multivariate, scalar-valued #2',7));



%% RUNS TEST SUITE

test_suite.run;