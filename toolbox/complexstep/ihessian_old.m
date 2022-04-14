%==========================================================================
%
% ihessian  Hessian matrix of a multivariate, scalar-valued function using 
% the complex-step and central difference approximations.
%
%   H = ihessian(f,x0)
%   H = ihessian(f,x0,h)
%
% See also iderivative, ipartial, igradient, idirectional, ijacobian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-04-11
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
%   h       - (1×1 double) (OPTIONAL) step size (defaults to √ɛ)
%
% -------
% OUTPUT:
% -------
%   H       - (n×1 double) Hessian matrix of f evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires n(n+1) evaluations of f(x).
%
%==========================================================================
function H = ihessian_old(f,x0,h)
    
    % defaults step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
    end
    
    % determines dimension of x0
    n = length(x0);
    
    % preallocates array to store Hessian matrix
    H = zeros(n);
    
    % complex-step and real-step matrices
    X = h*1i*eye(n);
    U = h*eye(n);
    
    % loops over each independent variable
    for k = 1:n
        
        % reference point with complex increment in kth independent
        % variable
        xr = x0+X(:,k);
        
        % loops through diagonal + upper triangular elements
        for j = k:n
            
            % reference point with real increment in jth independent
            % variable
            yp = xr+U(:,j);
            ym = xr-U(:,j);
            
            % Hessian (central + complex step)
            H(k,j) = imag(f(yp)-f(ym))/(2*h^2);
            
            % symmetry
            H(j,k) = H(k,j);
            
        end
        
    end
    
end