%==========================================================================
%
% fpartial  Partial derivative of a multivariate, vector-valued function 
% using the forward difference approximation.
%
%   pf = fpartial(f,x0,k)
%   pf = fpartial(f,x0,k,h)
%
% See also fderivative, fgradient, fdirectional, fjacobian, fhessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-12
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
%   f       - (1×1 function_handle) multivariate, vector-valued function, 
%             f(x) (f : ℝⁿ → ℝᵐ)
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   k       - (1×1 double) element of x to differentiate with respect to
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to √ε)
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
%   --> This function requires 2 evaluations of f(x).
%   --> If the function is scalar-valued, then m = 1.
%
%==========================================================================
function pf = fpartial(f,x0,k,h)
    
    % defaults relative step size if not input
    if nargin == 3 || isempty(h)
        h = sqrt(eps);
    end

    % evaluates f(x₀)
    f0 = f(x0);
    
    % absolute step size
    dxk = h*(1+abs(x0(k)));
    
    % steps in kth direction
    x0(k) = x0(k)+dxk;
    
    % evaluates partial derivative with respect to xₖ
    pf = (f(x0)-f0)/dxk;
    
end