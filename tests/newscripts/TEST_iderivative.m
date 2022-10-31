%% TEST_iderivative.m
% Numerical Differentiation Toolbox
%
% Unit testing of the iderivative function.
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
n = 14;



%% DERIVATIVE FUNCTIONS

% TODO: COMPLEXIFIED, DIFFERENT n's
% min, max, complexified in separate test?
% trig functions in degrees
% get length of longest string and space error message accordingly
% printing should be optional for test suite

% loads derivatives
load_derivatives;



%% FUNCTIONS THAT WILL RESULT IN ERRORS

% absolute value (x0 > 0 and x0 < 0) --> FIX IN NEXT SECTION TODO
TEST_NOT_EQUAL(d_abs_cs(-1),-1,[],'iderivative abs, x₀ < 0');
TEST_NOT_EQUAL(d_abs_cs(1),1,[],'iderivative abs, x₀ > 0');

% inverse trigonometric functions (x0 < -1) --> NO FIX
x0 = -1.5;
TEST_NOT_EQUAL(d_acsc_cs(x0),d_acsc(x0),[],'iderivative acsc, x₀ < -1');
TEST_NOT_EQUAL(d_asec_cs(x0),d_asec(x0),[],'iderivative asec, x₀ < -1');

% inverse hyperbolic functions (0 < x0 < 1) --> NO FIX
x0 = 0.5;
TEST_NOT_EQUAL(d_acoth_cs(x0),d_acoth(x0),[],'iderivative acoth, 0 < x₀ < 1');

% inverse hyperbolic functions (x0 > 1) --> NO FIX
x0 = 1.5;
TEST_NOT_EQUAL(d_atanh_cs(x0),d_atanh(x0),[],'iderivative atanh, x₀ > 1');

% inverse hyperbolic functions (-1 < x0 < 0) --> NO FIX
x0 = -0.5;
TEST_NOT_EQUAL(d_asech_cs(x0),d_asech(x0),[],'iderivative asech, -1 < x₀ < 0');
TEST_NOT_EQUAL(d_acoth_cs(x0),d_acoth(x0),[],'iderivative acoth, -1 < x₀ < 0');

% inverse hyperbolic functions (x0 < -1) --> NO FIX
x0 = -1.5;
TEST_NOT_EQUAL(d_acosh_cs(x0),d_acosh(x0),[],'iderivative acosh, x₀ < -1');
TEST_NOT_EQUAL(d_atanh_cs(x0),d_atanh(x0),[],'iderivative atanh, x₀ < -1');



%% COMPLEXIFIED FUNCTIONS TO ADDRESS ERRORS FROM PREVIOUS SECTION

% absolute value (x0 > 0 and x0 < 0)
TEST_EQUAL(d_iabs_cs(-1),d_iabs(-1),[],'iderivative iabs, x₀ < 0');
TEST_EQUAL(d_iabs_cs(1),d_iabs(1),[],'iderivative iabs, x₀ > 0');



%% SQUARE ROOT, EXPONENTIAL AND POWER FUNCTIONS

test_suite = TestSuite('iderivative tests',false);

