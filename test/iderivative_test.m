%% iderivative_test.m
% Unit testing of the iderivative function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-14
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear;clc;close all;

% adds path to "Numerical Differentiation Toolbox" functions
addpath(genpath("../src"));



%% FUNCTIONS THAT WILL RESULT IN ERRORS

% absolute value (x0 > 0 and x0 < 0) -- FIX IN NEXT SECTION
assert(~(round(iderivative(@(x) abs(x),-1),6) == -1));
assert(~(round(iderivative(@(x) abs(x),1),6) == 1));

% inverse trigonometric functions (x0 < -1) --> NO FIX
x0 = -1.5;
assert(~(round(iderivative(@(x) acsc(x),x0),6) == round(-1/(x0*sqrt(x0^...
    2-1)),6)));
assert(~(round(iderivative(@(x) asec(x),x0),6) == round(1/(x0*sqrt(x0^2-...
    1)),6)));

% inverse hyperbolic functions (0 < x0 < 1) --> NO FIX
x0 = 0.5;
assert(~(round(iderivative(@(x) acoth(x),x0),6) == round(1/(1-x0^2),6)));

% inverse hyperbolic functions (x0 > 1) --> NO FIX
x0 = 1.5;
assert(~(round(iderivative(@(x) atanh(x),x0),6) == round(1/(1-x0^2),6)));

% inverse hyperbolic functions (-1 < x0 < 0) --> NO FIX
x0 = -0.5;
assert(~(round(iderivative(@(x) asech(x),x0),6) == round(-1/(x0*sqrt(1-...
    x0^2)),6)));
assert(~(round(iderivative(@(x) acoth(x),x0),6) == round(1/(1-x0^2),6)));

% inverse hyperbolic functions (x0 < -1) --> NO FIX
x0 = -1.5;
assert(~(round(iderivative(@(x) acosh(x),x0),6) == round(1/sqrt(x0^2-1),...
    6)));
assert(~(round(iderivative(@(x) atanh(x),x0),6) == round(1/(1-x0^2),6)));



%% COMPLEXIFIED FUNCTIONS TO ADDRESS ERRORS FROM PREVIOUS SECTION

% absolute value (x0 > 0 and x0 < 0)
assert((round(iderivative(@(x) iabs(x),-1),6) == -1));
assert((round(iderivative(@(x) iabs(x),1),6) == 1));



%% SQUARE ROOT

% x0 < 1
x0 = 0.5;
assert(round(iderivative(@(x) sqrt(x),x0),6) == round(0.5*x0^(-0.5),6));

% x0 > 1
x0 = 1.5;
assert(round(iderivative(@(x) sqrt(x),x0),6) == round(0.5*x0^(-0.5),6));



%% EXPONENTIAL/POWER FUNCTIONS

% base for power
b = 5;

% x0 > 0
x0 = 1;
assert(round(iderivative(@(x) exp(x),x0),6) == round(exp(x0),6));
assert(round(iderivative(@(x) b^x,x0),6) == round((b^x0)*log(b),6));

% x0 < 0
x0 = -1;
assert(round(iderivative(@(x) exp(x),x0),6) == round(exp(x0),6));
assert(round(iderivative(@(x) b^x,x0),6) == round((b^x0)*log(b),6));

% x0 = 0
x0 = 0;
assert(round(iderivative(@(x) exp(x),x0),6) == round(exp(x0),6));
assert(round(iderivative(@(x) b^x,x0),6) == round((b^x0)*log(b),6));



%% LOGARITHMIC FUNCTIONS

% 0 < x0 < 1
x0 = 0.5;
assert(round(iderivative(@(x) log(x),x0),6) == round(1/x0,6));
assert(round(iderivative(@(x) log10(x),x0),6) == round(1/(x0*log(10)),6));

% x0 > 1
x0 = 1.5;
assert(round(iderivative(@(x) log(x),x0),6) == round(1/x0,6));
assert(round(iderivative(@(x) log10(x),x0),6) == round(1/(x0*log(10)),6));



