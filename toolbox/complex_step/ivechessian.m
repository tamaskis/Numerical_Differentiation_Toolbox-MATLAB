%==========================================================================
%
% ivechessian  Vector Hessian of a multivariate, vector-valued function 
% using the complex-step and central difference approximations.
%
%   H = ivechessian(f,x0)
%   H = ivechessian(f,x0,hi,hc)
%
% See also cvechessian, fvechessian.
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
%   dx      - (OPTIONAL) (1×1 double) absolute step size for complex-step 
%             approximation (defaults to 10⁻²⁰⁰)
%   h       - (OPTIONAL) (1×1 double) relative step size for forward
%             difference approximation (defaults to ε¹ᐟ³)
%
% -------
% OUTPUT:
% -------
%   H       - (n×n×m double) vector Hessian of f with respect to x, 
%             evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   • This function requires mn(n+1)+1 evaluations of f(x).
%
%==========================================================================
function H = ivechessian(f,x0,dx,h)
    
    % defaults absolute step size for complex-step approx. if not input
    if nargin < 3 || isempty(dx)
        dx = 1e-200;
    end
    
    % defaults relative step size for forward diff. approx. if not input
    if nargin < 4 || isempty(h)
        h = eps^(1/3);
    end
    
    % determines size of vector Hessian
    m = length(f(x0));
    n = length(x0);
    
    % preallocates array to store vector Hessian
    H = zeros(n,n,m);
    
    % evaluates vector Hessian
    for k = 1:m
        
        % function for kth component of f(x)
        fk = @(x) helper(f,x,k);
        
        % evaluates kth Hessian
        H(:,:,k) = ihessian(fk,x0,dx,h);
        
    end
    
    % helper function
    function fk = helper(f,x,k)
        fx = f(x);
        fk = fx(k);
    end
    
end