%==========================================================================
%
% ipartial Partial derivative of a multivariate, scalar or vector-valued 
% function using the complex-step approximation.
%
%   pf = ipartial(f,x0,j)
%   pf = ipartial(f,x0,j,h)
%
% See also iderivative, igradient, idirectional, ijacobian, ihessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-11
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical%20Differentiation%20Using%20the%20Complex-Step%20Approximation.pdf
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
%   f       - (function_handle) multivariate, scalar or vector-valued 
%             function (f:Rn->R or f:Rn->Rm)
%   x0      - (n×1 double) point at which to differentiate
%   j       - (1×1 double) index of element of x to differentiate with 
%             respect to
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   pf    	- (m×1 double) partial derivative of f with respect to xj, 
%             evaluated at x0
%
% -----
% NOTE:
% -----
%   --> If the function is scalar-valued, then m = 1.
%
%==========================================================================
function pf = ipartial(f,x0,j,h)

    % sets the default step size if not input
    if nargin == 3 || isempty(h)
        h = sqrt(eps);
    end
    
    % redefine x0
    x0(j) = x0(j)+h*1i;
    
    % evaluates partial derivative with respect to xj
    pf = imag(f(x0)/h);
    
end