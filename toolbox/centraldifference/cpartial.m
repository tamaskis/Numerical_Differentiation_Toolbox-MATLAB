%==========================================================================
%
% cpartial  Partial derivative of a multivariate, scalar-valued function 
% using the central difference approximation.
%
%   pf = cpartial(f,x0,k)
%   pf = cpartial(f,x0,k,h)
%
% See also cderivative, cgradient, cdirectional, cjacobian, chessian.
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
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to ε¹ᐟ³)
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
%   --> This function requires 2 evaluations of f(x).
%
%==========================================================================
function pf = cpartial(f,x0,k,h)

    % defaults relative step size if not input
    if nargin == 3 || isempty(h)
        h = eps^(1/3);
    end

    % absolute step size
    dxk = h*(1+abs(x0(k)));

    % auxiliary variables
    x1 = x0;
    x2 = x0;
    x1(k) = x1(k)-dxk;
    x2(k) = x2(k)+dxk;
    
    % evaluates partial derivative with respect to xₖ
    pf = (f(x2)-f(x1))/(2*dxk);
    
end