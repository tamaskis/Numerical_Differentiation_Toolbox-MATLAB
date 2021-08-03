%==========================================================================
%
% iderivative  Approximates the derivative of a vector-valued function
% using the complex step approximation of a derivative.
%
%   df = ijacobian(f,x)
%
% See also igradient, ijacobian, ihessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-03
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] 
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) vector-valued function (f:Rn-->Rm)
%   x       - (n×1 double) independent variable at which to evaluate the
%             derivative
%
% -------
% OUTPUT:
% -------
%   J       - (n×1 double) derivative of f evaluated at x
%
%==========================================================================
function df = iderivative(f,x)
    h = 1e-20;
    df = imag(f(x+h*1i)/h);
end