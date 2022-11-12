%% TEST_complexified.m
% Numerical Differentiation Toolbox
%
% Unit testing of the complexified functions (iabs, imax, imin, idot, 
% inorm, iatan2, and iatan2d).
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

% loads derivatives
load_derivatives;



%% INSTANTIATE TEST SUITE

test_suite = TestSuite('complexified tests',false);



%% ABS

% true derivative
df_true = d_abs;

% ----------------------------------
% Tests for "standard" abs function.
% ----------------------------------

% complex-step derivative
df_cs = d_abs_cs;

% unit tests
test_suite.add_test(TestNotEqual(df_cs(-1),df_true(-1),'iderivative(abs), x₀ = -1'));
test_suite.add_test(TestNotEqual(df_cs(1),df_true(1),'iderivative(abs), x₀ = 1'));

% --------------------------------------
% Tests for "complexified" abs function.
% --------------------------------------

% complex-step derivative
df_cs = d_iabs_cs;

% unit tests
test_suite.add_test(TestEqual(df_cs(-1),df_true(-1),'iderivative(iabs), x₀ = -1'));
test_suite.add_test(TestEqual(df_cs(1),df_true(1),'iderivative(iabs), x₀ = 1'));



%% ATAN2

% function handle for evaluation point
x0 = @(theta) [cos(theta);
               sin(theta)];

% true gradient
g_true = @(x) [-x(2)/(x(1)^2+x(2)^2);x(1)/(x(1)^2+x(2)^2)];

% ------------------------------------
% Tests for "standard" atan2 function.
% ------------------------------------

% complex-step gradient
g_cs = @(x) igradient(@(x)atan2(x(2),x(1)),x);

% unit test
test_suite.add_test(TestError(g_cs,{x0(pi/4)},'igradient(atan2)'));

% ----------------------------------------
% Tests for "complexified" atan2 function.
% ----------------------------------------

% complex-step gradient
g_cs = @(x) igradient(@(x)iatan2(x(2),x(1)),x);

% unit tests
test_suite.add_test(TestEqual(g_cs(x0(pi/4)),g_true(x0(pi/4)),'igradient(iatan2), quadrant I',15));
test_suite.add_test(TestEqual(g_cs(x0(3*pi/4)),g_true(x0(3*pi/4)),'igradient(iatan2), quadrant II',15));
test_suite.add_test(TestEqual(g_cs(x0(5*pi/4)),g_true(x0(5*pi/4)),'igradient(iatan2), quadrant III'));
test_suite.add_test(TestEqual(g_cs(x0(7*pi/4)),g_true(x0(7*pi/4)),'igradient(iatan2), quadrant IV'));



%% ATAN2D

% function handle for evaluation point
x0 = @(theta) [cosd(theta);
               sind(theta)];

% true gradient TODO: DOCUMENT 180/pi and subsequent loss of precision
g_true = @(x) (180/pi)*[-x(2)/(x(1)^2+x(2)^2);x(1)/(x(1)^2+x(2)^2)];


% -------------------------------------
% Tests for "standard" atan2d function.
% -------------------------------------

% complex-step gradient
g_cs = @(x) igradient(@(x)atan2d(x(2),x(1)),x);

% unit test
test_suite.add_test(TestError(g_cs,{x0(45)},'igradient(atan2d)'));

% -----------------------------------------
% Tests for "complexified" atan2d function.
% -----------------------------------------

% complex-step gradient
g_cs = @(x) igradient(@(x)iatan2d(x(2),x(1)),x);

% unit tests
test_suite.add_test(TestEqual(g_cs(x0(45)),g_true(x0(45)),'igradient(iatan2d), quadrant I',13));
test_suite.add_test(TestEqual(g_cs(x0(135)),g_true(x0(135)),'igradient(iatan2d), quadrant II',13));
test_suite.add_test(TestEqual(g_cs(x0(225)),g_true(x0(225)),'igradient(iatan2d), quadrant III',13));
test_suite.add_test(TestEqual(g_cs(x0(315)),g_true(x0(315)),'igradient(iatan2d), quadrant IV',13));



%% DOT PRODUCT

% vector valued functions of x
f = @(x) [x;
          x^2;
          x^3];
g = @(x) [sin(x);
          cos(x);
          tan(x)];

% derivatives of f and g
dfdx = @(x) [1;
             2*x;
             3*x^2];
dgdx = @(x) [ cos(x);
             -sin(x);
              sec(x)^2];

