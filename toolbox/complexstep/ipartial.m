%==========================================================================
%
% ipartial  Partial derivative of a multivariate, vector-valued function 
% using the complex-step approximation.
%
%   pf = ipartial(f,x0,k)
%   pf = ipartial(f,x0,k,dx)
%
% See also cpartial, fpartial.
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
%   f       - (1×1 function_handle) multivariate, vector-valued function, 
%             f(x) (f : ℂⁿ → ℂᵐ)
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   k       - (1×1 double) element of x to differentiate with respect to
%   dx      - (OPTIONAL) (1×1 double) absolute step size (defaults to 
%             10⁻²⁰⁰)
%
% -------
% OUTPUT:
% -------
%   pf      - (m×1 double) partial derivative of f with respect to xₖ, 
%             evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires 1 evaluation of f(x).
%
%==========================================================================
function pf = ipartial(f,x0,k,dx)
    
    % defaults absolute step size if not input
    if nargin == 3 || isempty(dx)
        dx = 1e-200;
    end
    
    % steps in kth direction
    x0(k) = x0(k)+1i*dx;
    
    % evaluates partial derivative with respect to xₖ
    pf = imag(f(x0))/dx;
    
end