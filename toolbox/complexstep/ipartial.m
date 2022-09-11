%==========================================================================
%
% ipartial  Partial derivative of a multivariate, vector-valued function 
% using the complex-step approximation.
%
%   pf = ipartial(f,x0,k)
%   pf = ipartial(f,x0,k,h)
%
% See also cpartial, fpartial.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-09-10
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
%             f(x) (f : ℝⁿ → ℝᵐ)
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   k       - (1×1 double) element of x to differentiate with respect to
%   h       - (OPTIONAL) (1×1 double) step size (defaults to 10⁻²⁰⁰)
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
%   --> This function requires 1 evaluations of f(x).
%   --> If the function is scalar-valued, then m = 1.
%
%==========================================================================
function pf = ipartial(f,x0,k,h)
    
    % defaults step size if not input
    if nargin == 3 || isempty(h)
        h = 1e-200;
    end
    
    % steps in kth direction
    x0(k) = x0(k)+1i*h;
    
    % evaluates partial derivative with respect to xₖ
    pf = imag(f(x0))/h;
    
end