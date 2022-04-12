%==========================================================================
%
% ijacobian  Jacobian matrix of a multivariate, vector-valued function 
% using the complex-step approximation.
%
%   J = ijacobian(f,x0)
%   J = ijacobian(f,x0,h)
%
% See also iderivative, ipartial, igradient, idirectional, ihessian.
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
% https://tamaskis.github.io/documentation/Numerical_Differentiation_using_the_Complex_Step_Approximation.pdf
%
% REFERENCES:
%   [1] Martins et. al, "The Complex-Step Derivative Approximation",
%       https://dl.acm.org/doi/pdf/10.1145/838250.838251
%   [2] Squire et. al, "Using Complex Variables to Estimate Derivatives of 
%       "Real Functions", https://epubs.siam.org/doi/pdf/10.1137/S003614459631241X
%   [3] https://en.wikipedia.org/wiki/Jacobian_matrix_and_determinant
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) multivariate, vector-valued function,
%             f(x) (f : ℝⁿ → ℝᵐ)
%   x0      - (n×1 double) point at which to evaluate the Jacobian matrix, 
%             x₀ ∈ ℝⁿ
%   h       - (1×1 double) (OPTIONAL) step size (defaults to 10⁻²⁰⁰)
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian matrix of f evaluated at x = x₀
%
% -----
% NOTE:
% -----
%   --> This function requires n+1 evaluations of f(x).
%
%==========================================================================
function J = ijacobian(f,x0,h)

    % sets the default step size if not input
    if nargin == 2 || isempty(h)
        h = 1e-200;
    end
    
    % determines size of Jacobian
    m = length(f(x0));
    n = length(x0);
    
    % preallocates array to store Jacobian matrix
    J = zeros(m,n);
    
    % complex-step matrix
    X = h*1i*eye(n);
    
    % evaluates Jacobian matrix
    for j = 1:n
        J(:,j) = imag(f(x0+X(:,j)))/h;
    end
    
end