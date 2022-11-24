%% TEST_derivative.m
% Numerical Differentiation Toolbox
%
% Unit testing of the fderivative, cderivative, and iderivative functions.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-23
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

% coth
test_suite.add_test(TestEqual(d_coth_fd(-1),d_coth(-1),'fderivative coth, x₀ < 0',7));
test_suite.add_test(TestEqual(d_coth_fd(1),d_coth(1),'fderivative coth, x₀ > 0',6));

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

% coth
test_suite.add_test(TestEqual(d_coth_cd(-1),d_coth(-1),'cderivative coth, x₀ < 0',9));
test_suite.add_test(TestEqual(d_coth_cd(1),d_coth(1),'cderivative coth, x₀ > 0',9));

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



%% UNIT TESTS FOR iderivative

% ----------------------------
% Polynomials and square root.
% ----------------------------

% polynomial
test_suite.add_test(TestEqual(d_poly_cs(2,0),d_poly(2,0),'iderivative x⁰, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,1),d_poly(2,1),'iderivative x, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,2),d_poly(2,2),'iderivative x², x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,3),d_poly(2,3),'iderivative x³, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,7),d_poly(2,7),'iderivative x⁷, x₀ = 2',13));
test_suite.add_test(TestEqual(d_poly_cs(2,-1),d_poly(2,-1),'iderivative 1/x, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,-2),d_poly(2,-2),'iderivative x⁻², x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,-3),d_poly(2,-3),'iderivative x⁻³, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,-7),d_poly(2,-7),'iderivative x⁻⁷, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,1/3),d_poly(2,1/3),'iderivative x¹ᐟ³, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,7/3),d_poly(2,7/3),'iderivative x⁷ᐟ³, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,-1/3),d_poly(2,-1/3),'iderivative x⁻¹ᐟ³, x₀ = 2'));
test_suite.add_test(TestEqual(d_poly_cs(2,-7/3),d_poly(2,-7/3),'iderivative x⁻⁷ᐟ³, x₀ = 2'));

