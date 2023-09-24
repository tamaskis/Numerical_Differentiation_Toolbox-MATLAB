%==========================================================================
%
% fderivative2  Second derivative of a univariate, vector-valued function 
% using the forward difference approximation.
%
%   df = fderivative(f,x0)
%   df = fderivative(f,x0,h)
%
% See also cderivative2, iderivative2.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2023-05-27
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/files/Numerical_Differentiation.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, vector-valued function,
%             f(x) (f : ℝ → ℝᵐ)
%   x0      - (1×1 double) evaluation point, x₀ ∈ ℝ
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   df2     - (m×1 double) second derivative of f with respect to x, 
%             evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires 3 evaluations of f(x).
%
%==========================================================================
function df = fderivative2(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = eps^(1/3);
    end
    
    % absolute step size
    dx = h*(1+abs(x0));
    
    % evaluates second derivative
    df = (f(x0+2*dx)-2*f(x0+dx)+f(x0))/(dx^2);
    
end