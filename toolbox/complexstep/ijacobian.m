%==========================================================================
%
% ijacobian  Jacobian matrix of a multivariate, vector-valued function 
% using the complex-step approximation.
%
%   J = ijacobian(f,x0)
%   J = ijacobian(f,x0,h)
%
% See also iderivative, ipartial, igradient, idirectional, ihessian.
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
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   h       - (1×1 double) (OPTIONAL) step size (defaults to 10⁻²⁰⁰)
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian matrix of f evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires n+1 evaluations of f(x).
%
%==========================================================================
function J = ijacobian(f,x0,h)
    
    % defaults step size if not input
    if nargin == 2 || isempty(h)
        h = 1e-200;
    end
    
    % determines size of Jacobian
    m = length(f(x0));
    n = length(x0);
    
    % preallocates array to store Jacobian matrix
    J = zeros(m,n);
    
    % complex-step matrix
    X = h*1i*eye(n);
    
    % evaluates Jacobian matrix
    for j = 1:n
        J(:,j) = imag(f(x0+X(:,j)))/h;
    end
    
end