% sqrt
test_suite.add_test(TestEqual(d_sqrt_cs(0.5),d_sqrt(0.5),'iderivative sqrt, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_sqrt_cs(1),d_sqrt(1),'iderivative sqrt, x₀ = 1'));
test_suite.add_test(TestEqual(d_sqrt_cs(1.5),d_sqrt(1.5),'iderivative sqrt, x₀ > 1'));

% --------------------------------
% Exponential and power functions.
% --------------------------------

% exp
test_suite.add_test(TestEqual(d_exp_cs(-1),d_exp(-1),'iderivative exp, x₀ < 0'));
test_suite.add_test(TestEqual(d_exp_cs(0),d_exp(0),'iderivative exp, x₀ = 0'));
test_suite.add_test(TestEqual(d_exp_cs(1),d_exp(1),'iderivative exp, x₀ > 0'));

% power
b = 5;
test_suite.add_test(TestEqual(d_power_cs(-1,b),d_power(-1,b),'iderivative power, x₀ < 0'));
test_suite.add_test(TestEqual(d_power_cs(0,b),d_power(0,b),'iderivative power, x₀ = 0'));
test_suite.add_test(TestEqual(d_power_cs(1,b),d_power(1,b),'iderivative power, x₀ > 0'));

% ----------------------
% Logarithmic functions.
% ----------------------

% log
test_suite.add_test(TestEqual(d_log_cs(0.5),d_log(0.5),'iderivative log, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_log_cs(1),d_log(1),'iderivative log, x₀ = 1'));
test_suite.add_test(TestEqual(d_log_cs(1.5),d_log(1.5),'iderivative log, x₀ > 1',15));

% log10
test_suite.add_test(TestEqual(d_log10_cs(0.5),d_log10(0.5),'iderivative log10, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_log10_cs(1),d_log10(1),'iderivative log10, x₀ = 1'));
test_suite.add_test(TestEqual(d_log10_cs(1.5),d_log10(1.5),'iderivative log10, x₀ > 1',15));

% ------------------------
% Trigonometric functions.
% ------------------------

% sin
test_suite.add_test(TestEqual(d_sin_cs(0),d_sin(0),'iderivative sin, x₀ = 0'));
test_suite.add_test(TestEqual(d_sin_cs(pi/4),d_sin(pi/4),'iderivative sin, 0 < x₀ < π/2',15));
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
test_suite.add_test(TestEqual(d_cos_cs(3*pi/4),d_cos(3*pi/4),'iderivative cos, π/2 < x₀ < π',15));
test_suite.add_test(TestEqual(d_cos_cs(pi),d_cos(pi),'iderivative cos, x₀ = π'));
test_suite.add_test(TestEqual(d_cos_cs(5*pi/4),d_cos(5*pi/4),'iderivative cos, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_cos_cs(3*pi/2),d_cos(3*pi/2),'iderivative cos, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_cos_cs(7*pi/4),d_cos(7*pi/4),'iderivative cos, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_cos_cs(2*pi),d_cos(2*pi),'iderivative cos, x₀ = 2π'));

% tan
test_suite.add_test(TestEqual(d_tan_cs(0),d_tan(0),'iderivative tan, x₀ = 0'));
test_suite.add_test(TestEqual(d_tan_cs(pi/4),d_tan(pi/4),'iderivative tan, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_tan_cs(3*pi/4),d_tan(3*pi/4),'iderivative tan, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_tan_cs(pi),d_tan(pi),'iderivative tan, x₀ = π'));
test_suite.add_test(TestEqual(d_tan_cs(5*pi/4),d_tan(5*pi/4),'iderivative tan, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_tan_cs(7*pi/4),d_tan(7*pi/4),'iderivative tan, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_tan_cs(2*pi),d_tan(2*pi),'iderivative tan, x₀ = 2π'));

% csc
test_suite.add_test(TestEqual(d_csc_cs(pi/4),d_csc(pi/4),'iderivative csc, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_csc_cs(pi/2),d_csc(pi/2),'iderivative csc, x₀ = π/2',14));
test_suite.add_test(TestEqual(d_csc_cs(3*pi/4),d_csc(3*pi/4),'iderivative csc, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_csc_cs(5*pi/4),d_csc(5*pi/4),'iderivative csc, π < x₀ < 3π/2',15));
test_suite.add_test(TestEqual(d_csc_cs(3*pi/2),d_csc(3*pi/2),'iderivative csc, x₀ = 3π/2'));
test_suite.add_test(TestEqual(d_csc_cs(7*pi/4),d_csc(7*pi/4),'iderivative csc, 3π/2 < x₀ < 2π'));

% sec
test_suite.add_test(TestEqual(d_sec_cs(0),d_sec(0),'iderivative sec, x₀ = 0'));
test_suite.add_test(TestEqual(d_sec_cs(pi/4),d_sec(pi/4),'iderivative sec, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_sec_cs(3*pi/4),d_sec(3*pi/4),'iderivative sec, π/2 < x₀ < π'));
test_suite.add_test(TestEqual(d_sec_cs(pi),d_sec(pi),'iderivative sec, x₀ = π'));
test_suite.add_test(TestEqual(d_sec_cs(5*pi/4),d_sec(5*pi/4),'iderivative sec, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_sec_cs(7*pi/4),d_sec(7*pi/4),'iderivative sec, 3π/2 < x₀ < 2π'));
test_suite.add_test(TestEqual(d_sec_cs(2*pi),d_sec(2*pi),'iderivative sec, x₀ = 2π'));

% cot
test_suite.add_test(TestEqual(d_cot_cs(pi/4),d_cot(pi/4),'iderivative cot, 0 < x₀ < π/2'));
test_suite.add_test(TestEqual(d_cot_cs(pi/2),d_cot(pi/2),'iderivative cot, x₀ = π/2'));
test_suite.add_test(TestEqual(d_cot_cs(3*pi/4),d_cot(3*pi/4),'iderivative cot, π/2 < x₀ < π',15));
test_suite.add_test(TestEqual(d_cot_cs(5*pi/4),d_cot(5*pi/4),'iderivative cot, π < x₀ < 3π/2'));
test_suite.add_test(TestEqual(d_cot_cs(3*pi/2),d_cot(3*pi/2),'iderivative cot, x₀ = 3π/2',15));
test_suite.add_test(TestEqual(d_cot_cs(7*pi/4),d_cot(7*pi/4),'iderivative cot, 3π/2 < x₀ < 2π'));

% --------------------------------
% Inverse trigonometric functions.
% --------------------------------

% asin
test_suite.add_test(TestEqual(d_asin_cs(-0.5),d_asin(-0.5),'iderivative asin, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_asin_cs(0),d_asin(0),'iderivative asin, x₀ = 0'));
test_suite.add_test(TestEqual(d_asin_cs(0.5),d_asin(0.5),'iderivative asin, 0 < x₀ < 1'));

% acos
test_suite.add_test(TestEqual(d_acos_cs(-0.5),d_acos(-0.5),'iderivative acos, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acos_cs(0),d_acos(0),'iderivative acos, x₀ = 0'));
test_suite.add_test(TestEqual(d_acos_cs(0.5),d_acos(0.5),'iderivative acos, 0 < x₀ < 1'));

% atan
test_suite.add_test(TestEqual(d_atan_cs(-1.5),d_atan(-1.5),'iderivative atan, x₀ < -1'));
test_suite.add_test(TestEqual(d_atan_cs(-1),d_atan(-1),'iderivative atan, x₀ = -1'));
test_suite.add_test(TestEqual(d_atan_cs(-0.5),d_atan(-0.5),'iderivative atan, -1 < x₀ < 0',15));
test_suite.add_test(TestEqual(d_atan_cs(0),d_atan(0),'iderivative atan, x₀ = 0'));
test_suite.add_test(TestEqual(d_atan_cs(0.5),d_atan(0.5),'iderivative atan, 0 < x₀ < 1',15));
test_suite.add_test(TestEqual(d_atan_cs(1),d_atan(1),'iderivative atan, x₀ = 1'));
test_suite.add_test(TestEqual(d_atan_cs(1.5),d_atan(1.5),'iderivative atan, x₀ > 1'));

% acsc
test_suite.add_test(TestEqual(d_acsc_cs(-1.5),d_acsc(-1.5),'iderivative acsc, x₀ < -1'));
test_suite.add_test(TestEqual(d_acsc_cs(1.5),d_acsc(1.5),'iderivative acsc, x₀ > 1'));

% asec
test_suite.add_test(TestEqual(d_asec_cs(-1.5),d_asec(-1.5),'iderivative asec, x₀ < -1'));
test_suite.add_test(TestEqual(d_asec_cs(1.5),d_asec(1.5),'iderivative asec, x₀ > 1'));

% acot
test_suite.add_test(TestEqual(d_acot_cs(-1.5),d_acot(-1.5),'iderivative acot, x₀ < -1'));
test_suite.add_test(TestEqual(d_acot_cs(-1),d_acot(-1),'iderivative acot, x₀ = -1'));
test_suite.add_test(TestEqual(d_acot_cs(-0.5),d_acot(-0.5),'iderivative acot, -1 < x₀ < 0',15));
test_suite.add_test(TestEqual(d_acot_cs(0),d_acot(0),'iderivative acot, x₀ = 0'));
test_suite.add_test(TestEqual(d_acot_cs(0.5),d_acot(0.5),'iderivative acot, 0 < x₀ < 1',15));
test_suite.add_test(TestEqual(d_acot_cs(1),d_acot(1),'iderivative acot, x₀ = 1'));
test_suite.add_test(TestEqual(d_acot_cs(1.5),d_acot(1.5),'iderivative acot, x₀ > 1'));

% ---------------------
% Hyperbolic functions.
% ---------------------

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
test_suite.add_test(TestEqual(d_csch_cs(1),d_csch(1),'iderivative csch, x₀ > 0'));

% sech
test_suite.add_test(TestEqual(d_sech_cs(-1),d_sech(-1),'iderivative sech, x₀ < 0'));
test_suite.add_test(TestEqual(d_sech_cs(0),d_sech(0),'iderivative sech, x₀ = 0'));
test_suite.add_test(TestEqual(d_sech_cs(1),d_sech(1),'iderivative sech, x₀ > 0'));

% coth
test_suite.add_test(TestEqual(d_coth_cs(-1),d_coth(-1),'iderivative coth, x₀ < 0'));
test_suite.add_test(TestEqual(d_coth_cs(1),d_coth(1),'iderivative coth, x₀ > 0'));

% -----------------------------
% Inverse hyperbolic functions.
% -----------------------------

% asinh
test_suite.add_test(TestEqual(d_asinh_cs(-1.5),d_asinh(-1.5),'iderivative asinh, x₀ < -1'));
test_suite.add_test(TestEqual(d_asinh_cs(-1),d_asinh(-1),'iderivative asinh, x₀ = -1'));
test_suite.add_test(TestEqual(d_asinh_cs(-0.5),d_asinh(-0.5),'iderivative asinh, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_asinh_cs(0),d_asinh(0),'iderivative asinh, x₀ = 0'));
test_suite.add_test(TestEqual(d_asinh_cs(0.5),d_asinh(0.5),'iderivative asinh, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_asinh_cs(1),d_asinh(1),'iderivative asinh, x₀ = 1'));
test_suite.add_test(TestEqual(d_asinh_cs(1.5),d_asinh(1.5),'iderivative asinh, x₀ > 1'));

% acosh
test_suite.add_test(TestEqual(d_acosh_cs(1.5),d_acosh(1.5),'iderivative acosh, x₀ > 1'));

% atanh
test_suite.add_test(TestEqual(d_atanh_cs(-0.5),d_atanh(-0.5),'iderivative atanh, -1 < x₀ < 0',15));
test_suite.add_test(TestEqual(d_atanh_cs(0),d_atanh(0),'iderivative atanh, x₀ = 0'));
test_suite.add_test(TestEqual(d_atanh_cs(0.5),d_atanh(0.5),'iderivative atanh, 0 < x₀ < 1',15));

% acsch
test_suite.add_test(TestEqual(d_acsch_cs(-1.5),d_acsch(-1.5),'iderivative acsch, x₀ < -1'));
test_suite.add_test(TestEqual(d_acsch_cs(-1),d_acsch(-1),'iderivative acsch, x₀ = -1'));
test_suite.add_test(TestEqual(d_acsch_cs(-0.5),d_acsch(-0.5),'iderivative acsch, -1 < x₀ < 0'));
test_suite.add_test(TestEqual(d_acsch_cs(0.5),d_acsch(0.5),'iderivative acsch, 0 < x₀ < 1'));
test_suite.add_test(TestEqual(d_acsch_cs(1),d_acsch(1),'iderivative acsch, x₀ = 1'));
test_suite.add_test(TestEqual(d_acsch_cs(1.5),d_acsch(1.5),'iderivative acsch, x₀ > 1'));

% asech
test_suite.add_test(TestEqual(d_asech_cs(0.5),d_asech(0.5),'iderivative asech, 0 < x₀ < 1'));

% acoth
test_suite.add_test(TestEqual(d_acoth_cs(-1.5),d_acoth(-1.5),'iderivative acoth, x₀ < -1',15));
test_suite.add_test(TestEqual(d_acoth_cs(1.5),d_acoth(1.5),'iderivative acoth, x₀ > 1',15));



%% RUNS TEST SUITE

test_suite.run;