% derivative of dot product of f and g
dhdx = @(x) dfdx(x).'*g(x)+f(x).'*dgdx(x);

% point at which to differentiate
x0 = 2;

% --------------------------------
% Test for "standard" dot product.
% --------------------------------

% "standard" dot product
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



%% MAX

% auxiliary functions
g1 = @(x) x;
g2 = @(x) x^3;

% ---------------------------------
% Test for "standard" max function.
% ---------------------------------

% function
f = @(x) max(g1(x),g2(x));

% function handle for complex-step derivative
df_cs = @(x) iderivative(f,x);

% function handle for true derivative
df_true = @(x) d_max(x,g1,g2);

% units tests
test_suite.add_test(TestNotEqual(df_cs(-1.5),df_true(-1.5),'iderivative(max), x₀ = -1.5'));
test_suite.add_test(TestNotEqual(df_cs(-0.5),df_true(-0.5),'iderivative(max), x₀ = -0.5'));
test_suite.add_test(TestEqual(df_cs(0.5),df_true(0.5),'iderivative(max), x₀ = 0.5'));
test_suite.add_test(TestEqual(df_cs(1.5),df_true(1.5),'iderivative(max), x₀ = 1.5'));

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



%% MIN

% auxiliary functions
g1 = @(x) x;
g2 = @(x) x^3;

% ---------------------------------
% Test for "standard" min function.
% ---------------------------------

% function
f = @(x) min(g1(x),g2(x));

% function handle for complex-step derivative
df_cs = @(x) iderivative(f,x);

% function handle for true derivative
df_true = @(x) d_min(x,g1,g2);

% units tests
test_suite.add_test(TestNotEqual(df_cs(-1.5),df_true(-1.5),'iderivative(min), x₀ = -1.5'));
test_suite.add_test(TestNotEqual(df_cs(-0.5),df_true(-0.5),'iderivative(min), x₀ = -0.5'));
test_suite.add_test(TestEqual(df_cs(0.5),df_true(0.5),'iderivative(min), x₀ = 0.5'));
test_suite.add_test(TestEqual(df_cs(1.5),df_true(1.5),'iderivative(min), x₀ = 1.5'));

% -------------------------------------
% Test for "complexified" min function.
% -------------------------------------

% function
f = @(x) imin(g1(x),g2(x));

% function handle for complex-step derivative
df_cs = @(x) iderivative(f,x);

% function handle for true derivative
df_true = @(x) d_min(x,g1,g2);

% units tests
test_suite.add_test(TestEqual(df_cs(-1.5),df_true(-1.5),'iderivative(imin), x₀ = -1.5'));
test_suite.add_test(TestEqual(df_cs(-0.5),df_true(-0.5),'iderivative(imin), x₀ = -0.5'));
test_suite.add_test(TestEqual(df_cs(0.5),df_true(0.5),'iderivative(imin), x₀ = 0.5'));
test_suite.add_test(TestEqual(df_cs(1.5),df_true(1.5),'iderivative(imin), x₀ = 1.5'));



%% MOD

% TODO






%% 2-NORM

% point at which to differentiate
x0 = [1;
      2;
      3];

% index of x to take partial derivative with respect to
k = 2;

% true partial derivative
pf_true = @(x,k) x(k)/norm(x);

% true gradient
g_true = @(x) x/norm(x);

% -----------------------------------
% Tests for "standard" norm function.
% -----------------------------------

% complex-step partial derivative
pf_cs = @(x,k) ipartial(@(x)norm(x),x,k);

% complex-step gradient
g_cs = @(x) igradient(@(x)norm(x),x);

% unit tests
test_suite.add_test(TestNotEqual(pf_cs(x0,k),pf_true(x0,k),'ipartial(norm)'));
test_suite.add_test(TestNotEqual(g_cs(x0),g_true(x0),'igradient(norm)'));

% ---------------------------------------
% Tests for "complexified" norm function.
% ---------------------------------------

% complex-step partial derivative
pf_cs = @(x,k) ipartial(@(x)inorm(x),x,k);

% complex-step gradient
g_cs = @(x) igradient(@(x)inorm(x),x);

% unit tests
test_suite.add_test(TestEqual(pf_cs(x0,k),pf_true(x0,k),'ipartial(inorm)'));
test_suite.add_test(TestEqual(g_cs(x0),g_true(x0),'igradient(inorm)'));



%% RUNS TEST SUITE

test_suite.run;