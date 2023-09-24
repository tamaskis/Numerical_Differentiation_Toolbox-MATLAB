%==========================================================================
%
% fjacobian  Jacobian of a multivariate, vector-valued function using the 
% forward difference approximation.
%
%   J = fjacobian(f,x0)
%   J = fjacobian(f,x0,h)
%
% See also cjacobian, ijacobian.
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
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to √ε)
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian of f with respect to x, evaluated at 
%             x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires n+1 evaluations of f(x).
%
%==========================================================================
function J = fjacobian(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % evaluates f(x₀)
    f0 = f(x0);
    
    % determines size of Jacobian
    m = length(f0);
    n = length(x0);
    
    % preallocates matrix to store Jacobian
    J = zeros(m,n);
    
    % evaluates Jacobian
    for k = 1:n
        
        % absolute step size
        dxk = h*(1+abs(x0(k)));
        
        % steps in kth direction
        x0(k) = x0(k)+dxk;
        
        % partial derivative of f with respect to xₖ
        J(:,k) = (f(x0)-f0)/dxk;
        
        % resets x0
        x0(k) = x0(k)-dxk;
        
    end
    
end