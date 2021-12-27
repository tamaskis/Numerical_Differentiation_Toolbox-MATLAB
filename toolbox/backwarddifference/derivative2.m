%==========================================================================
%
% derivative2  Derivative of a univariate, scalar or vector-valued function
% using the backward difference approximation (given two points).
%
%   df = derivative2(f,xa,xb)
%
% See also partial2, gradient2, directional2, jacobian2.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-26
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_Using_the_Complex_Step_Approximation.pdf
%
% REFERENCES:
%   [1] https://en.wikipedia.org/wiki/Finite_difference_method
%   [2] http://www.ohiouniversityfaculty.com/youngt/IntNumMeth/lecture27.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, scalar or vector-valued 
%             function (f:R->R or f:R->Rm)
%   xa      - (n×1 double) auxiliary point
%   xb      - (1×1 double) point at which to differentiate
%
% -------
% OUTPUT:
% -------
%   df      - (m×1 double) derivative of f(x) evaluated at xb
%
% -----
% NOTE:
% -----
%   --> If the function is scalar-valued, then m = 1.
%   --> This function requires 2 evaluations of f(x).
%
%==========================================================================
function df = derivative2(f,xa,xb)
    df = (f(xb)-f(xa))/(xb-xa);
end