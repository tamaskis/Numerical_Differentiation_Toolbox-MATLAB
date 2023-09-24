%==========================================================================
%
% cjacobian  Jacobian of a multivariate, vector-valued function using the 
% central difference approximation.
%
%   J = cjacobian(f,x0)
%   J = cjacobian(f,x0,h)
%
% See also fjacobian, ijacobian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2023-01-08.
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
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to ε¹ᐟ³)
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
%   • This function requires 2n evaluations of f(x).
%
%==========================================================================
function J = cjacobian(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = eps^(1/3);
    end
    
    % absolute step size for first column of Jacobian
    dx1 = h*(1+abs(x0(1)));
    
    % steps forward in 1st direction
    x0(1) = x0(1)+dx1;
    f1 = f(x0);
    
    % steps backward in 1st direction
    x0(1) = x0(1)-2*dx1;
    f2 = f(x0);
    
    % partial derivative of f with respect to x₁ (1st column of Jacobian)
    J1 = (f1-f2)/(2*dx1);
    
    % resets x0
    x0(1) = x0(1)+dx1;
    
    % determines size of Jacobian
    m = length(J1);
    n = length(x0);
    
    % preallocates matrix to store Jacobian and stores first column
    J = zeros(m,n);
    J(:,1) = J1;
    
    % evaluates remaining columns of Jacobian
    for k = 2:n
        
        % absolute step size
        dxk = h*(1+abs(x0(k)));
        
        % steps forward in kth direction
        x0(k) = x0(k)+dxk;
        f1 = f(x0);
        
        % steps backward in kth direction
        x0(k) = x0(k)-2*dxk;
        f2 = f(x0);
        
        % partial derivative of f with respect to xₖ
        J(:,k) = (f1-f2)/(2*dxk);
        
        % resets x0
        x0(k) = x0(k)+dxk;
        
    end
    
end