%==========================================================================
%
% fdirectional  Directional derivative of a multivariate, scalar-valued
% function using the forward difference approximation.
%
%   Dv = fdirectional(f,x0,v)
%   Dv = fdirectional(f,x0,v,h)
%
% See also cdirectional, idirectional.
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
%   f       - (1×1 function_handle) multivariate, scalar-valued function,
%             f(x) (f : ℝⁿ → ℝ)
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   v       - (n×1 double) vector defining direction of differentiation, 
%             v ∈ ℝⁿ
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to √ε)
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
%   • This function requires 2 evaluations of f(x).
%   • This implementation does NOT assume that v is a unit vector.
%
%==========================================================================
function Dv = fdirectional(f,x0,v,h)
    
    % defaults relative step size if not input
    if nargin == 3 || isempty(h)
        h = sqrt(eps);
    end
    
    % evaluates directional derivative
    Dv = (f(x0+h*v)-f(x0))/h;
    
end