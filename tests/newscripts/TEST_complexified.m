%% TEST_idot.m
% Numerical Differentiation Toolbox
%
% Unit testing of the idot function.
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

% loads derivatives
load_derivatives;



%% INSTANTIATE TEST SUITE

test_suite = TestSuite('complexified tests',false);



%% MAX

% auxiliary functions
g1 = @(x) x;
g2 = @(x) x^3;

% --------------------------------
% Test for "classic" max function.
% --------------------------------

% function
f = @(x) max(g1(x),g2(x));

% function handle for complex-step derivative
df_cs = @(x) iderivative(f,x);

% function handle for true derivative
df_true = @(x) d_max(x,g1,g2);

% units tests
test_suite.add_test(TestNotEqual(df_cs(-1.5),df_true(-1.5),'iderivative(max), x₀ = -1.5'));
test_suite.add_test(TestNotEqual(df_cs(-0.5),df_true(-0.5),'iderivative(max), x₀ = -0.5'));
test_suite.add_test(TestNotEqual(df_cs(0.5),df_true(0.5),'iderivative(max), x₀ = 0.5'));
test_suite.add_test(TestNotEqual(df_cs(1.5),df_true(1.5),'iderivative(max), x₀ = 1.5'));

% -------------------------------------
% Test for "complexified" max function.
% -------------------------------------

% function
f = @(x) imax(g1(x),g2(x));

% function handle for complex-step derivative
df_cs = @(x) iderivative(f,x);

% function handle for true derivative
df_true = @(x) d_max(x,g1,g2);

% units tests
test_suite.add_test(TestEqual(df_cs(-1.5),df_true(-1.5),'iderivative(imax), x₀ = -1.5'));
test_suite.add_test(TestEqual(df_cs(-0.5),df_true(-0.5),'iderivative(imax), x₀ = -0.5'));
test_suite.add_test(TestEqual(df_cs(0.5),df_true(0.5),'iderivative(imax), x₀ = 0.5'));
test_suite.add_test(TestEqual(df_cs(1.5),df_true(1.5),'iderivative(imax), x₀ = 1.5'));



%% DOT PRODUCT

% vector valued functions of x
f = @(x) [x(1)^2;x(2)^2;x(3)^2];
g = @(x) [x(1)^3;x(2)^3;x(3)^3];

% derivatives of f and g
dfdx = @(x) [2*x(1);2*x(2);2*x(3)];
dgdx = @(x) [3*x(1)^2;3*x(2)^2;3*x(3)^2];

% derivative of dot product of f and g
dhdx = @(x) dot(dfdx(x),g(x))+dot(f(x),dgdx(x));

% point at which to differentiate
x0 = [1;2;3];

% -------------------------------
% Test for "classic" dot product.
% -------------------------------

% "classic" dot product
h = @(x) dot(f(x),g(x));

% exact and numerical results
dh_exact = dhdx(x0);
dh_numerical = iderivative(h,x0);

% unit test
test_suite.add_test(TestNotEqual(dh_numerical,dh_exact,'iderivative(dot)'));

% ------------------------------------
% Test for "complexified" dot product.
% ------------------------------------

% "complexified" dot product
h = @(x) idot(f(x),g(x));

% exact and numerical results
dh_exact = dhdx(x0);
dh_numerical = iderivative(h,x0);

% unit test
test_suite.add_test(TestEqual(dh_numerical,dh_exact,'iderivative(idot)',12));



%% RUNS TEST SUITE

test_suite.run;