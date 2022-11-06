%% TEST_derivative.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fderivative, fderivative, and fderivative functions.
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



%% SCRIPT SETUP

% clears Workspace and closes all figures
clear; close all;

% loads derivatives
load_derivatives;



%% INSTANTIATE TEST SUITE

test_suite = TestSuite('derivative tests',false);



%% UNIT TESTS FOR fderivative

% ----------------------------
% Polynomials and square root.
% ----------------------------

% polynomial
test_suite.add_test(TestEqual(d_poly_fd(2,0),d_poly(2,0),'fderivative x⁰, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_fd(2,1),d_poly(2,1),'fderivative x, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_fd(2,2),d_poly(2,2),'fderivative x², x₀ = 2',7));
test_suite.add_test(TestEqual(d_poly_fd(2,3),d_poly(2,3),'fderivative x³, x₀ = 2',6));
test_suite.add_test(TestEqual(d_poly_fd(2,7),d_poly(2,7),'fderivative x⁷, x₀ = 2',4));
test_suite.add_test(TestEqual(d_poly_fd(2,-1),d_poly(2,-1),'fderivative 1/x, x₀ = 2',8));
test_suite.add_test(TestEqual(d_poly_fd(2,-2),d_poly(2,-2),'fderivative x⁻², x₀ = 2',7));
test_suite.add_test(TestEqual(d_poly_fd(2,-3),d_poly(2,-3),'fderivative x⁻³, x₀ = 2',7));
test_suite.add_test(TestEqual(d_poly_fd(2,-7),d_poly(2,-7),'fderivative x⁻⁷, x₀ = 2',8));
test_suite.add_test(TestEqual(d_poly_fd(2,1/3),d_poly(2,1/3),'fderivative x¹ᐟ³, x₀ = 2',8));
test_suite.add_test(TestEqual(d_poly_fd(2,7/3),d_poly(2,7/3),'fderivative x⁷ᐟ³, x₀ = 2',7));
test_suite.add_test(TestEqual(d_poly_fd(2,-1/3),d_poly(2,-1/3),'fderivative x⁻¹ᐟ³, x₀ = 2',8));
test_suite.add_test(TestEqual(d_poly_fd(2,-7/3),d_poly(2,-7/3),'fderivative x⁻⁷ᐟ³, x₀ = 2',7));

% sqrt
test_suite.add_test(TestEqual(d_sqrt_fd(0.5),d_sqrt(0.5),'fderivative sqrt, 0 < x₀ < 1',7));
test_suite.add_test(TestEqual(d_sqrt_fd(1),d_sqrt(1),'fderivative sqrt, x₀ = 1'));
test_suite.add_test(TestEqual(d_sqrt_fd(1.5),d_sqrt(1.5),'fderivative sqrt, x₀ > 1',8));

% --------------------------------
% Exponential and power functions.
% --------------------------------

% exp
test_suite.add_test(TestEqual(d_exp_fd(-1),d_exp(-1),'fderivative exp, x₀ < 0',7));
test_suite.add_test(TestEqual(d_exp_fd(0),d_exp(0),'fderivative exp, x₀ = 0'));
test_suite.add_test(TestEqual(d_exp_fd(1),d_exp(1),'fderivative exp, x₀ > 0',6));

% power
b = 5;
test_suite.add_test(TestEqual(d_power_fd(-1,b),d_power(-1,b),'fderivative power, x₀ < 0',7));
test_suite.add_test(TestEqual(d_power_fd(0,b),d_power(0,b),'fderivative power, x₀ = 0',7));
test_suite.add_test(TestEqual(d_power_fd(1,b),d_power(1,b),'fderivative power, x₀ > 0',6));

% ----------------------
% Logarithmic functions.
% ----------------------

% log
test_suite.add_test(TestEqual(d_log_fd(0.5),d_log(0.5),'fderivative log, 0 < x₀ < 1',7));
test_suite.add_test(TestEqual(d_log_fd(1),d_log(1),'fderivative log, x₀ = 1',7));
test_suite.add_test(TestEqual(d_log_fd(1.5),d_log(1.5),'fderivative log, x₀ > 1',7));

