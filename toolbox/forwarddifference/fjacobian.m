%==========================================================================
%
% fjacobian  Jacobian matrix of a multivariate, vector-valued function 
% using the forward difference approximation.
%
%   J = fjacobian(f,x0)
%   J = fjacobian(f,x0,h)
%
% See also fderivative, fpartial, fgradient, fdirectional, fhessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-11
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_using_Finite_Difference_and_Complex_Step_Approximations.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) multivariate, vector-valued function,
%             f(x) (f : ℝⁿ → ℝᵐ)
%   x0      - (n×1 double) point at which to evaluate the Jacobian matrix, 
%             x₀ ∈ ℝⁿ
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to √ε)
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian matrix of f evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires 2n+1 evaluations of f(x).
%
%==========================================================================
function J = fjacobian(f,x0,h)

    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % determines size of Jacobian
    m = length(f(x0));
    n = length(x0);
    
    % preallocates array to store Jacobian matrix
    J = zeros(m,n);
    
    % matrix storing standard basis vectors
    e = eye(n);
    
    % evaluates Jacobian matrix
    for j = 1:n

        % absolute step size
        dxk = h*(1+abs(x0(k)));
        
        % vector of partial derivatives of f with respect to xₖ
        J(:,k) = (f(x0+e(:,k)*dxk)-f(x0))/dxk;

    end
    
end