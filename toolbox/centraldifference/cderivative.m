%==========================================================================
%
% cderivative  Derivative of a univariate, scalar or vector-valued function
% using the central difference approximation.
%
%   df = cderivative(f,x0)
%   df = cderivative(f,x0,h)
%
% See also cpartial, cgradient, cdirectional, cjacobian, chessian.
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
%   f       - (1×1 function_handle) univariate, scalar or vector-valued 
%             function, f(x) (f : ℝ → ℝ or f : ℝ → ℝᵐ)
%   x0      - (1×1 double) point at which to differentiate, x₀ ∈ ℝ
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   df      - (m×1 double) derivative of f evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires 2 evaluations of f(x).
%   --> If the function is scalar-valued, then m = 1.
%
%==========================================================================
function df = cderivative(f,x0,h)

    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = eps^(1/3);
    end

    % absolute step size
    dx = h*(1+abs(x0));
    
    % evaluates derivative
    df = (f(x0+dx)-f(x0-dx))/(2*dx);
    
end