% log10
test_suite.add_test(TestEqual(d_log10_fd(0.5),d_log10(0.5),'fderivative log10, 0 < x₀ < 1',6));
test_suite.add_test(TestEqual(d_log10_fd(1),d_log10(1),'fderivative log10, x₀ = 1',8));
test_suite.add_test(TestEqual(d_log10_fd(1.5),d_log10(1.5),'fderivative log10, x₀ > 1',8));

% ------------------------
% Trigonometric functions.
% ------------------------

% sin
test_suite.add_test(TestEqual(d_sin_fd(0),d_sin(0),'fderivative sin, x₀ = 0'));
test_suite.add_test(TestEqual(d_sin_fd(pi/4),d_sin(pi/4),'fderivative sin, 0 < x₀ < π/2',7));
test_suite.add_test(TestEqual(d_sin_fd(pi/2),d_sin(pi/2),'fderivative sin, x₀ = π/2',7));
test_suite.add_test(TestEqual(d_sin_fd(3*pi/4),d_sin(3*pi/4),'fderivative sin, π/2 < x₀ < π',7));
test_suite.add_test(TestEqual(d_sin_fd(pi),d_sin(pi),'fderivative sin, x₀ = π',9));
test_suite.add_test(TestEqual(d_sin_fd(5*pi/4),d_sin(5*pi/4),'fderivative sin, π < x₀ < 3π/2',7));
test_suite.add_test(TestEqual(d_sin_fd(3*pi/2),d_sin(3*pi/2),'fderivative sin, x₀ = 3π/2',7));
test_suite.add_test(TestEqual(d_sin_fd(7*pi/4),d_sin(7*pi/4),'fderivative sin, 3π/2 < x₀ < 2π',7));
test_suite.add_test(TestEqual(d_sin_fd(2*pi),d_sin(2*pi),'fderivative sin, x₀ = 2π',8));

% cos
test_suite.add_test(TestEqual(d_cos_fd(0),d_cos(0),'fderivative cos, x₀ = 0',7));
test_suite.add_test(TestEqual(d_cos_fd(pi/4),d_cos(pi/4),'fderivative cos, 0 < x₀ < π/2',7));
test_suite.add_test(TestEqual(d_cos_fd(pi/2),d_cos(pi/2),'fderivative cos, x₀ = π/2',9));
test_suite.add_test(TestEqual(d_cos_fd(3*pi/4),d_cos(3*pi/4),'fderivative cos, π/2 < x₀ < π',7));
test_suite.add_test(TestEqual(d_cos_fd(pi),d_cos(pi),'fderivative cos, x₀ = π',7));
test_suite.add_test(TestEqual(d_cos_fd(5*pi/4),d_cos(5*pi/4),'fderivative cos, π < x₀ < 3π/2',7));
test_suite.add_test(TestEqual(d_cos_fd(3*pi/2),d_cos(3*pi/2),'fderivative cos, x₀ = 3π/2',8));
test_suite.add_test(TestEqual(d_cos_fd(7*pi/4),d_cos(7*pi/4),'fderivative cos, 3π/2 < x₀ < 2π',6));
test_suite.add_test(TestEqual(d_cos_fd(2*pi),d_cos(2*pi),'fderivative cos, x₀ = 2π',6));

% tan
test_suite.add_test(TestEqual(d_tan_fd(0),d_tan(0),'fderivative tan, x₀ = 0'));
test_suite.add_test(TestEqual(d_tan_fd(pi/4),d_tan(pi/4),'fderivative tan, 0 < x₀ < π/2',6));
test_suite.add_test(TestEqual(d_tan_fd(3*pi/4),d_tan(3*pi/4),'fderivative tan, π/2 < x₀ < π',6));
test_suite.add_test(TestEqual(d_tan_fd(pi),d_tan(pi),'fderivative tan, x₀ = π',9));
test_suite.add_test(TestEqual(d_tan_fd(5*pi/4),d_tan(5*pi/4),'fderivative tan, π < x₀ < 3π/2',6));
test_suite.add_test(TestEqual(d_tan_fd(7*pi/4),d_tan(7*pi/4),'fderivative tan, 3π/2 < x₀ < 2π',6));
test_suite.add_test(TestEqual(d_tan_fd(2*pi),d_tan(2*pi),'fderivative tan, x₀ = 2π',8));

