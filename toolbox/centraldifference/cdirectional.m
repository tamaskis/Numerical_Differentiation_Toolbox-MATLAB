%==========================================================================
%
% cdirectional  Directional derivative of a multivariate, scalar-valued
% function using the central difference approximation.
%
%   Dv = cdirectional(f,x0,v)
%   Dv = cdirectional(f,x0,v,h)
%
% See also cderivative, cpartial, cgradient, cjacobian, chessian.
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
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   v       - (n×1 double) vector defining direction of differentiation, 
%             v ∈ ℝⁿ
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   Dv      - (1×1 double) directional derivative of f evaluated at x = x₀
%             in the direction of v
%
% -----
% NOTE:
% -----
%   --> This function requires 2n evaluations of f(x).
%
%==========================================================================
function Dv = cdirectional(f,x0,v,h)
    
    % defaults relative step size if not input
    if nargin == 3 || isempty(h)
        h = eps^(1/3);
    end
    
    % determines dimension of x
    n = length(x0);
    
    % preallocates vector to store gradient
    g = zeros(n,1);
    
    % matrix storing standard basis vectors
    e = eye(n);
    
    % evaluates gradient
    for k = 1:n
        
        % absolute step size
        dxk = h*(1+abs(x0(k)));
        
        % auxiliary variable
        xk = e(:,k)*dxk;
        
        % partial derivative of f with respect to xₖ
        g(k) = (f(x0+xk)-f(x0-xk))/(2*dxk);
        
    end
    
    % evaluates directional derivative
    Dv = g.'*v;
    
end