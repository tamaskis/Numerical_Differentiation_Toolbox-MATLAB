%==========================================================================
%
% igradient  Gradient of a multivariate, scalar-valued function using the 
% complex-step approximation.
%
%   g = igradient(f,x0)
%   g = igradient(f,x0,h)
%
% See also cgradient, fgradient.
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
%   dx      - (OPTIONAL) (1×1 double) absolute step size (defaults to 
%             10⁻²⁰⁰)
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
%   • This function requires n evaluations of f(x).
%
%==========================================================================
function g = igradient(f,x0,dx)
    
    % defaults absolute step size if not input
    if nargin == 2 || isempty(dx)
        dx = 1e-200;
    end
    
    % determines dimension of x
    n = length(x0);
    
    % preallocates vector to store gradient
    g = zeros(n,1);
    
    % evaluates gradient
    for k = 1:n
        
        % steps in kth direction
        x0(k) = x0(k)+1i*dx;
        
        % partial derivative of f with respect to xₖ
        g(k) = imag(f(x0))/dx;
        
        % resets x0
        x0(k) = x0(k)-1i*dx;
        
    end
    
end