% csc
test_suite.add_test(TestEqual(d_csc_fd(pi/4),d_csc(pi/4),'fderivative csc, 0 < x₀ < π/2',6));
test_suite.add_test(TestEqual(d_csc_fd(pi/2),d_csc(pi/2),'fderivative csc, x₀ = π/2',7));
test_suite.add_test(TestEqual(d_csc_fd(3*pi/4),d_csc(3*pi/4),'fderivative csc, π/2 < x₀ < π',6));
test_suite.add_test(TestEqual(d_csc_fd(5*pi/4),d_csc(5*pi/4),'fderivative csc, π < x₀ < 3π/2',5));
test_suite.add_test(TestEqual(d_csc_fd(3*pi/2),d_csc(3*pi/2),'fderivative csc, x₀ = 3π/2',7));
test_suite.add_test(TestEqual(d_csc_fd(7*pi/4),d_csc(7*pi/4),'fderivative csc, 3π/2 < x₀ < 2π',6));

% sec
test_suite.add_test(TestEqual(d_sec_fd(0),d_sec(0),'fderivative sec, x₀ = 0',7));
test_suite.add_test(TestEqual(d_sec_fd(pi/4),d_sec(pi/4),'fderivative sec, 0 < x₀ < π/2',7));
test_suite.add_test(TestEqual(d_sec_fd(3*pi/4),d_sec(3*pi/4),'fderivative sec, π/2 < x₀ < π',5));
test_suite.add_test(TestEqual(d_sec_fd(pi),d_sec(pi),'fderivative sec, x₀ = π',7));
test_suite.add_test(TestEqual(d_sec_fd(5*pi/4),d_sec(5*pi/4),'fderivative sec, π < x₀ < 3π/2',6));
test_suite.add_test(TestEqual(d_sec_fd(7*pi/4),d_sec(7*pi/4),'fderivative sec, 3π/2 < x₀ < 2π',5));
test_suite.add_test(TestEqual(d_sec_fd(2*pi),d_sec(2*pi),'fderivative sec, x₀ = 2π',6));

% cot
test_suite.add_test(TestEqual(d_cot_fd(pi/4),d_cot(pi/4),'fderivative cot, 0 < x₀ < π/2',6));
test_suite.add_test(TestEqual(d_cot_fd(pi/2),d_cot(pi/2),'fderivative cot, x₀ = π/2',9));
test_suite.add_test(TestEqual(d_cot_fd(3*pi/4),d_cot(3*pi/4),'fderivative cot, π/2 < x₀ < π',6));
test_suite.add_test(TestEqual(d_cot_fd(5*pi/4),d_cot(5*pi/4),'fderivative cot, π < x₀ < 3π/2',6));
test_suite.add_test(TestEqual(d_cot_fd(3*pi/2),d_cot(3*pi/2),'fderivative cot, x₀ = 3π/2',8));
test_suite.add_test(TestEqual(d_cot_fd(7*pi/4),d_cot(7*pi/4),'fderivative cot, 3π/2 < x₀ < 2π',6));

% --------------------------------
% Inverse trigonometric functions.
% --------------------------------

% asin
test_suite.add_test(TestEqual(d_asin_fd(-0.5),d_asin(-0.5),'fderivative asin, -1 < x₀ < 0',7));
test_suite.add_test(TestEqual(d_asin_fd(0),d_asin(0),'fderivative asin, x₀ = 0'));
test_suite.add_test(TestEqual(d_asin_fd(0.5),d_asin(0.5),'fderivative asin, 0 < x₀ < 1',7));

% acos
test_suite.add_test(TestEqual(d_acos_fd(-0.5),d_acos(-0.5),'fderivative acos, -1 < x₀ < 0',9));
test_suite.add_test(TestEqual(d_acos_fd(0),d_acos(0),'fderivative acos, x₀ = 0'));
test_suite.add_test(TestEqual(d_acos_fd(0.5),d_acos(0.5),'fderivative acos, 0 < x₀ < 1',7));

