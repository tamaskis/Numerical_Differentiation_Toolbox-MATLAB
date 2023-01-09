%==========================================================================
%
% ijacobian  Jacobian of a multivariate, vector-valued function using the 
% complex-step approximation.
%
%   J = ijacobian(f,x0)
%   J = ijacobian(f,x0,h)
%
% See also cjacobian, fjacobian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2023-01-08
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
%   h       - (OPTIONAL) (1×1 double) step size (defaults to 10⁻²⁰⁰)
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
%   --> This function requires n evaluations of f(x).
%
%==========================================================================
function J = ijacobian(f,x0,h)
    
    % defaults step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % steps in 1st direction
    x0(1) = x0(1)+1i*h;
    
    % partial derivative of f with respect to x₁ (1st column of Jacobian)
    J1 = imag(f(x0))/h;
    
    % resets x0
    x0(1) = x0(1)-1i*h;
    
    % determines size of Jacobian
    m = length(J1);
    n = length(x0);
    
    % preallocates matrix to store Jacobian and stores first column
    J = zeros(m,n);
    J(:,1) = J1;
    
    % evaluates remaining columns of Jacobian
    for k = 2:n
        
        % steps in kth direction
        x0(k) = x0(k)+1i*h;
        
        % partial derivative of f with respect to xₖ
        J(:,k) = imag(f(x0))/h;
        
        % resets x0
        x0(k) = x0(k)-1i*h;
        
    end
    
end