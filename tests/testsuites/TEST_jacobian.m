%% TEST_jacobian.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fjacobian, cjacobian, and ijacobian functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-12
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

test_suite = TestSuite('Jacobian tests',false);



%% UNIVARIATE, SCALAR-VALUED

% test function
f = @(x) x^2;

% true Jacobian
J_true = @(x) 2*x;

% numerical Jacobians
J_fd = @(x) fjacobian(f,x);
J_cd = @(x) cjacobian(f,x);
J_cs = @(x) ijacobian(f,x);

% evaluation point
x0 = 2;

% unit tests
test_suite.add_test(TestEqual(J_fd(x0),J_true(x0),'fjacobian, univariate, scalar-valued',7));
test_suite.add_test(TestEqual(J_cd(x0),J_true(x0),'cjacobian, univariate, scalar-valued',11));
test_suite.add_test(TestEqual(J_cs(x0),J_true(x0),'ijacobian, univariate, scalar-valued'));



%% UNIVARIATE, VECTOR-VALUED

% test function
f = @(x) [x^2;
          x^3];

% true Jacobian
J_true = @(x) [2*x;
               3*x^2];

% numerical Jacobians
J_fd = @(x) fjacobian(f,x);
J_cd = @(x) cjacobian(f,x);
J_cs = @(x) ijacobian(f,x);

% evaluation point
x0 = 2;

% unit tests
test_suite.add_test(TestEqual(J_fd(x0),J_true(x0),'fjacobian, univariate, vector-valued',6));
test_suite.add_test(TestEqual(J_cd(x0),J_true(x0),'cjacobian, univariate, vector-valued',9));
test_suite.add_test(TestEqual(J_cs(x0),J_true(x0),'ijacobian, univariate, vector-valued'));



%% MULTIVARIATE, SCALAR-VALUED

% test function
f = @(x) x(1)^2+x(2)^3;

% true Jacobian
J_true = @(x) [2*x(1)  3*x(2)^2];

% numerical Jacobians
J_fd = @(x) fjacobian(f,x);
J_cd = @(x) cjacobian(f,x);
J_cs = @(x) ijacobian(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(J_fd(x0),J_true(x0),'fjacobian, multivariate, scalar-valued',6));
test_suite.add_test(TestEqual(J_cd(x0),J_true(x0),'cjacobian, multivariate, scalar-valued',9));
test_suite.add_test(TestEqual(J_cs(x0),J_true(x0),'ijacobian, multivariate, scalar-valued'));



%% MULTIVARIATE, VECTOR-VALUED #1

% test function
f = @(x) [x(1)^2;
          x(2)^3];

% true Jacobian
J_true = @(x) [2*x(1)  0
               0       3*x(2)^2];

% numerical Jacobians
J_fd = @(x) fjacobian(f,x);
J_cd = @(x) cjacobian(f,x);
J_cs = @(x) ijacobian(f,x);

% evaluation point
x0 = [1;
      2];

% unit tests
test_suite.add_test(TestEqual(J_fd(x0),J_true(x0),'fjacobian, multivariate, vector-valued #1',6));
test_suite.add_test(TestEqual(J_cd(x0),J_true(x0),'cjacobian, multivariate, vector-valued #1',9));
test_suite.add_test(TestEqual(J_cs(x0),J_true(x0),'ijacobian, multivariate, vector-valued #1'));



%% MULTIVARIATE, VECTOR-VALUED #2

% test function
f = @(x) [x(1);
          5*x(3);
          4*x(2)^2-2*x(3);
          x(3)*sin(x(1))];

% true Jacobian
J_true = @(x) [1               0        0;
               0               0        5;
               0               8*x(2)  -2;
               x(3)*cos(x(1))  0        sin(x(1))];

% numerical Jacobians
J_fd = @(x) fjacobian(f,x);
J_cd = @(x) cjacobian(f,x);
J_cs = @(x) ijacobian(f,x);

% evaluation point
x0 = [5;
      6;
      7];

% unit tests
test_suite.add_test(TestEqual(J_fd(x0),J_true(x0),'fjacobian, multivariate, vector-valued #2',5));
test_suite.add_test(TestEqual(J_cd(x0),J_true(x0),'cjacobian, multivariate, vector-valued #2',9));
test_suite.add_test(TestEqual(J_cs(x0),J_true(x0),'ijacobian, multivariate, vector-valued #2'));



%% RUNS TEST SUITE

test_suite.run;