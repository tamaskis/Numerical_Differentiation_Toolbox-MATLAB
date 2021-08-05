%==========================================================================
%
% idirderivative  Directional derivative of a multivariate, scalar-valued
% function using the complex-step approximation.
%
%   Dv = idirderivative(f,x,v)
%   Dv = idirderivative(f,x,v,h)
%
% See also iderivative, igradient, ijacobian, ihessian.
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
%   [3] https://en.wikipedia.org/wiki/Directional_derivative
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) multivariate, scalar-valued function 
%             (f:Rn->R)
%   x       - (n×1 double) point at which to evaluate the directional
%             derivative
%   v       - (n×1 double) vector defining direction of differentiation
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   Dv      - (1×1 double) directional derivative of f evaluated at x in
%             the direction of v
%
%==========================================================================
function Dv = idirderivative(f,x,v,h)
    
    % sets the default step size if not input
    if nargin == 3 || isempty(h)
        h = sqrt(eps);
    end
    
    % determines dimension of x
    n = length(x);
    
    % preallocate a vector to store the gradient
    g = zeros(n,1);
    
    % complex-step matrix
    dX = h*1i*eye(n);
    
    % evaluates gradient
    for j = 1:n
        g(j) = imag(f(x+dX(:,j)))/h;
    end
    
    % evaluates directional derivative
    Dv = dot(v,g);
    
end