% atan
test_suite.add_test(TestEqual(d_atan_fd(-1.5),d_atan(-1.5),'fderivative atan, x₀ < -1',8));
test_suite.add_test(TestEqual(d_atan_fd(-1),d_atan(-1),'fderivative atan, x₀ = -1',7));
test_suite.add_test(TestEqual(d_atan_fd(-0.5),d_atan(-0.5),'fderivative atan, -1 < x₀ < 0',7));
test_suite.add_test(TestEqual(d_atan_fd(0),d_atan(0),'fderivative atan, x₀ = 0'));
test_suite.add_test(TestEqual(d_atan_fd(0.5),d_atan(0.5),'fderivative atan, 0 < x₀ < 1',7));
test_suite.add_test(TestEqual(d_atan_fd(1),d_atan(1),'fderivative atan, x₀ = 1',7));
test_suite.add_test(TestEqual(d_atan_fd(1.5),d_atan(1.5),'fderivative atan, x₀ > 1',7));

% acsc
test_suite.add_test(TestEqual(d_acsc_fd(-1.5),d_acsc(-1.5),'fderivative acsc, x₀ < -1',7));
test_suite.add_test(TestEqual(d_acsc_fd(1.5),d_acsc(1.5),'fderivative acsc, x₀ > 1',7));

% asec
test_suite.add_test(TestEqual(d_asec_fd(-1.5),d_asec(-1.5),'fderivative asec, x₀ < -1',7));
test_suite.add_test(TestEqual(d_asec_fd(1.5),d_asec(1.5),'fderivative asec, x₀ > 1',7));

% acot
test_suite.add_test(TestEqual(d_acot_fd(-1.5),d_acot(-1.5),'fderivative acot, x₀ < -1',8));
test_suite.add_test(TestEqual(d_acot_fd(-1),d_acot(-1),'fderivative acot, x₀ = -1',7));
test_suite.add_test(TestEqual(d_acot_fd(-0.5),d_acot(-0.5),'fderivative acot, -1 < x₀ < 0',7));
test_suite.add_test(TestEqual(d_acot_fd(0),d_acot(0),'fderivative acot, x₀ = 0'));
test_suite.add_test(TestEqual(d_acot_fd(0.5),d_acot(0.5),'fderivative acot, 0 < x₀ < 1',7));
test_suite.add_test(TestEqual(d_acot_fd(1),d_acot(1),'fderivative acot, x₀ = 1',7));
test_suite.add_test(TestEqual(d_acot_fd(1.5),d_acot(1.5),'fderivative acot, x₀ > 1',7));

% ---------------------
% Hyperbolic functions.
% ---------------------

% sinh
test_suite.add_test(TestEqual(d_sinh_fd(-1),d_sinh(-1),'fderivative sinh, x₀ < 0',7));
test_suite.add_test(TestEqual(d_sinh_fd(0),d_sinh(0),'fderivative sinh, x₀ = 0'));
test_suite.add_test(TestEqual(d_sinh_fd(1),d_sinh(1),'fderivative sinh, x₀ > 0',6));

% cosh
test_suite.add_test(TestEqual(d_cosh_fd(-1),d_cosh(-1),'fderivative cosh, x₀ < 0',7));
test_suite.add_test(TestEqual(d_cosh_fd(0),d_cosh(0),'fderivative cosh, x₀ = 0'));
test_suite.add_test(TestEqual(d_cosh_fd(1),d_cosh(1),'fderivative cosh, x₀ > 0',7));

% tanh
test_suite.add_test(TestEqual(d_tanh_fd(-1),d_tanh(-1),'fderivative tanh, x₀ < 0',7));
test_suite.add_test(TestEqual(d_tanh_fd(0),d_tanh(0),'fderivative tanh, x₀ = 0'));
test_suite.add_test(TestEqual(d_tanh_fd(1),d_tanh(1),'fderivative tanh, x₀ > 0',7));

% csch
test_suite.add_test(TestEqual(d_csch_fd(-1),d_csch(-1),'fderivative csch, x₀ < 0',6));
test_suite.add_test(TestEqual(d_csch_fd(1),d_csch(1),'fderivative csch, x₀ > 0',7));

