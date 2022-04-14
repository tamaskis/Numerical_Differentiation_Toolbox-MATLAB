%==========================================================================
%
% fgradient  Gradient of a multivariate, scalar-valued function using the 
% forward difference approximation.
%
%   g = fgradient(f,x0)
%   g = fgradient(f,x0,h)
%
% See also cgradient, igradient.
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
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to √ε)
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
%   --> This function requires n+1 evaluations of f(x).
%
%==========================================================================
function g = fgradient(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % determines dimension of x
    n = length(x0);
    
    % preallocates vector to store gradient
    g = zeros(n,1);
    
    % evaluates f(x₀)
    f0 = f(x0);
    
    % evaluates gradient
    for k = 1:n
        
        % absolute step size
        dxk = h*(1+abs(x0(k)));

        % steps in kth direction
        x0(k) = x0(k)+dxk;
        
        % evaluates partial derivative with respect to xₖ
        g(k) = (f(x0)-f0)/dxk;

        % resets x0
        x0(k) = x0(k)-dxk;
        
    end
    
end