%% TRIGONOMETRIC FUNCTIONS

% quadrant I
x0 = pi/4;
assert(round(iderivative(@(x) sin(x),x0),6) == round(cos(x0),6));
assert(round(iderivative(@(x) cos(x),x0),6) == round(-sin(x0),6));
assert(round(iderivative(@(x) tan(x),x0),6) == round(sec(x0)^2,6));
assert(round(iderivative(@(x) csc(x),x0),6) == round(-csc(x0)*cot(x0),6));
assert(round(iderivative(@(x) sec(x),x0),6) == round(sec(x0)*tan(x0),6));
assert(round(iderivative(@(x) cot(x),x0),6) == round(-csc(x0)^2,6));

% quadrant II
x0 = 3*pi/4;
assert(round(iderivative(@(x) sin(x),x0),6) == round(cos(x0),6));
assert(round(iderivative(@(x) cos(x),x0),6) == round(-sin(x0),6));
assert(round(iderivative(@(x) tan(x),x0),6) == round(sec(x0)^2,6));
assert(round(iderivative(@(x) csc(x),x0),6) == round(-csc(x0)*cot(x0),6));
assert(round(iderivative(@(x) sec(x),x0),6) == round(sec(x0)*tan(x0),6));
assert(round(iderivative(@(x) cot(x),x0),6) == round(-csc(x0)^2,6));

% quadrant III
x0 = 5*pi/4;
assert(round(iderivative(@(x) sin(x),x0),6) == round(cos(x0),6));
assert(round(iderivative(@(x) cos(x),x0),6) == round(-sin(x0),6));
assert(round(iderivative(@(x) tan(x),x0),6) == round(sec(x0)^2,6));
assert(round(iderivative(@(x) csc(x),x0),6) == round(-csc(x0)*cot(x0),6));
assert(round(iderivative(@(x) sec(x),x0),6) == round(sec(x0)*tan(x0),6));
assert(round(iderivative(@(x) cot(x),x0),6) == round(-csc(x0)^2,6));

% quadrant IV
x0 = 7*pi/4;
assert(round(iderivative(@(x) sin(x),x0),6) == round(cos(x0),6));
assert(round(iderivative(@(x) cos(x),x0),6) == round(-sin(x0),6));
assert(round(iderivative(@(x) tan(x),x0),6) == round(sec(x0)^2,6));
assert(round(iderivative(@(x) csc(x),x0),6) == round(-csc(x0)*cot(x0),6));
assert(round(iderivative(@(x) sec(x),x0),6) == round(sec(x0)*tan(x0),6));
assert(round(iderivative(@(x) cot(x),x0),6) == round(-csc(x0)^2,6));



%% INVERSE TRIGONOMETRIC FUNCTIONS

% 0 < x0 < 1
x0 = 0.5;
assert(round(iderivative(@(x) asin(x),x0),6) == round(1/sqrt(1-x0^2),6));
assert(round(iderivative(@(x) acos(x),x0),6) == round(-1/sqrt(1-x0^2),6));
assert(round(iderivative(@(x) atan(x),x0),6) == round(1/(1+x0^2),6));
assert(round(iderivative(@(x) acot(x),x0),6) == round(-1/(1+x0^2),6));

% x0 > 1
x0 = 1.5;
assert(round(iderivative(@(x) atan(x),x0),6) == round(1/(1+x0^2),6));
assert(round(iderivative(@(x) acsc(x),x0),6) == round(-1/(x0*sqrt(x0^2-...
    1)),6));
assert(round(iderivative(@(x) asec(x),x0),6) == round(1/(x0*sqrt(x0^2-...
    1)),6));
assert(round(iderivative(@(x) acot(x),x0),6) == round(-1/(1+x0^2),6));

