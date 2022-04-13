%==========================================================================
%
% idirectional  Directional derivative of a multivariate, scalar-valued
% function using the complex-step approximation.
%
%   Dv = idirectional(f,x0,v)
%   Dv = idirectional(f,x0,v,h)
%
% See also iderivative, ipartial, igradient, ijacobian, ihessian.
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
%   f       - (1×1 function_handle) multivariate, scalar-valued function,
%             f(x) (f : ℝⁿ → ℝ)
%   x0      - (n×1 double) point at which to evaluate the directional
%             derivative, x₀ ∈ ℝⁿ
%   v       - (n×1 double) vector defining direction of differentiation, 
%             v ∈ ℝⁿ
%   h       - (1×1 double) (OPTIONAL) step size (defaults to 10⁻²⁰⁰)
%
% -------
% OUTPUT:
% -------
%   Dv      - (1×1 double) directional derivative of f evaluated at x = x₀
%             in the direction of v
%
% -----
% NOTE:
% -----
%   --> This function requires n evaluations of f(x).
%
%==========================================================================
function Dv = idirectional(f,x0,v,h)
    
    % defaults step size if not input
    if nargin == 3 || isempty(h)
        h = 1e-200;
    end
    
    % determines dimension of x
    n = length(x0);
    
    % preallocate a vector to store the gradient
    g = zeros(n,1);
    
    % complex-step matrix
    dX = h*1i*eye(n);
    
    % evaluates gradient
    for j = 1:n
        g(j) = imag(f(x0+dX(:,j)))/h;
    end
    
    % evaluates directional derivative
    Dv = g.'*v;
    
end