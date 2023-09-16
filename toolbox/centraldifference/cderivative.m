%==========================================================================
%
% cderivative  Derivative of a univariate, vector-valued function using the 
% central difference approximation.
%
%   df = cderivative(f,x0)
%   df = cderivative(f,x0,h)
%
% See also fderivative, iderivative.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-12
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
%   df      - (m×1 double) derivative of f with respect to x, evaluated at 
%             x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires 2 evaluations of f(x).
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