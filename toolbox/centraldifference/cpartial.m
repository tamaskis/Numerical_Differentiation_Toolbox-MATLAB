%==========================================================================
%
% cpartial  Partial derivative of a multivariate, vector-valued function 
% using the central difference approximation.
%
%   pf = cpartial(f,x0,k)
%   pf = cpartial(f,x0,k,h)
%
% See also fpartial, ipartial.
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
%   f       - (1×1 function_handle) multivariate, vector-valued function, 
%             f(x) (f : ℝⁿ → ℝᵐ)
%   x0      - (n×1 double) evaluation point, x₀ ∈ ℝⁿ
%   k       - (1×1 double) element of x to differentiate with respect to
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to ε¹ᐟ³)
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
%
%==========================================================================
function pf = cpartial(f,x0,k,h)
    
    % defaults relative step size if not input
    if nargin == 3 || isempty(h)
        h = eps^(1/3);
    end
    
    % absolute step size
    dxk = h*(1+abs(x0(k)));
    
    % steps forward in kth direction
    x0(k) = x0(k)+dxk;
    f1 = f(x0);
    
    % steps backward in kth direction
    x0(k) = x0(k)-2*dxk;
    f2 = f(x0);
    
    % evaluates partial derivative with respect to xₖ
    pf = (f1-f2)/(2*dxk);
    
end