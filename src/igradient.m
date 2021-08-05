%==========================================================================
%
% igradient  Gradient of a multivariate, scalar-valued function using the 
% complex-step approximation.
%
%   g = igradient(f,x)
%   g = igradient(f,x,h)
%
% See also iderivative, idirderivative, ijacobian, ihessian.
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
%   [3] https://en.wikipedia.org/wiki/Gradient
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) multivariate, scalar-valued function 
%             (f:Rn->R)
%   x       - (n×1 double) point at which to evaluate the gradient
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   g       - (n×1 double) gradient of f evaluated at x
%
%==========================================================================
function g = igradient(f,x,h)
    
    % sets the default step size if not input
    if nargin == 2 || isempty(h)
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
    
end