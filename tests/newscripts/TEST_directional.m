%% TEST_directional.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fdirectional, cdirectional, and idirectional 
% functions.
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

test_suite = TestSuite('directional derivative tests',false);



%% UNIVARIATE, SCALAR-VALUED

% test function
f = @(x) x^2;

% true directional derivative
Dv_true = @(x,v) 2*x*v;

% numerical directional derivatives
Dv_fd = @(x,v) fdirectional(f,x,v);
Dv_cd = @(x,v) cdirectional(f,x,v);
Dv_cs = @(x,v) idirectional(f,x,v);

% evaluation point
x0 = 2;

% direction of differentiation
v = 0.6;

% unit tests
test_suite.add_test(TestEqual(Dv_fd(x0,v),Dv_true(x0,v),'fdirectional, univariate, scalar-valued',7));
test_suite.add_test(TestEqual(Dv_cd(x0,v),Dv_true(x0,v),'cdirectional, univariate, scalar-valued',9));
test_suite.add_test(TestEqual(Dv_cs(x0,v),Dv_true(x0,v),'idirectional, univariate, scalar-valued'));



%% MULTIVARIATE, SCALAR-VALUED #1

% test function
f = @(x) x(1)^2+x(2)^3;

% true directional derivative
Dv_true = @(x,v) [2*x(1);
                  3*x(2)^2].'*v;

% numerical directional derivatives
Dv_fd = @(x,v) fdirectional(f,x,v);
Dv_cd = @(x,v) cdirectional(f,x,v);
Dv_cs = @(x,v) idirectional(f,x,v);

% evaluation point
x0 = [1;
      2];

% direction of differentiation
v = [3;
     4];

% unit tests
test_suite.add_test(TestEqual(Dv_fd(x0,v),Dv_true(x0,v),'fdirectional, multivariate, scalar-valued #1',5));
test_suite.add_test(TestEqual(Dv_cd(x0,v),Dv_true(x0,v),'cdirectional, multivariate, scalar-valued #1',8));
test_suite.add_test(TestEqual(Dv_cs(x0,v),Dv_true(x0,v),'idirectional, multivariate, scalar-valued #1'));



%% MULTIVARIATE, SCALAR-VALUED #2

% test function
f = @(x) x(1)^5+sin(x(2))^3;

% true directional derivative
Dv_true = @(x,v) [5*x(1)^4;
                  3*sin(x(2))^2*cos(x(2))].'*v;

% numerical directional derivatives
Dv_fd = @(x,v) fdirectional(f,x,v);
Dv_cd = @(x,v) cdirectional(f,x,v);
Dv_cs = @(x,v) idirectional(f,x,v);

% evaluation point
x0 = [5;
      8];

% direction of differentiation
v = [10;
     20];

% unit tests
test_suite.add_test(TestEqual(Dv_fd(x0,v),Dv_true(x0,v),'fdirectional, multivariate, scalar-valued #2',1));
test_suite.add_test(TestEqual(Dv_cd(x0,v),Dv_true(x0,v),'cdirectional, multivariate, scalar-valued #2',4));
test_suite.add_test(TestEqual(Dv_cs(x0,v),Dv_true(x0,v),'idirectional, multivariate, scalar-valued #2',14));



%% RUNS TEST SUITE

test_suite.run;