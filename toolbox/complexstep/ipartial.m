%==========================================================================
%
% ipartial  Partial derivative of a multivariate, scalar-valued function 
% using the complex-step approximation.
%
%   pf = ipartial(f,x0,k)
%   pf = ipartial(f,x0,k,h)
%
% See also iderivative, igradient, idirectional, ijacobian, ihessian.
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
%   x0      - (n×1 double) point at which to differentiate, x₀ ∈ ℝⁿ
%   k       - (1×1 double) index of element of x to differentiate with 
%             respect to
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to 
%             10⁻²⁰⁰)
%
% -------
% OUTPUT:
% -------
%   pf      - (m×1 double) partial derivative of f with respect to xₖ, 
%             evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires 1 evaluation of f(x).
%
%==========================================================================
function pf = ipartial(f,x0,k,h)

    % defaults relative step size if not input
    if nargin == 3 || isempty(h)
        h = 1e-200;
    end
    
    % redefine x0
    x0(k) = x0(k)+h*1i;
    
    % evaluates partial derivative with respect to xₖ
    pf = imag(f(x0))/h;
    
end