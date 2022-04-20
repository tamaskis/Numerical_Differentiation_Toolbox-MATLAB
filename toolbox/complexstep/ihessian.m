%==========================================================================
%
% ihessian  Hessian of a multivariate, scalar-valued function using the 
% complex-step approximation.
%
%   H = ihessian(f,x0)
%   H = ihessian(f,x0,hi,hc)
%
% See also chessian, fhessian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-20
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
%   hi      - (1×1 double) (OPTIONAL) relative step size for complex-step
%             approximation (defaults to 10⁻²⁰⁰)
%   hc      - (1×1 double) (OPTIONAL) relative step size for forward
%             difference approximation (defaults to ε¹ᐟ³)
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
%   --> This function requires n(n+1) evaluations of f(x).
%
%==========================================================================
function H = ihessian(f,x0,hi,hc)
    
    % defaults relative step size for complex-step approx. if not input
    if nargin < 3 || isempty(hi)
        hi = 1e-200;
    end
    
    % defaults relative step size for forward diff. approx. if not input
    if nargin < 4 || isempty(hc)
        hc = eps^(1/3);
    end
    
    % determines dimension of x0
    n = length(x0);
    
    % preallocates matrix to store Hessian
    H = zeros(n);
    
    % preallocates arrays to store absolute step sizes
    a = zeros(n,1);
    
    % populates "a"
    for k = 1:n
        a(k) = hc*(1+abs(x0(k)));
    end
    
    % loops through rows
    for k = 1:n
        
        % imaginary step forward in kth direction
        x0(k) = x0(k)+1i*hi;
        
        % loops through columns
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
            H(j,k) = imag(b-c)/(2*hi*a(j));
            
            % symmetry
            H(k,j) = H(j,k);
            
        end
        
        % resets x0
        x0(k) = x0(k)-1i*hi;
        
    end
    
end