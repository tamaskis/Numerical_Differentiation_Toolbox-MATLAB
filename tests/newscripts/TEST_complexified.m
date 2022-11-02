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

% decimal places of precision
%n = 12;

test_suite = TestSuite('complexified tests',false);



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
test_suite.add_test(TestNotEqual(dh_numerical,dh_exact,'classic dot product with iderivative'));

% ------------------------------------
% Test for "complexified" dot product.
% ------------------------------------

% "complexified" dot product
h = @(x) idot(f(x),g(x));

% exact and numerical results
dh_exact = dhdx(x0);
dh_numerical = iderivative(h,x0);

% unit test
test_suite.add_test(TestNotEqual(dh_numerical,dh_exact,'complexified dot product with iderivative'));


%% RUNS TEST SUITE

test_suite.run;