% sqrt
test_suite.add_test(TestEqual(d_sqrt_cs(0.5),d_sqrt(0.5),'iderivative sqrt, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_sqrt_cs(1),d_sqrt(1),'iderivative sqrt, x₀ = 1'));
test_suite.add_test(TestEqual(d_sqrt_cs(1.5),d_sqrt(1.5),'iderivative sqrt, x₀ > 1'));

% exp
test_suite.add_test(TestEqual(d_exp_cs(-1),d_exp(-1),'iderivative exp, x₀ < 0'));
test_suite.add_test(TestEqual(d_exp_cs(0),d_exp(0),'iderivative exp, x₀ = 0'));
test_suite.add_test(TestEqual(d_exp_cs(1),d_exp(1),'iderivative exp, x₀ > 0'));

% power
b = 5;
test_suite.add_test(TestEqual(d_power_cs(-1,b),d_power(-1,b),'iderivative power, x₀ < 0'));
test_suite.add_test(TestEqual(d_power_cs(0,b),d_power(0,b),'iderivative power, x₀ = 0'));
test_suite.add_test(TestEqual(d_power_cs(1,b),d_power(1,b),'iderivative power, x₀ > 0'));



%% LOGARITHMIC FUNCTIONS

% log
test_suite.add_test(TestEqual(d_log_cs(0.5),d_log(0.5),'iderivative log, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_log_cs(1),d_log(1),'iderivative log, x₀ = 1'));
test_suite.add_test(TestEqual(d_log_cs(1.5),d_log(1.5),'iderivative log, x₀ > 1'));

% log10
test_suite.add_test(TestEqual(d_log10_cs(0.5),d_log10(0.5),'iderivative log10, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_log10_cs(1),d_log10(1),'iderivative log10, x₀ = 1'));
test_suite.add_test(TestEqual(d_log10_cs(1.5),d_log10(1.5),'iderivative log10, x₀ > 1'));



%% TRIGONOMETRIC FUNCTIONS

% sin
test_suite.add_test(TestEqual(d_sin_cs(0),d_sin(0),'iderivative sin, x₀ = 0'));
test_suite.add_test(TestEqual(d_sin_cs(pi/4),d_sin(pi/4),'iderivative sin, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_sin_cs(pi/2),d_sin(pi/2),'iderivative sin, x₀ = π/2'));
test_suite.add_test(TestEqual(d_sin_cs(3*pi/4),d_sin(3*pi/4),'iderivative sin, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_sin_cs(pi),d_sin(pi),'iderivative sin, x₀ = π'));
test_suite.add_test(TestEqual(d_sin_cs(5*pi/4),d_sin(5*pi/4),'iderivative sin, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_sin_cs(3*pi/2),d_sin(3*pi/2),'iderivative sin, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_sin_cs(7*pi/4),d_sin(7*pi/4),'iderivative sin, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_sin_cs(2*pi),d_sin(2*pi),'iderivative sin, x₀ = 2π'));

% cos
test_suite.add_test(TestEqual(d_cos_cs(0),d_cos(0),'iderivative cos, x₀ = 0'));
test_suite.add_test(TestEqual(d_cos_cs(pi/4),d_cos(pi/4),'iderivative cos, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_cos_cs(pi/2),d_cos(pi/2),'iderivative cos, x₀ = π/2'));
test_suite.add_test(TestEqual(d_cos_cs(3*pi/4),d_cos(3*pi/4),'iderivative cos, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_cos_cs(pi),d_cos(pi),'iderivative cos, x₀ = π'));
test_suite.add_test(TestEqual(d_cos_cs(5*pi/4),d_cos(5*pi/4),'iderivative cos, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_cos_cs(3*pi/2),d_cos(3*pi/2),'iderivative cos, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_cos_cs(7*pi/4),d_cos(7*pi/4),'iderivative cos, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_cos_cs(2*pi),d_cos(2*pi),'iderivative cos, x₀ = 2π'));

% tan
test_suite.add_test(TestEqual(d_tan_cs(0),d_tan(0),'iderivative tan, x₀ = 0'));
test_suite.add_test(TestEqual(d_tan_cs(pi/4),d_tan(pi/4),'iderivative tan, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_tan_cs(pi/2),d_tan(pi/2),'iderivative tan, x₀ = π/2'));
test_suite.add_test(TestEqual(d_tan_cs(3*pi/4),d_tan(3*pi/4),'iderivative tan, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_tan_cs(pi),d_tan(pi),'iderivative tan, x₀ = π'));
test_suite.add_test(TestEqual(d_tan_cs(5*pi/4),d_tan(5*pi/4),'iderivative tan, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_tan_cs(3*pi/2),d_tan(3*pi/2),'iderivative tan, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_tan_cs(7*pi/4),d_tan(7*pi/4),'iderivative tan, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_tan_cs(2*pi),d_tan(2*pi),'iderivative tan, x₀ = 2π'));

% csc
test_suite.add_test(TestEqual(d_csc_cs(0),d_csc(0),'iderivative csc, x₀ = 0'));
test_suite.add_test(TestEqual(d_csc_cs(pi/4),d_csc(pi/4),'iderivative csc, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_csc_cs(pi/2),d_csc(pi/2),'iderivative csc, x₀ = π/2'));
test_suite.add_test(TestEqual(d_csc_cs(3*pi/4),d_csc(3*pi/4),'iderivative csc, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_csc_cs(pi),d_csc(pi),'iderivative csc, x₀ = π'));
test_suite.add_test(TestEqual(d_csc_cs(5*pi/4),d_csc(5*pi/4),'iderivative csc, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_csc_cs(3*pi/2),d_csc(3*pi/2),'iderivative csc, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_csc_cs(7*pi/4),d_csc(7*pi/4),'iderivative csc, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_csc_cs(2*pi),d_csc(2*pi),'iderivative csc, x₀ = 2π'));

% sec
test_suite.add_test(TestEqual(d_sec_cs(0),d_sec(0),'iderivative sec, x₀ = 0'));
test_suite.add_test(TestEqual(d_sec_cs(pi/4),d_sec(pi/4),'iderivative sec, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_sec_cs(pi/2),d_sec(pi/2),'iderivative sec, x₀ = π/2'));
test_suite.add_test(TestEqual(d_sec_cs(3*pi/4),d_sec(3*pi/4),'iderivative sec, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_sec_cs(pi),d_sec(pi),'iderivative sec, x₀ = π'));
test_suite.add_test(TestEqual(d_sec_cs(5*pi/4),d_sec(5*pi/4),'iderivative sec, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_sec_cs(3*pi/2),d_sec(3*pi/2),'iderivative sec, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_sec_cs(7*pi/4),d_sec(7*pi/4),'iderivative sec, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_sec_cs(2*pi),d_sec(2*pi),'iderivative sec, x₀ = 2π'));

% cot
test_suite.add_test(TestEqual(d_cot_cs(0),d_cot(0),'iderivative cot, x₀ = 0'));
test_suite.add_test(TestEqual(d_cot_cs(pi/4),d_cot(pi/4),'iderivative cot, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_cot_cs(pi/2),d_cot(pi/2),'iderivative cot, x₀ = π/2'));
test_suite.add_test(TestEqual(d_cot_cs(3*pi/4),d_cot(3*pi/4),'iderivative cot, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_cot_cs(pi),d_cot(pi),'iderivative cot, x₀ = π'));
test_suite.add_test(TestEqual(d_cot_cs(5*pi/4),d_cot(5*pi/4),'iderivative cot, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_cot_cs(3*pi/2),d_cot(3*pi/2),'iderivative cot, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_cot_cs(7*pi/4),d_cot(7*pi/4),'iderivative cot, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_cot_cs(2*pi),d_cot(2*pi),'iderivative cot, x₀ = 2π'));



%% INVERSE TRIGONOMETRIC FUNCTIONS

% asin
test_suite.add_test(TestEqual(d_asin_cs(-1.5),d_asin(-1.5),'iderivative asin, x₀ < -1'));
test_suite.add_test(TestEqual(d_asin_cs(-1),d_asin(-1),'iderivative asin, x₀ = -1'));
test_suite.add_test(TestEqual(d_asin_cs(-0.5),d_asin(-0.5),'iderivative asin, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_asin_cs(0),d_asin(0),'iderivative asin, x₀ = 0'));
test_suite.add_test(TestEqual(d_asin_cs(0.5),d_asin(0.5),'iderivative asin, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_asin_cs(1),d_asin(1),'iderivative asin, x₀ = 1'));
test_suite.add_test(TestEqual(d_asin_cs(1.5),d_asin(1.5),'iderivative asin, x₀ > 1'));

% acos
test_suite.add_test(TestEqual(d_acos_cs(-1.5),d_acos(-1.5),'iderivative acos, x₀ < -1'));
test_suite.add_test(TestEqual(d_acos_cs(-1),d_acos(-1),'iderivative acos, x₀ = -1'));
test_suite.add_test(TestEqual(d_acos_cs(-0.5),d_acos(-0.5),'iderivative acos, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acos_cs(0),d_acos(0),'iderivative acos, x₀ = 0'));
test_suite.add_test(TestEqual(d_acos_cs(0.5),d_acos(0.5),'iderivative acos, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_acos_cs(1),d_acos(1),'iderivative acos, x₀ = 1'));
test_suite.add_test(TestEqual(d_acos_cs(1.5),d_acos(1.5),'iderivative acos, x₀ > 1'));

% atan
test_suite.add_test(TestEqual(d_atan_cs(-1.5),d_atan(-1.5),'iderivative atan, x₀ < -1'));
test_suite.add_test(TestEqual(d_atan_cs(-1),d_atan(-1),'iderivative atan, x₀ = -1'));
test_suite.add_test(TestEqual(d_atan_cs(-0.5),d_atan(-0.5),'iderivative atan, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_atan_cs(0),d_atan(0),'iderivative atan, x₀ = 0'));
test_suite.add_test(TestEqual(d_atan_cs(0.5),d_atan(0.5),'iderivative atan, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_atan_cs(1),d_atan(1),'iderivative atan, x₀ = 1'));
test_suite.add_test(TestEqual(d_atan_cs(1.5),d_atan(1.5),'iderivative atan, x₀ > 1'));

% acsc
test_suite.add_test(TestEqual(d_acsc_cs(-1.5),d_acsc(-1.5),'iderivative acsc, x₀ < -1'));
test_suite.add_test(TestEqual(d_acsc_cs(-1),d_acsc(-1),'iderivative acsc, x₀ = -1'));
test_suite.add_test(TestEqual(d_acsc_cs(-0.5),d_acsc(-0.5),'iderivative acsc, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acsc_cs(0),d_acsc(0),'iderivative acsc, x₀ = 0'));
test_suite.add_test(TestEqual(d_acsc_cs(0.5),d_acsc(0.5),'iderivative acsc, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_acsc_cs(1),d_acsc(1),'iderivative acsc, x₀ = 1'));
test_suite.add_test(TestEqual(d_acsc_cs(1.5),d_acsc(1.5),'iderivative acsc, x₀ > 1'));

% asec
test_suite.add_test(TestEqual(d_asec_cs(-1.5),d_asec(-1.5),'iderivative asec, x₀ < -1'));
test_suite.add_test(TestEqual(d_asec_cs(-1),d_asec(-1),'iderivative asec, x₀ = -1'));
test_suite.add_test(TestEqual(d_asec_cs(-0.5),d_asec(-0.5),'iderivative asec, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_asec_cs(0),d_asec(0),'iderivative asec, x₀ = 0'));
test_suite.add_test(TestEqual(d_asec_cs(0.5),d_asec(0.5),'iderivative asec, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_asec_cs(1),d_asec(1),'iderivative asec, x₀ = 1'));
test_suite.add_test(TestEqual(d_asec_cs(1.5),d_asec(1.5),'iderivative asec, x₀ > 1'));

% acot
test_suite.add_test(TestEqual(d_acot_cs(-1.5),d_acot(-1.5),'iderivative acot, x₀ < -1'));
test_suite.add_test(TestEqual(d_acot_cs(-1),d_acot(-1),'iderivative acot, x₀ = -1'));
test_suite.add_test(TestEqual(d_acot_cs(-0.5),d_acot(-0.5),'iderivative acot, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acot_cs(0),d_acot(0),'iderivative acot, x₀ = 0'));
test_suite.add_test(TestEqual(d_acot_cs(0.5),d_acot(0.5),'iderivative acot, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_acot_cs(1),d_acot(1),'iderivative acot, x₀ = 1'));
test_suite.add_test(TestEqual(d_acot_cs(1.5),d_acot(1.5),'iderivative acot, x₀ > 1'));



%% HYPERBOLIC FUNCTIONS

% sinh
test_suite.add_test(TestEqual(d_sinh_cs(-1),d_sinh(-1),'iderivative sinh, x₀ < 0'));
test_suite.add_test(TestEqual(d_sinh_cs(0),d_sinh(0),'iderivative sinh, x₀ = 0'));
test_suite.add_test(TestEqual(d_sinh_cs(1),d_sinh(1),'iderivative sinh, x₀ > 0'));

% cosh
test_suite.add_test(TestEqual(d_cosh_cs(-1),d_cosh(-1),'iderivative cosh, x₀ < 0'));
test_suite.add_test(TestEqual(d_cosh_cs(0),d_cosh(0),'iderivative cosh, x₀ = 0'));
test_suite.add_test(TestEqual(d_cosh_cs(1),d_cosh(1),'iderivative cosh, x₀ > 0'));

% tanh
test_suite.add_test(TestEqual(d_tanh_cs(-1),d_tanh(-1),'iderivative tanh, x₀ < 0'));
test_suite.add_test(TestEqual(d_tanh_cs(0),d_tanh(0),'iderivative tanh, x₀ = 0'));
test_suite.add_test(TestEqual(d_tanh_cs(1),d_tanh(1),'iderivative tanh, x₀ > 0'));

% csch
test_suite.add_test(TestEqual(d_csch_cs(-1),d_csch(-1),'iderivative csch, x₀ < 0'));
test_suite.add_test(TestEqual(d_csch_cs(0),d_csch(0),'iderivative csch, x₀ = 0'));
test_suite.add_test(TestEqual(d_csch_cs(1),d_csch(1),'iderivative csch, x₀ > 0'));

% sech
test_suite.add_test(TestEqual(d_sech_cs(-1),d_sech(-1),'iderivative sech, x₀ < 0'));
test_suite.add_test(TestEqual(d_sech_cs(0),d_sech(0),'iderivative sech, x₀ = 0'));
test_suite.add_test(TestEqual(d_sech_cs(1),d_sech(1),'iderivative sech, x₀ > 0'));

% tanh
test_suite.add_test(TestEqual(d_tanh_cs(-1),d_tanh(-1),'iderivative tanh, x₀ < 0'));
test_suite.add_test(TestEqual(d_tanh_cs(0),d_tanh(0),'iderivative tanh, x₀ = 0'));
test_suite.add_test(TestEqual(d_tanh_cs(1),d_tanh(1),'iderivative tanh, x₀ > 0'));



%% INVERSE HYPERBOLIC FUNCTIONS

% asinh
test_suite.add_test(TestEqual(d_asinh_cs(-1.5),d_asinh(-1.5),'iderivative asinh, x₀ < -1'));
test_suite.add_test(TestEqual(d_asinh_cs(-1),d_asinh(-1),'iderivative asinh, x₀ = -1'));
test_suite.add_test(TestEqual(d_asinh_cs(-0.5),d_asinh(-0.5),'iderivative asinh, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_asinh_cs(0),d_asinh(0),'iderivative asinh, x₀ = 0'));
test_suite.add_test(TestEqual(d_asinh_cs(0.5),d_asinh(0.5),'iderivative asinh, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_asinh_cs(1),d_asinh(1),'iderivative asinh, x₀ = 1'));
test_suite.add_test(TestEqual(d_asinh_cs(1.5),d_asinh(1.5),'iderivative asinh, x₀ > 1'));

% acosh
test_suite.add_test(TestEqual(d_acosh_cs(-1.5),d_acosh(-1.5),'iderivative acosh, x₀ < -1'));
test_suite.add_test(TestEqual(d_acosh_cs(-1),d_acosh(-1),'iderivative acosh, x₀ = -1'));
test_suite.add_test(TestEqual(d_acosh_cs(-0.5),d_acosh(-0.5),'iderivative acosh, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acosh_cs(0),d_acosh(0),'iderivative acosh, x₀ = 0'));
test_suite.add_test(TestEqual(d_acosh_cs(0.5),d_acosh(0.5),'iderivative acosh, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_acosh_cs(1),d_acosh(1),'iderivative acosh, x₀ = 1'));
test_suite.add_test(TestEqual(d_acosh_cs(1.5),d_acosh(1.5),'iderivative acosh, x₀ > 1'));

% atanh
test_suite.add_test(TestEqual(d_atanh_cs(-1.5),d_atanh(-1.5),'iderivative atanh, x₀ < -1'));
test_suite.add_test(TestEqual(d_atanh_cs(-1),d_atanh(-1),'iderivative atanh, x₀ = -1'));
test_suite.add_test(TestEqual(d_atanh_cs(-0.5),d_atanh(-0.5),'iderivative atanh, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_atanh_cs(0),d_atanh(0),'iderivative atanh, x₀ = 0'));
test_suite.add_test(TestEqual(d_atanh_cs(0.5),d_atanh(0.5),'iderivative atanh, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_atanh_cs(1),d_atanh(1),'iderivative atanh, x₀ = 1'));
test_suite.add_test(TestEqual(d_atanh_cs(1.5),d_atanh(1.5),'iderivative atanh, x₀ > 1'));

% acsch
test_suite.add_test(TestEqual(d_acsch_cs(-1.5),d_acsch(-1.5),'iderivative acsch, x₀ < -1'));
test_suite.add_test(TestEqual(d_acsch_cs(-1),d_acsch(-1),'iderivative acsch, x₀ = -1'));
test_suite.add_test(TestEqual(d_acsch_cs(-0.5),d_acsch(-0.5),'iderivative acsch, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acsch_cs(0),d_acsch(0),'iderivative acsch, x₀ = 0'));
test_suite.add_test(TestEqual(d_acsch_cs(0.5),d_acsch(0.5),'iderivative acsch, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_acsch_cs(1),d_acsch(1),'iderivative acsch, x₀ = 1'));
test_suite.add_test(TestEqual(d_acsch_cs(1.5),d_acsch(1.5),'iderivative acsch, x₀ > 1'));

% asech
test_suite.add_test(TestEqual(d_asech_cs(-1.5),d_asech(-1.5),'iderivative asech, x₀ < -1'));
test_suite.add_test(TestEqual(d_asech_cs(-1),d_asech(-1),'iderivative asech, x₀ = -1'));
test_suite.add_test(TestEqual(d_asech_cs(-0.5),d_asech(-0.5),'iderivative asech, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_asech_cs(0),d_asech(0),'iderivative asech, x₀ = 0'));
test_suite.add_test(TestEqual(d_asech_cs(0.5),d_asech(0.5),'iderivative asech, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_asech_cs(1),d_asech(1),'iderivative asech, x₀ = 1'));
test_suite.add_test(TestEqual(d_asech_cs(1.5),d_asech(1.5),'iderivative asech, x₀ > 1'));

% acoth
test_suite.add_test(TestEqual(d_acoth_cs(-1.5),d_acoth(-1.5),'iderivative acoth, x₀ < -1'));
test_suite.add_test(TestEqual(d_acoth_cs(-1),d_acoth(-1),'iderivative acoth, x₀ = -1'));
test_suite.add_test(TestEqual(d_acoth_cs(-0.5),d_acoth(-0.5),'iderivative acoth, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acoth_cs(0),d_acoth(0),'iderivative acoth, x₀ = 0'));
test_suite.add_test(TestEqual(d_acoth_cs(0.5),d_acoth(0.5),'iderivative acoth, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_acoth_cs(1),d_acoth(1),'iderivative acoth, x₀ = 1'));
test_suite.add_test(TestEqual(d_acoth_cs(1.5),d_acoth(1.5),'iderivative acoth, x₀ > 1'));

test_suite.run;