% sech
test_suite.add_test(TestEqual(d_sech_fd(-1),d_sech(-1),'fderivative sech, x₀ < 0',8));
test_suite.add_test(TestEqual(d_sech_fd(0),d_sech(0),'fderivative sech, x₀ = 0'));
test_suite.add_test(TestEqual(d_sech_fd(1),d_sech(1),'fderivative sech, x₀ > 0',8));

% tanh
test_suite.add_test(TestEqual(d_tanh_fd(-1),d_tanh(-1),'fderivative tanh, x₀ < 0',7));
test_suite.add_test(TestEqual(d_tanh_fd(0),d_tanh(0),'fderivative tanh, x₀ = 0'));
test_suite.add_test(TestEqual(d_tanh_fd(1),d_tanh(1),'fderivative tanh, x₀ > 0',7));

% -----------------------------
% Inverse hyperbolic functions.
% -----------------------------

% asinh
test_suite.add_test(TestEqual(d_asinh_fd(-1.5),d_asinh(-1.5),'fderivative asinh, x₀ < -1',7));
test_suite.add_test(TestEqual(d_asinh_fd(-1),d_asinh(-1),'fderivative asinh, x₀ = -1',7));
test_suite.add_test(TestEqual(d_asinh_fd(-0.5),d_asinh(-0.5),'fderivative asinh, -1 < x₀ < 0',7));
test_suite.add_test(TestEqual(d_asinh_fd(0),d_asinh(0),'fderivative asinh, x₀ = 0'));
test_suite.add_test(TestEqual(d_asinh_fd(0.5),d_asinh(0.5),'fderivative asinh, 0 < x₀ < 1',8));
test_suite.add_test(TestEqual(d_asinh_fd(1),d_asinh(1),'fderivative asinh, x₀ = 1',8));
test_suite.add_test(TestEqual(d_asinh_fd(1.5),d_asinh(1.5),'fderivative asinh, x₀ > 1',7));

% acosh
test_suite.add_test(TestEqual(d_acosh_fd(1.5),d_acosh(1.5),'fderivative acosh, x₀ > 1',7));

% atanh
test_suite.add_test(TestEqual(d_atanh_fd(-0.5),d_atanh(-0.5),'fderivative atanh, -1 < x₀ < 0',7));
test_suite.add_test(TestEqual(d_atanh_fd(0),d_atanh(0),'fderivative atanh, x₀ = 0'));
test_suite.add_test(TestEqual(d_atanh_fd(0.5),d_atanh(0.5),'fderivative atanh, 0 < x₀ < 1',6));

% acsch
test_suite.add_test(TestEqual(d_acsch_fd(-1.5),d_acsch(-1.5),'fderivative acsch, x₀ < -1',7));
test_suite.add_test(TestEqual(d_acsch_fd(-1),d_acsch(-1),'fderivative acsch, x₀ = -1',7));
test_suite.add_test(TestEqual(d_acsch_fd(-0.5),d_acsch(-0.5),'fderivative acsch, -1 < x₀ < 0',7));
test_suite.add_test(TestEqual(d_acsch_fd(0.5),d_acsch(0.5),'fderivative acsch, 0 < x₀ < 1',6));
test_suite.add_test(TestEqual(d_acsch_fd(1),d_acsch(1),'fderivative acsch, x₀ = 1',7));
test_suite.add_test(TestEqual(d_acsch_fd(1.5),d_acsch(1.5),'fderivative acsch, x₀ > 1',7));

% asech
test_suite.add_test(TestEqual(d_asech_fd(0.5),d_asech(0.5),'fderivative asech, 0 < x₀ < 1',6));

% acoth
test_suite.add_test(TestEqual(d_acoth_fd(-1.5),d_acoth(-1.5),'fderivative acoth, x₀ < -1',7));
test_suite.add_test(TestEqual(d_acoth_fd(1.5),d_acoth(1.5),'fderivative acoth, x₀ > 1',7));



%% RUNS TEST SUITE

test_suite.run;