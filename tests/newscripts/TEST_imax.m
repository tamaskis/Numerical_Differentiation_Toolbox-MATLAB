%% TEST_imax.m
% Numerical Differentiation Toolbox
%
% Unit testing of the imax function.
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



%% NOTE

% See https://www.wolframalpha.com/input?i=max%28x%2Cx%5E3%29 for a plot of
% f(x) and the definition of its derivative, f'(x).



%% UNIT TESTS

% function
f = @(x) imax(x,x^3);

% units tests
TEST_EQUAL(iderivative(f,-1.5),dfdx(-1.5));
TEST_EQUAL(iderivative(f,-0.5),dfdx(-0.5));
TEST_EQUAL(iderivative(f,0.5),dfdx(0.5));
TEST_EQUAL(iderivative(f,1.5),dfdx(1.5),n);



%% PRINTS SUCCESS MESSAGE

fprintf("All tests in TEST_imax.m passed.\n")



%% AUXILIARY FUNCTION

% f'(x)
function df = dfdx(x)
    if ((0 < x) && (x < 1)) || (x < -1)
        df = 1;
    elseif ((-1 < x) && (x < 0)) || (x > 1)
        df = 3*x^2;
    else
        df = NaN;
    end
end