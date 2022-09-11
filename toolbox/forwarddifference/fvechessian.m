%==========================================================================
%
% fvechessian  Vector Hessian of a multivariate, vector-valued function 
% using the forward difference approximation.
%
%   H = fvechessian(f,x0)
%   H = fvechessian(f,x0,h)
%
% See also cvechessian, ivechessian.
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
%   h       - (OPTIONAL) (1×1 double) relative step size (defaults to ε¹ᐟ³)
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
%   --> This function requires m[(n(n+1)/2)+1]+1 evaluations of f(x).
%
%==========================================================================
function H = fvechessian(f,x0,h)
    
    % defaults relative step size if not input
    if nargin == 2 || isempty(h)
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
        H(:,:,k) = fhessian(fk,x0,h);
        
    end
    
    % helper function
    function fk = helper(f,x,k)
        fx = f(x);
        fk = fx(k);
    end
    
end