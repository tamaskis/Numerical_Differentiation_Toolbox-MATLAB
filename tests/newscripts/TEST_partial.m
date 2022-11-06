%% TEST_partial.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fpartial, cpartial, and ipartial functions.
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

test_suite = TestSuite('partial derivative tests',false);



%% UNIVARIATE, SCALAR-VALUED

% test function
f = @(x) x^2;

% true partial derivative
pf_true = @(x) 2*x;

% numerical partial derivatives
pf_fd = @(x,k) fpartial(f,x,k);
pf_cd = @(x,k) cpartial(f,x,k);
pf_cs = @(x,k) ipartial(f,x,k);

% evaluation point
x0 = 2;

% element of x to differentiate with respect to
k = 1;

% unit tests
test_suite.add_test(TestEqual(pf_fd(x0,k),pf_true(x0),'fpartial, univariate, scalar-valued',7));
test_suite.add_test(TestEqual(pf_cd(x0,k),pf_true(x0),'cpartial, univariate, scalar-valued',11));
test_suite.add_test(TestEqual(pf_cs(x0,k),pf_true(x0),'ipartial, univariate, scalar-valued'));



%% UNIVARIATE, VECTOR-VALUED

% test function
f = @(x) [x^4;
          x^3];

% true partial derivative with respect to x
pf_true = @(x) [4*x^3;
                3*x^2];

% numerical partial derivatives
pf_fd = @(x,k) fpartial(f,x,k);
pf_cd = @(x,k) cpartial(f,x,k);
pf_cs = @(x,k) ipartial(f,x,k);

% evaluation point
x0 = 2;

% element of x to differentiate with respect to
k = 1;

% unit tests
test_suite.add_test(TestEqual(pf_fd(x0,k),pf_true(x0),'fpartial, univariate, vector-valued',5));
test_suite.add_test(TestEqual(pf_cd(x0,k),pf_true(x0),'cpartial, univariate, vector-valued',8));
test_suite.add_test(TestEqual(pf_cs(x0,k),pf_true(x0),'ipartial, univariate, vector-valued'));



%% MULTIVARIATE, SCALAR-VALUED

% test function
f = @(x) x(1)^3*x(2)^3;

% true partial derivative
pf_true = @(x) 3*x(1)^3*x(2)^2;

% numerical partial derivatives
pf_fd = @(x,k) fpartial(f,x,k);
pf_cd = @(x,k) cpartial(f,x,k);
pf_cs = @(x,k) ipartial(f,x,k);

% evaluation point
x0 = [3;
      2];

% element of x to differentiate with respect to
k = 2;

% unit tests
test_suite.add_test(TestEqual(pf_fd(x0,k),pf_true(x0),'fpartial, multivariate, scalar-valued',4));
test_suite.add_test(TestEqual(pf_cd(x0,k),pf_true(x0),'cpartial, multivariate, scalar-valued',7));
test_suite.add_test(TestEqual(pf_cs(x0,k),pf_true(x0),'ipartial, multivariate, scalar-valued'));



%% MULTIVARIATE, VECTOR-VALUED #1

% test function
f = @(x) [x(1)^4;
          x(2)^3];

% true partial derivative
pf_true = @(x) [0
                3*x(2)^2];

% numerical partial derivatives
pf_fd = @(x,k) fpartial(f,x,k);
pf_cd = @(x,k) cpartial(f,x,k);
pf_cs = @(x,k) ipartial(f,x,k);

% evaluation point
x0 = [3;
      2];

% element of x to differentiate with respect to
k = 2;

% unit tests
test_suite.add_test(TestEqual(pf_fd(x0,k),pf_true(x0),'fpartial, multivariate, vector-valued #1',6));
test_suite.add_test(TestEqual(pf_cd(x0,k),pf_true(x0),'cpartial, multivariate, vector-valued #1',9));
test_suite.add_test(TestEqual(pf_cs(x0,k),pf_true(x0),'ipartial, multivariate, vector-valued #1'));



%% MULTIVARIATE, VECTOR-VALUED #2

% test function
f = @(x) [x(1);
          5*x(3);
          4*x(2)^2-2*x(3);
          x(3)*sin(x(1))];

% true partial derivative
pf_true = @(x) [0;
                5;
                -2;
                sin(x(1))];

% numerical partial derivatives
pf_fd = @(x,k) fpartial(f,x,k);
pf_cd = @(x,k) cpartial(f,x,k);
pf_cs = @(x,k) ipartial(f,x,k);

% evaluation point
x0 = [5;
      6;
      7];

% element of x to differentiate with respect to
k = 3;

% unit tests
test_suite.add_test(TestEqual(pf_fd(x0,k),pf_true(x0),'fpartial, multivariate, vector-valued #2',8));
test_suite.add_test(TestEqual(pf_cd(x0,k),pf_true(x0),'cpartial, multivariate, vector-valued #2',10));
test_suite.add_test(TestEqual(pf_cs(x0,k),pf_true(x0),'ipartial, multivariate, vector-valued #2'));



%% RUNS TEST SUITE

test_suite.run;