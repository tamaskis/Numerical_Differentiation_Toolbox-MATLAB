%==========================================================================
%
% ijacobian  Approximates the gradient of a scalar-valued function using
% the complex-step approximation of a derivative.
%
%   grad = igradient(f,x)
%
% See also iderivative, ijacobian, ihessian.
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
%   f       - (function_handle) vector-valued function (f:Rn-->R)
%   x       - (n×1 double) point at which to evaluate the gradient
%
% -------
% OUTPUT:
% -------
%   grad    - (n×1 double) gradient of f evaluated at x
%
%==========================================================================
function grad = igradient(f,x)
    
    % step size
    h = 1e-20;
    
    % determines dimension of x
    n = length(x);
    
    % preallocate a vector to store the gradient
    grad = zeros(n,1);
    
    % complex-step matrix
    dX = h*1i*eye(n);
    
    % evaluates gradient
    for j = 1:n
        grad(j) = imag(f(x+dX(:,j)))/h;
    end
    
end