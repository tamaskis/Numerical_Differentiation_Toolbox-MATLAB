%==========================================================================
%
% idirectional  Directional derivative of a multivariate, scalar-valued
% function using the complex-step approximation.
%
%   Dv = idirectional(f,x0,v)
%   Dv = idirectional(f,x0,v,h)
%
% See also cdirectional, fdirectional.
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
%   f       - (1×1 function_handle) multivariate, scalar-valued function,
%             f(x) (f : ℂⁿ → ℂ)
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   v       - (n×1 double) vector defining direction of differentiation, 
%             v ∈ ℝⁿ
%   dx      - (OPTIONAL) (1×1 double) absolute step size (defaults to 
%             10⁻²⁰⁰)
%
% -------
% OUTPUT:
% -------
%   Dv      - (1×1 double) directional derivative of f with respect to x in
%             the direction of v, evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires 1 evaluation of f(x).
%   • This implementation does NOT assume that v is a unit vector.
%
%==========================================================================
function Dv = idirectional(f,x0,v,dx)
    
    % defaults absolute step size if not input
    if nargin == 3 || isempty(dx)
        dx = 1e-200;
    end
    
    % evaluates directional derivative
    Dv = imag(f(x0+1i*dx*v))/dx;
    
end