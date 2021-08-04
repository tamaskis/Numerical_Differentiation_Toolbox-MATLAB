%==========================================================================
%
% ijacobian  Jacobian matrix of a vector-valued function using the 
% complex-step approximation.
%
%   J = ijacobian(f,x)
%
% See also iderivative, igradient, ihessian.
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
%   x       - (n×1 double) point at which to evaluate the Jacobian matrix
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian matrix of f evaluated at x
%
%==========================================================================
function J = ijacobian(f,x)

    % step size
    h = 1e-20;
    
    % determines size of Jacobian
    m = length(f(x));
    n = length(x);
    
    % preallocates array to store Jacobian
    J = zeros(m,n);
    
    % complex step array
    dX = h*1i*eye(n);
    
    % evaluates Jacobian
    for j = 1:n
        J(:,j) = imag(f(x+dX(:,j))/h);
    end
    
end