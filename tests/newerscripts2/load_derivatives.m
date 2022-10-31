%% load_derivatives.m
% Numerical Differentiation Toolbox
%
% Loads derivatives for unit testing purposes.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-10-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% DEPENDENCIES:
%   • Numerical Differentiation Toolbox (https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox)



%% TRUE DERIVATIVES

% absolute value
d_abs = @(x) d_abs_func(x);
d_iabs = @(x) d_abs_func(x);

% square root
d_sqrt = @(x) 0.5*x^(-0.5);

% power
d_power = @(x,b) (b^x)*log(b);

% exponential
d_exp = @(x) exp(x);

% logarithms
d_log = @(x) 1/x;
d_log10 = @(x) 1/(x*log(10));

% trigonometric functions
d_sin = @(x) cos(x);
d_cos = @(x) -sin(x);
d_tan = @(x) sec(x)^2;
d_csc = @(x) -csc(x)*tan(x);
d_sec = @(x) sec(x)*tan(x);
d_cot = @(x) -csc(x)^2;

% inverse trigonometric functions
d_asin = @(x) 1/sqrt(1-x^2);
d_acos = @(x) -1/sqrt(1-x^2);
d_atan = @(x) 1/(1+x^2);
d_acsc = @(x) -1/(x*sqrt(x^2-1));
d_asec = @(x) 1/(x*sqrt(x^2-1));
d_acot = @(x) -1/(1+x^2);

% hyperbolic functions
d_sinh = @(x) cosh(x);
d_cosh = @(x) sinh(x);
d_tanh = @(x) sech(x)^2;
d_csch = @(x) -csch(x)*coth(x);
d_sech = @(x) -sech(x)*tanh(x);
d_coth = @(x) -csch(x)^2;

% inverse hyperbolic functions
d_asinh = @(x) 1/sqrt(1+x^2);
d_acosh = @(x) 1/sqrt(x^2-1);
d_atanh = @(x) 1/(1-x^2);
d_acsch = @(x) -1/(abs(x)*sqrt(x^2+1));
d_asech = @(x) -1/(x*sqrt(1-x^2));
d_acoth = @(x) 1/(1-x^2);



%% FORWARD DIFFERENCE APPROXIMATIONS

% absolute value
d_abs_fd = @(x) fderivative(@(x)abs(x),x);
d_iabs_fd = @(x) fderivative(@(x)iabs(x),x);

% square root
d_sqrt_fd = @(x) fderivative(@(x)sqrt(x),x);

% power
d_power_fd = @(x,b) fderivative(@(x)b^x,x);

% exponential
d_exp_fd = @(x) fderivative(@(x)exp(x),x);

% logarithms
d_log_fd = @(x) fderivative(@(x)log(x),x);
d_log10_fd = @(x) fderivative(@(x)log10(x),x);

% trigonometric functions
d_sin_fd = @(x) fderivative(@(x)sin(x),x);
d_cos_fd = @(x) fderivative(@(x)cos(x),x);
d_tan_fd = @(x) fderivative(@(x)tan(x),x);
d_fdc_fd = @(x) fderivative(@(x)csc(x),x);
d_sec_fd = @(x) fderivative(@(x)sec(x),x);
d_cot_fd = @(x) fderivative(@(x)cot(x),x);

% inverse trigonometric functions
d_asin_fd = @(x) fderivative(@(x)asin(x),x);
d_acos_fd = @(x) fderivative(@(x)acos(x),x);
d_atan_fd = @(x) fderivative(@(x)atan(x),x);
d_acsc_fd = @(x) fderivative(@(x)acsc(x),x);
d_asec_fd = @(x) fderivative(@(x)asec(x),x);
d_acot_fd = @(x) fderivative(@(x)acot(x),x);

% hyperbolic functions
d_sinh_fd = @(x) fderivative(@(x)sinh(x),x);
d_cosh_fd = @(x) fderivative(@(x)cosh(x),x);
d_tanh_fd = @(x) fderivative(@(x)tanh(x),x);
d_csch_fd = @(x) fderivative(@(x)csch(x),x);
d_sech_fd = @(x) fderivative(@(x)sech(x),x);
d_coth_fd = @(x) fderivative(@(x)coth(x),x);

% inverse hyperbolic functions
d_asinh_fd = @(x) fderivative(@(x)asinh(x),x);
d_acosh_fd = @(x) fderivative(@(x)acosh(x),x);
d_atanh_fd = @(x) fderivative(@(x)atanh(x),x);
d_acsch_fd = @(x) fderivative(@(x)acsch(x),x);
d_asech_fd = @(x) fderivative(@(x)asech(x),x);
d_acoth_fd = @(x) fderivative(@(x)acoth(x),x);



%% CENTRAL DIFFERENCE APPROXIMATIONS

% absolute value
d_abs_cd = @(x) cderivative(@(x)abs(x),x);
d_iabs_cd = @(x) cderivative(@(x)iabs(x),x);

% square root
d_sqrt_cd = @(x) cderivative(@(x)sqrt(x),x);

