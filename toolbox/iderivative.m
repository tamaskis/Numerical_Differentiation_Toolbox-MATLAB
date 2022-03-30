%==========================================================================
%
% iderivative  Derivative of a univariate, scalar or vector-valued function
% using the complex-step approximation.
%
%   df = iderivative(f,x0)
%   df = iderivative(f,x0,h)
%
% See also ipartial, igradient, idirectional, ijacobian, ihessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-03-09
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_using_the_Complex_Step_Approximation.pdf
%
% REFERENCES:
%   [1] Martins et. al, "The Complex-Step Derivative Approximation",
%       https://dl.acm.org/doi/pdf/10.1145/838250.838251
%   [2] Squire et. al, "Using Complex Variables to Estimate Derivatives of 
%       "Real Functions", https://epubs.siam.org/doi/pdf/10.1137/S003614459631241X
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) univariate, scalar or vector-valued 
%             function, f(x) (f:ℝ→ℝ or f:ℝ→ℝᵐ)
%   x0      - (1×1 double) point at which to differentiate, x₀ ∈ ℝ
%   h       - (1×1 double) (OPTIONAL) step size (defaults to 10⁻²⁰⁰)
%
% -------
% OUTPUT:
% -------
%   df      - (m×1 double) derivative of f evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> If the function is scalar-valued, then m = 1.
%   --> This function requires 1 evaluation of f(x).
%
%==========================================================================
function df = iderivative(f,x0,h)

    % sets the default step size if not input
    if nargin == 2 || isempty(h)
        h = 1e-200;
    end
    
    % evaluates derivative
    df = imag(f(x0+h*1i))/h;
    
end