% -1 < x0 < 0
x0 = -0.5;
assert(round(iderivative(@(x) asin(x),x0),6) == round(1/sqrt(1-x0^2),6));
assert(round(iderivative(@(x) acos(x),x0),6) == round(-1/sqrt(1-x0^2),6));
assert(round(iderivative(@(x) atan(x),x0),6) == round(1/(1+x0^2),6));
assert(round(iderivative(@(x) acot(x),x0),6) == round(-1/(1+x0^2),6));

% x0 < -1
x0 = -1.5;
assert(round(iderivative(@(x) atan(x),x0),6) == round(1/(1+x0^2),6));
assert(round(iderivative(@(x) acot(x),x0),6) == round(-1/(1+x0^2),6));



%% HYPERBOLIC FUNCTIONS

% positive argument
x0 = 1;
assert(round(iderivative(@(x) sinh(x),x0),6) == round(cosh(x0),6));
assert(round(iderivative(@(x) cosh(x),x0),6) == round(sinh(x0),6));
assert(round(iderivative(@(x) tanh(x),x0),6) == round(sech(x0)^2,6));
assert(round(iderivative(@(x) csch(x),x0),6) == round(-csch(x0)*...
    coth(x0),6));
assert(round(iderivative(@(x) sech(x),x0),6) == round(-sech(x0)*...
    tanh(x0),6));
assert(round(iderivative(@(x) coth(x),x0),6) == round(-csch(x0)^2,6));

% negative argument
x0 = -1;
assert(round(iderivative(@(x) sinh(x),x0),6) == round(cosh(x0),6));
assert(round(iderivative(@(x) cosh(x),x0),6) == round(sinh(x0),6));
assert(round(iderivative(@(x) tanh(x),x0),6) == round(sech(x0)^2,6));
assert(round(iderivative(@(x) csch(x),x0),6) == round(-csch(x0)*...
    coth(x0),6));
assert(round(iderivative(@(x) sech(x),x0),6) == round(-sech(x0)*...
    tanh(x0),6));
assert(round(iderivative(@(x) coth(x),x0),6) == round(-csch(x0)^2,6));



%% INVERSE HYPERBOLIC FUNCTIONS

% 0 < x0 < 1
x0 = 0.5;
assert(round(iderivative(@(x) asinh(x),x0),6) == round(1/sqrt(1+x0^2),6));
assert(round(iderivative(@(x) atanh(x),x0),6) == round(1/(1-x0^2),6));
assert(round(iderivative(@(x) acsch(x),x0),6) == round(-1/(abs(x0)*sqrt(...
    x0^2+1)),6));
assert(round(iderivative(@(x) asech(x),x0),6) == round(-1/(x0*sqrt(1-x0^...
    2)),6));

% x0 > 1
x0 = 1.5;
assert(round(iderivative(@(x) asinh(x),x0),6) == round(1/sqrt(1+x0^2),6));
assert(round(iderivative(@(x) acosh(x),x0),6) == round(1/sqrt(x0^2-1),6));
assert(round(iderivative(@(x) acsch(x),x0),6) == round(-1/(abs(x0)*sqrt(...
    x0^2+1)),6));
assert(round(iderivative(@(x) acoth(x),x0),6) == round(1/(1-x0^2),6));

% -1 < x0 < 0
x0 = -0.5;
assert(round(iderivative(@(x) asinh(x),x0),6) == round(1/sqrt(1+x0^2),6));
assert(round(iderivative(@(x) atanh(x),x0),6) == round(1/(1-x0^2),6));
assert(round(iderivative(@(x) acsch(x),x0),6) == round(-1/(abs(x0)*sqrt(...
    x0^2+1)),6));

% x0 < -1
x0 = -1.5;
assert(round(iderivative(@(x) asinh(x),x0),6) == round(1/sqrt(1+x0^2),6));
assert(round(iderivative(@(x) acsch(x),x0),6) == round(-1/(abs(x0)*sqrt(...
    x0^2+1)),6));
assert(round(iderivative(@(x) acoth(x),x0),6) == round(1/(1-x0^2),6));