% power
d_power_cd = @(x,b) cderivative(@(x)b^x,x);

% exponential
d_exp_cd = @(x) cderivative(@(x)exp(x),x);

% logarithms
d_log_cd = @(x) cderivative(@(x)log(x),x);
d_log10_cd = @(x) cderivative(@(x)log10(x),x);

% trigonometric functions
d_sin_cd = @(x) cderivative(@(x)sin(x),x);
d_cos_cd = @(x) cderivative(@(x)cos(x),x);
d_tan_cd = @(x) cderivative(@(x)tan(x),x);
d_cdc_cd = @(x) cderivative(@(x)csc(x),x);
d_sec_cd = @(x) cderivative(@(x)sec(x),x);
d_cot_cd = @(x) cderivative(@(x)cot(x),x);

% inverse trigonometric functions
d_asin_cd = @(x) cderivative(@(x)asin(x),x);
d_acos_cd = @(x) cderivative(@(x)acos(x),x);
d_atan_cd = @(x) cderivative(@(x)atan(x),x);
d_acsc_cd = @(x) cderivative(@(x)acsc(x),x);
d_asec_cd = @(x) cderivative(@(x)asec(x),x);
d_acot_cd = @(x) cderivative(@(x)acot(x),x);

% hyperbolic functions
d_sinh_cd = @(x) cderivative(@(x)sinh(x),x);
d_cosh_cd = @(x) cderivative(@(x)cosh(x),x);
d_tanh_cd = @(x) cderivative(@(x)tanh(x),x);
d_csch_cd = @(x) cderivative(@(x)csch(x),x);
d_sech_cd = @(x) cderivative(@(x)sech(x),x);
d_coth_cd = @(x) cderivative(@(x)coth(x),x);

% inverse hyperbolic functions
d_asinh_cd = @(x) cderivative(@(x)asinh(x),x);
d_acosh_cd = @(x) cderivative(@(x)acosh(x),x);
d_atanh_cd = @(x) cderivative(@(x)atanh(x),x);
d_acsch_cd = @(x) cderivative(@(x)acsch(x),x);
d_asech_cd = @(x) cderivative(@(x)asech(x),x);
d_acoth_cd = @(x) cderivative(@(x)acoth(x),x);



%% COMPLEX-STEP APPROXIMATIONS

% absolute value
d_abs_cs = @(x) iderivative(@(x)abs(x),x);
d_iabs_cs = @(x) iderivative(@(x)iabs(x),x);

% square root
d_sqrt_cs = @(x) iderivative(@(x)sqrt(x),x);

% power
d_power_cs = @(x,b) iderivative(@(x)b^x,x);

% exponential
d_exp_cs = @(x) iderivative(@(x)exp(x),x);

% logarithms
d_log_cs = @(x) iderivative(@(x)log(x),x);
d_log10_cs = @(x) iderivative(@(x)log10(x),x);

% trigonometric functions
d_sin_cs = @(x) iderivative(@(x)sin(x),x);
d_cos_cs = @(x) iderivative(@(x)cos(x),x);
d_tan_cs = @(x) iderivative(@(x)tan(x),x);
d_csc_cs = @(x) iderivative(@(x)csc(x),x);
d_sec_cs = @(x) iderivative(@(x)sec(x),x);
d_cot_cs = @(x) iderivative(@(x)cot(x),x);

% inverse trigonometric functions
d_asin_cs = @(x) iderivative(@(x)asin(x),x);
d_acos_cs = @(x) iderivative(@(x)acos(x),x);
d_atan_cs = @(x) iderivative(@(x)atan(x),x);
d_acsc_cs = @(x) iderivative(@(x)acsc(x),x);
d_asec_cs = @(x) iderivative(@(x)asec(x),x);
d_acot_cs = @(x) iderivative(@(x)acot(x),x);

% hyperbolic functions
d_sinh_cs = @(x) iderivative(@(x)sinh(x),x);
d_cosh_cs = @(x) iderivative(@(x)cosh(x),x);
d_tanh_cs = @(x) iderivative(@(x)tanh(x),x);
d_csch_cs = @(x) iderivative(@(x)csch(x),x);
d_sech_cs = @(x) iderivative(@(x)sech(x),x);
d_coth_cs = @(x) iderivative(@(x)coth(x),x);

% inverse hyperbolic functions
d_asinh_cs = @(x) iderivative(@(x)asinh(x),x);
d_acosh_cs = @(x) iderivative(@(x)acosh(x),x);
d_atanh_cs = @(x) iderivative(@(x)atanh(x),x);
d_acsch_cs = @(x) iderivative(@(x)acsch(x),x);
d_asech_cs = @(x) iderivative(@(x)asech(x),x);
d_acoth_cs = @(x) iderivative(@(x)acoth(x),x);



%% AUXILIARY FUNCTIONS

function d_abs = d_abs_func(x)
    if x > 0
        d_abs = 1;
    elseif x < 0
        d_abs = -1;
    else
        d_abs = nan;
    end
end