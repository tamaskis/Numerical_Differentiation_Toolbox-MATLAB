%==========================================================================
%
% iderivative  Derivative of a univariate, vector-valued function using the 
% complex-step approximation.
%
%   df = iderivative(f,x0)
%   df = iderivative(f,x0,dx)
%
% See also cderivative, fderivative.
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
%   dx      - (OPTIONAL) (1×1 double) absolute step size (defaults to 
%             10⁻²⁰⁰)
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
%   • This function requires 1 evaluation of f(x).
%
%==========================================================================
function df = iderivative(f,x0,dx)
    
    % defaults absolute step size if not input
    if nargin == 2 || isempty(dx)
        dx = 1e-200;
    end
    
    % evaluates derivative
    df = imag(f(x0+1i*dx))/dx;
    
end