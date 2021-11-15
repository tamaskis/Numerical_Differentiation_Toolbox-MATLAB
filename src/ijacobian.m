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
% Last Update: 2021-11-14
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_Using_the_Complex-Step_Approximation.pdf
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
%   f       - (function_handle) multivariate, vector-valued function 
%             (f:Rn->Rm)
%   x0      - (n×1 double) point at which to evaluate the Jacobian matrix
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian matrix of f evaluated at x
%
%==========================================================================
function J = ijacobian(f,x0,h)

    % sets the default step size if not input
    if nargin == 2 || isempty(h)
        h = sqrt(eps);
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