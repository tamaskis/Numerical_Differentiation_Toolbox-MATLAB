%==========================================================================
%
% iderivative  Derivative of a univariate, scalar or vector-valued function
% using the complex-step approximation.
%
%   df = iderivative(f,x)
%   df = iderivative(f,x,h)
%
% See also igradient, idirderivative, ijacobian, ihessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-04
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
%   f       - (function_handle) univariate, scalar or vector-valued 
%             function (f:R->R or f:R->Rm)
%   x       - (1×1 double) point at which to differentiate
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   df    	- (m×1 double) derivative of f evaluated at x
%
% -----
% NOTE:
% -----
%   --> If the function is univariate, then m = 1.
%
%==========================================================================
function df = iderivative(f,x,h)

    % sets the default step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % evaluates derivative
    df = imag(f(x+h*1i)/h);
    
end