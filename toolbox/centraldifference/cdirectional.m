%==========================================================================
%
% cdirectional  Directional derivative of a multivariate, scalar-valued
% function using the central difference approximation.
%
%   Dv = cdirectional(f,x0,v)
%   Dv = cdirectional(f,x0,v,h)
%
% See also fdirectional, idirectional.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-14
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
%   Dv      - (1×1 double) directional derivative of f with respect to x in
%             the direction of v, evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires 2n evaluations of f(x).
%   --> This implementation does NOT assume that v is a unit vector.
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
    
    % evaluates gradient
    for k = 1:n
        
        % absolute step size
        dxk = h*(1+abs(x0(k)));
        
        % steps forward in kth direction
        x0(k) = x0(k)+dxk;
        f1 = f(x0);
        
        % steps backward in kth direction
        x0(k) = x0(k)-2*dxk;
        f2 = f(x0);
        
        % evaluates partial derivative with respect to xₖ
        g(k) = (f1-f2)/(2*dxk);
        
        % resets x0
        x0(k) = x0(k)+dxk;
        
    end
    
    % evaluates directional derivative
    Dv = g.'*v;
    
end