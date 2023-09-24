%==========================================================================
%
% ihessian  Hessian of a multivariate, scalar-valued function using the 
% complex-step and central difference approximations.
%
%   H = ihessian(f,x0)
%   H = ihessian(f,x0,hi,hc)
%
% See also chessian, fhessian.
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
%   dx      - (OPTIONAL) (1×1 double) absolute step size for complex-step 
%             approximation (defaults to 10⁻²⁰⁰)
%   h       - (OPTIONAL) (1×1 double) relative step size for central
%             difference approximation (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   H       - (n×n double) Hessian of f with respect to x, evaluated at
%             x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires n(n+1) evaluations of f(x).
%
%==========================================================================
function H = ihessian(f,x0,dx,h)
    
    % defaults absolute step size for complex-step approx. if not input
    if nargin < 3 || isempty(dx)
        dx = 1e-200;
    end
    
    % defaults relative step size for central diff. approx. if not input
    if nargin < 4 || isempty(h)
        h = eps^(1/3);
    end
    
    % determines dimension of x0
    n = length(x0);
    
    % preallocates matrix to store Hessian
    H = zeros(n,n);
    
    % preallocates array to store absolute step sizes
    a = zeros(n,1);
    
    % populates "a"
    for k = 1:n
        a(k) = h*(1+abs(x0(k)));
    end
    
    % loops through columns
    for k = 1:n
        
        % imaginary step forward in kth direction
        x0(k) = x0(k)+1i*dx;
        
        % loops through rows
        for j = k:n
            
            % real step forward in jth direction
            x0(j) = x0(j)+a(j);
            b = f(x0);
            
            % real step backward in jth direction
            x0(j) = x0(j)-2*a(j);
            c = f(x0);
            
            % resets x0
            x0(j) = x0(j)+a(j);
            
            % evaluates (j,k)th element of the Hessian
            H(j,k) = imag(b-c)/(2*dx*a(j));
            
            % symmetry
            H(k,j) = H(j,k);
            
        end
        
        % resets x0
        x0(k) = x0(k)-1i*dx;
        
    end
    
end