%==========================================================================
%
% iderivative2  Second derivative of a univariate, vector-valued function 
% using the complex-step approximation.
%
%   df = iderivative2(f,x0)
%   df = iderivative2(f,x0,h)
%
% See also cderivative2, fderivative2.
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
%             f(x) (f : ℂ → ℂᵐ)
%   x0      - (1×1 double) evaluation point, x₀ ∈ ℝ
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to ε¹ᐟ⁴)
%
% -------
% OUTPUT:
% -------
%   df      - (m×1 double) second derivative of f with respect to x, 
%             evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires 2 evaluations of f(x).
%
%==========================================================================
function df2 = iderivative2(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = eps^(1/4);
    end
    
    % absolute step size
    dx = h*(1+abs(x0));
    
    % evaluates second derivative
    df2 = 2*(f(x0)-real(f(x0+1i*h)))/(dx^2);
    
end