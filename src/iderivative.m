%==========================================================================
%
% iderivative  Derivative of a univariate function using the complex-step
% approximation.
%
%   df = iderivative(f,x)
%
% See also igradient, ijacobian, ihessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-03
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] Squire et. al, "Using Complex Variables to Estimate Derivatives of 
%       "Real Functions", https://epubs.siam.org/doi/pdf/10.1137/S003614459631241X
%   [2] Martins et. al, "The Complex-Step Derivative Approximation",
%       https://dl.acm.org/doi/pdf/10.1145/838250.838251
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) univariate, scalar-valued function 
%             (f:R-->R)
%   x       - (1×1 double) point at which to differentiate
%
% -------
% OUTPUT:
% -------
%   df    	- (1×1 double) derivative of f evaluated at x
%
%==========================================================================
function df = iderivative(f,x)
    h = 1e-10;
    df = imag(f(x+h*1i)/h);
end