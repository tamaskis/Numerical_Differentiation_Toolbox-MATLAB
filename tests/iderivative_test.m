%% iderivative_test.m
% Numerical Differentiation Toolbox
%
% Unit testing of the iderivative function.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-06-04
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% DEPENDENCIES:
%   --> Simple Unit Testing Toolbox (https://github.com/tamaskis/Simple_Unit_Testing_Toolbox-MATLAB)
%   --> Numerical Differentiation Toolbox (https://www.mathworks.com/matlabcentral/fileexchange/97267-numerical-differentiation-toolbox)



%% SCRIPT SETUP

% clears Workspace and Command Window, closes all figures
clear; clc; close all;

% error tolerance
err = 1e-10;



%% FUNCTIONS THAT WILL RESULT IN ERRORS

% absolute value (x0 > 0 and x0 < 0) --> FIX IN NEXT SECTION
TEST_UNEQUAL(iderivative(@(x) abs(x), -1), -1, err);
TEST_UNEQUAL(iderivative(@(x) abs(x),  1),  1, err);

% inverse trigonometric functions (x0 < -1) --> NO FIX
x0 = -1.5;
TEST_UNEQUAL(iderivative(@(x) acsc(x), x0), -1/(x0*sqrt(x0^2-1)), err);
TEST_UNEQUAL(iderivative(@(x) asec(x), x0),  1/(x0*sqrt(x0^2-1)), err);

% inverse hyperbolic functions (0 < x0 < 1) --> NO FIX
x0 = 0.5;
TEST_UNEQUAL(iderivative(@(x) acoth(x), x0), 1/(1-x0^2), err);

% inverse hyperbolic functions (x0 > 1) --> NO FIX
x0 = 1.5;
TEST_UNEQUAL(iderivative(@(x) atanh(x), x0), 1/(1-x0^2), err);

% inverse hyperbolic functions (-1 < x0 < 0) --> NO FIX
x0 = -0.5;
TEST_UNEQUAL(iderivative(@(x) asech(x), x0), -1/(x0*sqrt(1-x0^2)), err);
TEST_UNEQUAL(iderivative(@(x) acoth(x), x0),  1/(1-x0^2),          err);

% inverse hyperbolic functions (x0 < -1) --> NO FIX
x0 = -1.5;
TEST_UNEQUAL(iderivative(@(x) acosh(x), x0), 1/sqrt(x0^2-1), err);
TEST_UNEQUAL(iderivative(@(x) atanh(x), x0), 1/(1-x0^2),     err);



%% COMPLEXIFIED FUNCTIONS TO ADDRESS ERRORS FROM PREVIOUS SECTION

% absolute value (x0 > 0 and x0 < 0)
TEST_EQUAL(iderivative(@(x) iabs(x), -1), -1, err);
TEST_EQUAL(iderivative(@(x) iabs(x),  1),  1, err);



%% SQUARE ROOT

% x0 < 1
x0 = 0.5;
TEST_EQUAL(iderivative(@(x) sqrt(x), x0), 0.5*x0^(-0.5), err);

% x0 > 1
x0 = 1.5;
TEST_EQUAL(iderivative(@(x) sqrt(x), x0), 0.5*x0^(-0.5), err);



%% EXPONENTIAL/POWER FUNCTIONS

% base for power
b = 5;

% x0 > 0
x0 = 1;
TEST_EQUAL(iderivative(@(x) exp(x), x0), exp(x0),       err);
TEST_EQUAL(iderivative(@(x) b^x,    x0), (b^x0)*log(b), err);

% x0 < 0
x0 = -1;
TEST_EQUAL(iderivative(@(x) exp(x), x0), exp(x0),       err);
TEST_EQUAL(iderivative(@(x) b^x,    x0), (b^x0)*log(b), err);

% x0 = 0
x0 = 0;
TEST_EQUAL(iderivative(@(x) exp(x), x0), exp(x0),       err);
TEST_EQUAL(iderivative(@(x) b^x,    x0), (b^x0)*log(b), err);



%% LOGARITHMIC FUNCTIONS

% 0 < x0 < 1
x0 = 0.5;
TEST_EQUAL(iderivative(@(x) log(x),   x0), 1/x0,           err);
TEST_EQUAL(iderivative(@(x) log10(x), x0), 1/(x0*log(10)), err);

% x0 > 1
x0 = 1.5;
TEST_EQUAL(iderivative(@(x) log(x),   x0), 1/x0,           err);
TEST_EQUAL(iderivative(@(x) log10(x), x0), 1/(x0*log(10)), err);



%% TRIGONOMETRIC FUNCTIONS

% quadrant I
x0 = pi/4;
TEST_EQUAL(iderivative(@(x) sin(x), x0),  cos(x0),         err);
TEST_EQUAL(iderivative(@(x) cos(x), x0), -sin(x0),         err);
TEST_EQUAL(iderivative(@(x) tan(x), x0),  sec(x0)^2,       err);
TEST_EQUAL(iderivative(@(x) csc(x), x0), -csc(x0)*cot(x0), err);
TEST_EQUAL(iderivative(@(x) sec(x), x0),  sec(x0)*tan(x0), err);
TEST_EQUAL(iderivative(@(x) cot(x), x0), -csc(x0)^2,       err);

% quadrant II
x0 = 3*pi/4;
TEST_EQUAL(iderivative(@(x) sin(x), x0),  cos(x0),         err);
TEST_EQUAL(iderivative(@(x) cos(x), x0), -sin(x0),         err);
TEST_EQUAL(iderivative(@(x) tan(x), x0),  sec(x0)^2,       err);
TEST_EQUAL(iderivative(@(x) csc(x), x0), -csc(x0)*cot(x0), err);
TEST_EQUAL(iderivative(@(x) sec(x), x0),  sec(x0)*tan(x0), err);
TEST_EQUAL(iderivative(@(x) cot(x), x0), -csc(x0)^2,       err);

% quadrant III
x0 = 5*pi/4;
TEST_EQUAL(iderivative(@(x) sin(x), x0),  cos(x0),         err);
TEST_EQUAL(iderivative(@(x) cos(x), x0), -sin(x0),         err);
TEST_EQUAL(iderivative(@(x) tan(x), x0),  sec(x0)^2,       err);
TEST_EQUAL(iderivative(@(x) csc(x), x0), -csc(x0)*cot(x0), err);
TEST_EQUAL(iderivative(@(x) sec(x), x0),  sec(x0)*tan(x0), err);
TEST_EQUAL(iderivative(@(x) cot(x), x0), -csc(x0)^2,       err);

% quadrant IV
x0 = 7*pi/4;
TEST_EQUAL(iderivative(@(x) sin(x), x0),  cos(x0),         err);
TEST_EQUAL(iderivative(@(x) cos(x), x0), -sin(x0),         err);
TEST_EQUAL(iderivative(@(x) tan(x), x0),  sec(x0)^2,       err);
TEST_EQUAL(iderivative(@(x) csc(x), x0), -csc(x0)*cot(x0), err);
TEST_EQUAL(iderivative(@(x) sec(x), x0),  sec(x0)*tan(x0), err);
TEST_EQUAL(iderivative(@(x) cot(x), x0), -csc(x0)^2,       err);



%% INVERSE TRIGONOMETRIC FUNCTIONS

% 0 < x0 < 1
x0 = 0.5;
TEST_EQUAL(iderivative(@(x) asin(x), x0),  1/sqrt(1-x0^2), err);
TEST_EQUAL(iderivative(@(x) acos(x), x0), -1/sqrt(1-x0^2), err);
TEST_EQUAL(iderivative(@(x) atan(x), x0),  1/(1+x0^2),     err);
TEST_EQUAL(iderivative(@(x) acot(x), x0), -1/(1+x0^2),     err);

% x0 > 1
x0 = 1.5;
TEST_EQUAL(iderivative(@(x) atan(x), x0),  1/(1+x0^2),          err);
TEST_EQUAL(iderivative(@(x) acsc(x), x0), -1/(x0*sqrt(x0^2-1)), err);
TEST_EQUAL(iderivative(@(x) asec(x), x0),  1/(x0*sqrt(x0^2-1)), err);
TEST_EQUAL(iderivative(@(x) acot(x), x0), -1/(1+x0^2),          err);

% -1 < x0 < 0
x0 = -0.5;
TEST_EQUAL(iderivative(@(x) asin(x), x0),  1/sqrt(1-x0^2), err);
TEST_EQUAL(iderivative(@(x) acos(x), x0), -1/sqrt(1-x0^2), err);
TEST_EQUAL(iderivative(@(x) atan(x), x0),  1/(1+x0^2),     err);
TEST_EQUAL(iderivative(@(x) acot(x), x0), -1/(1+x0^2),     err);

% x0 < -1
x0 = -1.5;
TEST_EQUAL(iderivative(@(x) atan(x), x0),  1/(1+x0^2), err);
TEST_EQUAL(iderivative(@(x) acot(x), x0), -1/(1+x0^2), err);



%% HYPERBOLIC FUNCTIONS

% positive argument
x0 = 1;
TEST_EQUAL(iderivative(@(x) sinh(x), x0),  cosh(x0),          err);
TEST_EQUAL(iderivative(@(x) cosh(x), x0),  sinh(x0),          err);
TEST_EQUAL(iderivative(@(x) tanh(x), x0),  sech(x0)^2,        err);
TEST_EQUAL(iderivative(@(x) csch(x), x0), -csch(x0)*coth(x0), err);
TEST_EQUAL(iderivative(@(x) sech(x), x0), -sech(x0)*tanh(x0), err);
TEST_EQUAL(iderivative(@(x) coth(x), x0), -csch(x0)^2,        err);

% negative argument
x0 = -1;
TEST_EQUAL(iderivative(@(x) sinh(x), x0),  cosh(x0),          err);
TEST_EQUAL(iderivative(@(x) cosh(x), x0),  sinh(x0),          err);
TEST_EQUAL(iderivative(@(x) tanh(x), x0),  sech(x0)^2,        err);
TEST_EQUAL(iderivative(@(x) csch(x), x0), -csch(x0)*coth(x0), err);
TEST_EQUAL(iderivative(@(x) sech(x), x0), -sech(x0)*tanh(x0), err);
TEST_EQUAL(iderivative(@(x) coth(x), x0), -csch(x0)^2,        err);



%% INVERSE HYPERBOLIC FUNCTIONS

% 0 < x0 < 1
x0 = 0.5;
TEST_EQUAL(iderivative(@(x) asinh(x), x0),  1/sqrt(1+x0^2),           err);
TEST_EQUAL(iderivative(@(x) atanh(x), x0),  1/(1-x0^2),               err);
TEST_EQUAL(iderivative(@(x) acsch(x), x0), -1/(abs(x0)*sqrt(x0^2+1)), err);
TEST_EQUAL(iderivative(@(x) asech(x), x0), -1/(x0*sqrt(1-x0^2)),      err);

% x0 > 1
x0 = 1.5;
TEST_EQUAL(iderivative(@(x) asinh(x), x0),  1/sqrt(1+x0^2),           err);
TEST_EQUAL(iderivative(@(x) acosh(x), x0),  1/sqrt(x0^2-1),           err);
TEST_EQUAL(iderivative(@(x) acsch(x), x0), -1/(abs(x0)*sqrt(x0^2+1)), err);
TEST_EQUAL(iderivative(@(x) acoth(x), x0),  1/(1-x0^2),               err);

% -1 < x0 < 0
x0 = -0.5;
TEST_EQUAL(iderivative(@(x) asinh(x), x0),  1/sqrt(1+x0^2),           err);
TEST_EQUAL(iderivative(@(x) atanh(x), x0),  1/(1-x0^2),               err);
TEST_EQUAL(iderivative(@(x) acsch(x), x0), -1/(abs(x0)*sqrt(x0^2+1)), err);

% x0 < -1
x0 = -1.5;
TEST_EQUAL(iderivative(@(x) asinh(x), x0),  1/sqrt(1+x0^2),           err);
TEST_EQUAL(iderivative(@(x) acsch(x), x0), -1/(abs(x0)*sqrt(x0^2+1)), err);
TEST_EQUAL(iderivative(@(x) acoth(x), x0),  1/(1-x0^2),               err);



%% PRINTS SUCCESS MESSAGE

fprintf("All tests passed.\n")