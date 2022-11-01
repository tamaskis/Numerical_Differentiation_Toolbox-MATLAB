%==========================================================================
%
% cgradient  Gradient of a multivariate, scalar-valued function using the 
% central difference approximation.
%
%   g = cgradient(f,x0)
%   g = cgradient(f,x0,h)
%
% See also fgradient, igradient.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-01
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
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   g       - (n×1 double) gradient of f with respect to x, evaluated at 
%             x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires 2n evaluations of f(x).
%
%==========================================================================
function g = cgradient(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
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
        
        % partial derivative of f with respect to xₖ
        g(k) = (f1-f2)/(2*dxk);
        
        % resets x0
        x0(k) = x0(k)+dxk;
        
    end
    
end