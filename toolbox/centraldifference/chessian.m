%==========================================================================
%
% chessian  Hessian of a multivariate, scalar-valued function using the 
% central difference approximation.
%
%   H = chessian(f,x0)
%   H = chessian(f,x0,h)
%
% See also fhessian, ihessian.
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
%   h       - (1×1 double) (OPTIONAL) relative step size (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   H       - (n×1 double) Hessian of f with respect to x, evaluated at
%             x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires 2n(n+1) evaluations of f(x).
%
%==========================================================================
function H = chessian(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
        h = eps^(1/3);
    end
    
    % determines dimension of x0
    n = length(x0);
    
    % preallocates matrix to store Hessian
    H = zeros(n);
    
    % preallocates arrays to store absolute step sizes
    a = zeros(n,1);
    
    % populates "a"
    for k = 1:n
        a(k) = h*(1+abs(x0(k)));
    end
    
    % evaluates Hessian, looping through the upper triangular elements
    for k = 1:n
        for j = k:n
            
            % steps forward in jth and kth directions
            x0(j) = x0(j)+a(j);
            x0(k) = x0(k)+a(k);
            b = f(x0);
            x0(j) = x0(j)-a(j);
            x0(k) = x0(k)-a(k);
            
            % steps forward in jth direction and backward in kth direction
            x0(j) = x0(j)+a(j);
            x0(k) = x0(k)-a(k);
            c = f(x0);
            x0(j) = x0(j)-a(j);
            x0(k) = x0(k)+a(k);
            
            % steps backward in jth direction and forward in kth direction
            x0(j) = x0(j)-a(j);
            x0(k) = x0(k)+a(k);
            d = f(x0);
            x0(j) = x0(j)+a(j);
            x0(k) = x0(k)-a(k);
            
            % steps backward in jth and kth directions
            x0(j) = x0(j)-a(j);
            x0(k) = x0(k)-a(k);
            e = f(x0);
            x0(j) = x0(j)+a(j);
            x0(k) = x0(k)+a(k);
            
            % evaluates (j,k)th element of the Hessian
            H(j,k) = (b-c-d+e)/(4*a(j)*a(k));
            
            % symmetry
            H(k,j) = H(j,k);
            
        end
    end
    
end