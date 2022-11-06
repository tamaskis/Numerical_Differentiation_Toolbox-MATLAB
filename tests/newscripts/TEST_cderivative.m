%% TEST_derivative.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fderivative, cderivative, and cderivative functions.
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



%% UNIT TESTS FOR cderivative

% ----------------------------
% Polynomials and square root.
% ----------------------------

% polynomial
test_suite.add_test(TestEqual(d_poly_cd(2,0),d_poly(2,0),'cderivative x⁰, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cd(2,1),d_poly(2,1),'cderivative x, x₀ = 2',11));
test_suite.add_test(TestEqual(d_poly_cd(2,2),d_poly(2,2),'cderivative x², x₀ = 2',11));
test_suite.add_test(TestEqual(d_poly_cd(2,3),d_poly(2,3),'cderivative x³, x₀ = 2',9));
test_suite.add_test(TestEqual(d_poly_cd(2,7),d_poly(2,7),'cderivative x⁷, x₀ = 2',6));
test_suite.add_test(TestEqual(d_poly_cd(2,-1),d_poly(2,-1),'cderivative 1/x, x₀ = 2',10));
test_suite.add_test(TestEqual(d_poly_cd(2,-2),d_poly(2,-2),'cderivative x⁻², x₀ = 2',10));
test_suite.add_test(TestEqual(d_poly_cd(2,-3),d_poly(2,-3),'cderivative x⁻³, x₀ = 2',9));
test_suite.add_test(TestEqual(d_poly_cd(2,-7),d_poly(2,-7),'cderivative x⁻⁷, x₀ = 2',10));
test_suite.add_test(TestEqual(d_poly_cd(2,1/3),d_poly(2,1/3),'cderivative x¹ᐟ³, x₀ = 2',9));
test_suite.add_test(TestEqual(d_poly_cd(2,7/3),d_poly(2,7/3),'cderivative x⁷ᐟ³, x₀ = 2',10));
test_suite.add_test(TestEqual(d_poly_cd(2,-1/3),d_poly(2,-1/3),'cderivative x⁻¹ᐟ³, x₀ = 2',11));
test_suite.add_test(TestEqual(d_poly_cd(2,-7/3),d_poly(2,-7/3),'cderivative x⁻⁷ᐟ³, x₀ = 2',9));

% sqrt
test_suite.add_test(TestEqual(d_sqrt_cd(0.5),d_sqrt(0.5),'cderivative sqrt, 0 < x₀ < 1',10));
test_suite.add_test(TestEqual(d_sqrt_cd(1),d_sqrt(1),'cderivative sqrt, x₀ = 1',10));
test_suite.add_test(TestEqual(d_sqrt_cd(1.5),d_sqrt(1.5),'cderivative sqrt, x₀ > 1',10));

% --------------------------------
% Exponential and power functions.
% --------------------------------

% exp
test_suite.add_test(TestEqual(d_exp_cd(-1),d_exp(-1),'cderivative exp, x₀ < 0',10));
test_suite.add_test(TestEqual(d_exp_cd(0),d_exp(0),'cderivative exp, x₀ = 0',10));
test_suite.add_test(TestEqual(d_exp_cd(1),d_exp(1),'cderivative exp, x₀ > 0',10));

% power
b = 5;
test_suite.add_test(TestEqual(d_power_cd(-1,b),d_power(-1,b),'cderivative power, x₀ < 0',10));
test_suite.add_test(TestEqual(d_power_cd(0,b),d_power(0,b),'cderivative power, x₀ = 0',9));
test_suite.add_test(TestEqual(d_power_cd(1,b),d_power(1,b),'cderivative power, x₀ > 0',8));

% ----------------------
% Logarithmic functions.
% ----------------------

% log
test_suite.add_test(TestEqual(d_log_cd(0.5),d_log(0.5),'cderivative log, 0 < x₀ < 1',9));
test_suite.add_test(TestEqual(d_log_cd(1),d_log(1),'cderivative log, x₀ = 1',10));
test_suite.add_test(TestEqual(d_log_cd(1.5),d_log(1.5),'cderivative log, x₀ > 1',10));

% log10
test_suite.add_test(TestEqual(d_log10_cd(0.5),d_log10(0.5),'cderivative log10, 0 < x₀ < 1',9));
test_suite.add_test(TestEqual(d_log10_cd(1),d_log10(1),'cderivative log10, x₀ = 1',10));
test_suite.add_test(TestEqual(d_log10_cd(1.5),d_log10(1.5),'cderivative log10, x₀ > 1',10));

% ------------------------
% Trigonometric functions.
% ------------------------

% sin
test_suite.add_test(TestEqual(d_sin_cd(0),d_sin(0),'cderivative sin, x₀ = 0',10));
test_suite.add_test(TestEqual(d_sin_cd(pi/4),d_sin(pi/4),'cderivative sin, 0 < x₀ < π/2',10));
test_suite.add_test(TestEqual(d_sin_cd(pi/2),d_sin(pi/2),'cderivative sin, x₀ = π/2',15));
test_suite.add_test(TestEqual(d_sin_cd(3*pi/4),d_sin(3*pi/4),'cderivative sin, π/2 < x₀ < π',9));
test_suite.add_test(TestEqual(d_sin_cd(pi),d_sin(pi),'cderivative sin, x₀ = π',9));
test_suite.add_test(TestEqual(d_sin_cd(5*pi/4),d_sin(5*pi/4),'cderivative sin, π < x₀ < 3π/2',9));
test_suite.add_test(TestEqual(d_sin_cd(3*pi/2),d_sin(3*pi/2),'cderivative sin, x₀ = 3π/2',15));
test_suite.add_test(TestEqual(d_sin_cd(7*pi/4),d_sin(7*pi/4),'cderivative sin, 3π/2 < x₀ < 2π',9));
test_suite.add_test(TestEqual(d_sin_cd(2*pi),d_sin(2*pi),'cderivative sin, x₀ = 2π',9));

% cos
test_suite.add_test(TestEqual(d_cos_cd(0),d_cos(0),'cderivative cos, x₀ = 0'));
test_suite.add_test(TestEqual(d_cos_cd(pi/4),d_cos(pi/4),'cderivative cos, 0 < x₀ < π/2',10));
test_suite.add_test(TestEqual(d_cos_cd(pi/2),d_cos(pi/2),'cderivative cos, x₀ = π/2',10));
test_suite.add_test(TestEqual(d_cos_cd(3*pi/4),d_cos(3*pi/4),'cderivative cos, π/2 < x₀ < π',9));
test_suite.add_test(TestEqual(d_cos_cd(pi),d_cos(pi),'cderivative cos, x₀ = π',15));
test_suite.add_test(TestEqual(d_cos_cd(5*pi/4),d_cos(5*pi/4),'cderivative cos, π < x₀ < 3π/2',9));
test_suite.add_test(TestEqual(d_cos_cd(3*pi/2),d_cos(3*pi/2),'cderivative cos, x₀ = 3π/2',9));
test_suite.add_test(TestEqual(d_cos_cd(7*pi/4),d_cos(7*pi/4),'cderivative cos, 3π/2 < x₀ < 2π',9));
test_suite.add_test(TestEqual(d_cos_cd(2*pi),d_cos(2*pi),'cderivative cos, x₀ = 2π',15));

% tan
test_suite.add_test(TestEqual(d_tan_cd(0),d_tan(0),'cderivative tan, x₀ = 0',10));
test_suite.add_test(TestEqual(d_tan_cd(pi/4),d_tan(pi/4),'cderivative tan, 0 < x₀ < π/2',9));
test_suite.add_test(TestEqual(d_tan_cd(3*pi/4),d_tan(3*pi/4),'cderivative tan, π/2 < x₀ < π',8));
test_suite.add_test(TestEqual(d_tan_cd(pi),d_tan(pi),'cderivative tan, x₀ = π',9));
test_suite.add_test(TestEqual(d_tan_cd(5*pi/4),d_tan(5*pi/4),'cderivative tan, π < x₀ < 3π/2',8));
test_suite.add_test(TestEqual(d_tan_cd(7*pi/4),d_tan(7*pi/4),'cderivative tan, 3π/2 < x₀ < 2π',8));
test_suite.add_test(TestEqual(d_tan_cd(2*pi),d_tan(2*pi),'cderivative tan, x₀ = 2π',8));

% csc
test_suite.add_test(TestEqual(d_csc_cd(pi/4),d_csc(pi/4),'cderivative csc, 0 < x₀ < π/2',8));
test_suite.add_test(TestEqual(d_csc_cd(pi/2),d_csc(pi/2),'cderivative csc, x₀ = π/2',15));
test_suite.add_test(TestEqual(d_csc_cd(3*pi/4),d_csc(3*pi/4),'cderivative csc, π/2 < x₀ < π',8));
test_suite.add_test(TestEqual(d_csc_cd(5*pi/4),d_csc(5*pi/4),'cderivative csc, π < x₀ < 3π/2',8));
test_suite.add_test(TestEqual(d_csc_cd(3*pi/2),d_csc(3*pi/2),'cderivative csc, x₀ = 3π/2',15));
test_suite.add_test(TestEqual(d_csc_cd(7*pi/4),d_csc(7*pi/4),'cderivative csc, 3π/2 < x₀ < 2π',7));

% sec
test_suite.add_test(TestEqual(d_sec_cd(0),d_sec(0),'cderivative sec, x₀ = 0'));
test_suite.add_test(TestEqual(d_sec_cd(pi/4),d_sec(pi/4),'cderivative sec, 0 < x₀ < π/2',8));
test_suite.add_test(TestEqual(d_sec_cd(3*pi/4),d_sec(3*pi/4),'cderivative sec, π/2 < x₀ < π',8));
test_suite.add_test(TestEqual(d_sec_cd(pi),d_sec(pi),'cderivative sec, x₀ = π',15));
test_suite.add_test(TestEqual(d_sec_cd(5*pi/4),d_sec(5*pi/4),'cderivative sec, π < x₀ < 3π/2',8));
test_suite.add_test(TestEqual(d_sec_cd(7*pi/4),d_sec(7*pi/4),'cderivative sec, 3π/2 < x₀ < 2π',7));
test_suite.add_test(TestEqual(d_sec_cd(2*pi),d_sec(2*pi),'cderivative sec, x₀ = 2π',15));

% cot
test_suite.add_test(TestEqual(d_cot_cd(pi/4),d_cot(pi/4),'cderivative cot, 0 < x₀ < π/2',9));
test_suite.add_test(TestEqual(d_cot_cd(pi/2),d_cot(pi/2),'cderivative cot, x₀ = π/2',9));
test_suite.add_test(TestEqual(d_cot_cd(3*pi/4),d_cot(3*pi/4),'cderivative cot, π/2 < x₀ < π',8));
test_suite.add_test(TestEqual(d_cot_cd(5*pi/4),d_cot(5*pi/4),'cderivative cot, π < x₀ < 3π/2',8));
test_suite.add_test(TestEqual(d_cot_cd(3*pi/2),d_cot(3*pi/2),'cderivative cot, x₀ = 3π/2',9));
test_suite.add_test(TestEqual(d_cot_cd(7*pi/4),d_cot(7*pi/4),'cderivative cot, 3π/2 < x₀ < 2π',8));

% --------------------------------
% Inverse trigonometric functions.
% --------------------------------

% asin
test_suite.add_test(TestEqual(d_asin_cd(-0.5),d_asin(-0.5),'cderivative asin, -1 < x₀ < 0',10));
test_suite.add_test(TestEqual(d_asin_cd(0),d_asin(0),'cderivative asin, x₀ = 0',10));
test_suite.add_test(TestEqual(d_asin_cd(0.5),d_asin(0.5),'cderivative asin, 0 < x₀ < 1',10));

% acos
test_suite.add_test(TestEqual(d_acos_cd(-0.5),d_acos(-0.5),'cderivative acos, -1 < x₀ < 0',10));
test_suite.add_test(TestEqual(d_acos_cd(0),d_acos(0),'cderivative acos, x₀ = 0',10));
test_suite.add_test(TestEqual(d_acos_cd(0.5),d_acos(0.5),'cderivative acos, 0 < x₀ < 1',10));

% atan
test_suite.add_test(TestEqual(d_atan_cd(-1.5),d_atan(-1.5),'cderivative atan, x₀ < -1',10));
test_suite.add_test(TestEqual(d_atan_cd(-1),d_atan(-1),'cderivative atan, x₀ = -1',10));
test_suite.add_test(TestEqual(d_atan_cd(-0.5),d_atan(-0.5),'cderivative atan, -1 < x₀ < 0',11));
test_suite.add_test(TestEqual(d_atan_cd(0),d_atan(0),'cderivative atan, x₀ = 0',10));
test_suite.add_test(TestEqual(d_atan_cd(0.5),d_atan(0.5),'cderivative atan, 0 < x₀ < 1',11));
test_suite.add_test(TestEqual(d_atan_cd(1),d_atan(1),'cderivative atan, x₀ = 1',10));
test_suite.add_test(TestEqual(d_atan_cd(1.5),d_atan(1.5),'cderivative atan, x₀ > 1',10));

% acsc
test_suite.add_test(TestEqual(d_acsc_cd(-1.5),d_acsc(-1.5),'cderivative acsc, x₀ < -1',9));
test_suite.add_test(TestEqual(d_acsc_cd(1.5),d_acsc(1.5),'cderivative acsc, x₀ > 1',9));

% asec
test_suite.add_test(TestEqual(d_asec_cd(-1.5),d_asec(-1.5),'cderivative asec, x₀ < -1',9));
test_suite.add_test(TestEqual(d_asec_cd(1.5),d_asec(1.5),'cderivative asec, x₀ > 1',9));

% acot
test_suite.add_test(TestEqual(d_acot_cd(-1.5),d_acot(-1.5),'cderivative acot, x₀ < -1',10));
test_suite.add_test(TestEqual(d_acot_cd(-1),d_acot(-1),'cderivative acot, x₀ = -1',10));
test_suite.add_test(TestEqual(d_acot_cd(-0.5),d_acot(-0.5),'cderivative acot, -1 < x₀ < 0',11));
test_suite.add_test(TestNotEqual(d_acot_cd(0),d_acot(0),'cderivative acot, x₀ = 0'));
test_suite.add_test(TestEqual(d_acot_cd(0.5),d_acot(0.5),'cderivative acot, 0 < x₀ < 1',11));
test_suite.add_test(TestEqual(d_acot_cd(1),d_acot(1),'cderivative acot, x₀ = 1',10));
test_suite.add_test(TestEqual(d_acot_cd(1.5),d_acot(1.5),'cderivative acot, x₀ > 1',10));

% ---------------------
% Hyperbolic functions.
% ---------------------

% sinh
test_suite.add_test(TestEqual(d_sinh_cd(-1),d_sinh(-1),'cderivative sinh, x₀ < 0',10));
test_suite.add_test(TestEqual(d_sinh_cd(0),d_sinh(0),'cderivative sinh, x₀ = 0',10));
test_suite.add_test(TestEqual(d_sinh_cd(1),d_sinh(1),'cderivative sinh, x₀ > 0',10));

% cosh
test_suite.add_test(TestEqual(d_cosh_cd(-1),d_cosh(-1),'cderivative cosh, x₀ < 0',9));
test_suite.add_test(TestEqual(d_cosh_cd(0),d_cosh(0),'cderivative cosh, x₀ = 0'));
test_suite.add_test(TestEqual(d_cosh_cd(1),d_cosh(1),'cderivative cosh, x₀ > 0',9));

% tanh
test_suite.add_test(TestEqual(d_tanh_cd(-1),d_tanh(-1),'cderivative tanh, x₀ < 0',10));
test_suite.add_test(TestEqual(d_tanh_cd(0),d_tanh(0),'cderivative tanh, x₀ = 0',10));
test_suite.add_test(TestEqual(d_tanh_cd(1),d_tanh(1),'cderivative tanh, x₀ > 0',10));

% csch
test_suite.add_test(TestEqual(d_csch_cd(-1),d_csch(-1),'cderivative csch, x₀ < 0',8));
test_suite.add_test(TestEqual(d_csch_cd(1),d_csch(1),'cderivative csch, x₀ > 0',8));

% sech
test_suite.add_test(TestEqual(d_sech_cd(-1),d_sech(-1),'cderivative sech, x₀ < 0',10));
test_suite.add_test(TestEqual(d_sech_cd(0),d_sech(0),'cderivative sech, x₀ = 0'));
test_suite.add_test(TestEqual(d_sech_cd(1),d_sech(1),'cderivative sech, x₀ > 0',10));

% tanh
test_suite.add_test(TestEqual(d_tanh_cd(-1),d_tanh(-1),'cderivative tanh, x₀ < 0',10));
test_suite.add_test(TestEqual(d_tanh_cd(0),d_tanh(0),'cderivative tanh, x₀ = 0',10));
test_suite.add_test(TestEqual(d_tanh_cd(1),d_tanh(1),'cderivative tanh, x₀ > 0',10));

% -----------------------------
% Inverse hyperbolic functions.
% -----------------------------

% asinh
test_suite.add_test(TestEqual(d_asinh_cd(-1.5),d_asinh(-1.5),'cderivative asinh, x₀ < -1',11));
test_suite.add_test(TestEqual(d_asinh_cd(-1),d_asinh(-1),'cderivative asinh, x₀ = -1',11));
test_suite.add_test(TestEqual(d_asinh_cd(-0.5),d_asinh(-0.5),'cderivative asinh, -1 < x₀ < 0',11));
test_suite.add_test(TestEqual(d_asinh_cd(0),d_asinh(0),'cderivative asinh, x₀ = 0',10));
test_suite.add_test(TestEqual(d_asinh_cd(0.5),d_asinh(0.5),'cderivative asinh, 0 < x₀ < 1',11));
test_suite.add_test(TestEqual(d_asinh_cd(1),d_asinh(1),'cderivative asinh, x₀ = 1',11));
test_suite.add_test(TestEqual(d_asinh_cd(1.5),d_asinh(1.5),'cderivative asinh, x₀ > 1',11));

% acosh
test_suite.add_test(TestEqual(d_acosh_cd(1.5),d_acosh(1.5),'cderivative acosh, x₀ > 1',9));

% atanh
test_suite.add_test(TestEqual(d_atanh_cd(-0.5),d_atanh(-0.5),'cderivative atanh, -1 < x₀ < 0',9));
test_suite.add_test(TestEqual(d_atanh_cd(0),d_atanh(0),'cderivative atanh, x₀ = 0',10));
test_suite.add_test(TestEqual(d_atanh_cd(0.5),d_atanh(0.5),'cderivative atanh, 0 < x₀ < 1',9));

% acsch
test_suite.add_test(TestEqual(d_acsch_cd(-1.5),d_acsch(-1.5),'cderivative acsch, x₀ < -1',10));
test_suite.add_test(TestEqual(d_acsch_cd(-1),d_acsch(-1),'cderivative acsch, x₀ = -1',10));
test_suite.add_test(TestEqual(d_acsch_cd(-0.5),d_acsch(-0.5),'cderivative acsch, -1 < x₀ < 0',9));
test_suite.add_test(TestEqual(d_acsch_cd(0.5),d_acsch(0.5),'cderivative acsch, 0 < x₀ < 1',9));
test_suite.add_test(TestEqual(d_acsch_cd(1),d_acsch(1),'cderivative acsch, x₀ = 1',10));
test_suite.add_test(TestEqual(d_acsch_cd(1.5),d_acsch(1.5),'cderivative acsch, x₀ > 1',10));

% asech
test_suite.add_test(TestEqual(d_asech_cd(0.5),d_asech(0.5),'cderivative asech, 0 < x₀ < 1',9));

% acoth
test_suite.add_test(TestEqual(d_acoth_cd(-1.5),d_acoth(-1.5),'cderivative acoth, x₀ < -1',9));
test_suite.add_test(TestEqual(d_acoth_cd(1.5),d_acoth(1.5),'cderivative acoth, x₀ > 1',9));



%% RUNS TEST SUITE

test_suite.run;