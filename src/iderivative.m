%==========================================================================
%
% iderivative  Derivative of a univariate, scalar or vector-valued function
% using the complex-step approximation.
%
%   df = iderivative(f,x0)
%   df = iderivative(f,x0,h)
%
% See also ipartial, igradient, idirectional, ijacobian, ihessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-11
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_Using_the_Complex-Step_Approximation.pdf
%
% REFERENCES:
%   [1] Martins et. al, "The Complex-Step Derivative Approximation",
%       https://dl.acm.org/doi/pdf/10.1145/838250.838251
%   [2] Squire et. al, "Using Complex Variables to Estimate Derivatives of 
%       "Real Functions", https://epubs.siam.org/doi/pdf/10.1137/S003614459631241X
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) univariate, scalar or vector-valued 
%             function (f:R->R or f:R->Rm)
%   x0      - (1×1 double) point at which to differentiate
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   df      - (m×1 double) derivative of f(x) evaluated at x0
%
% -----
% NOTE:
% -----
%   --> If the function is scalar-valued, then m = 1.
%
%==========================================================================
function df = iderivative(f,x0,h)

    % sets the default step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % evaluates derivative
    df = imag(f(x0+h*1i)/h);
    
end