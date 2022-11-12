%==========================================================================
%
% iderivative  Derivative of a univariate, vector-valued function using the 
% complex-step approximation.
%
%   df = iderivative(f,x0)
%   df = iderivative(f,x0,h)
%
% See also cderivative, fderivative.
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
%   h       - (OPTIONAL) (1×1 double) step size (defaults to 10⁻²⁰⁰)
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
%   --> This function requires 1 evaluation of f(x).
%
%==========================================================================
function df = iderivative(f,x0,h)
    
    % defaults step size if not input
    if nargin == 2 || isempty(h)
        h = 1e-200;
    end
    
    % evaluates derivative
    df = imag(f(x0+1i*h))/h;
    
end