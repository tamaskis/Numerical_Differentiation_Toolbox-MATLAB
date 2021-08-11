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
% Last Update: 2021-08-11
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation_Using_the_Complex-Step_Approximation.pdf
%
% REFERENCES:
%   [1] Martins et. al, "The Complex-Step Derivative Approximation",
%       https://dl.acm.org/doi/pdf/10.1145/838250.838251
%   [2] Squire et. al, "Using Complex Variables to Estimate Derivatives of 
%       "Real Functions", https://epubs.siam.org/doi/pdf/10.1137/S003614459631241X
%   [3] https://en.wikipedia.org/wiki/Hessian_matrix
%   [4] https://www.mathworks.com/matlabcentral/fileexchange/65434-dt-qp-project?s_tid=srchtitle
%   [5] https://www.mathworks.com/matlabcentral/fileexchange/18177-complex-step-hessian?s_tid=srchtitle
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) multivariate, scalar-valued function 
%             (f:Rn->R)
%   x0      - (n×1 double) point at which to evaluate the Hessian matrix
%   h       - (OPTIONAL) (1×1 double) step size (defaults to sqrt(eps))
%
% -------
% OUTPUT:
% -------
%   H       - (n×1 double) Hessian matrix of f evaluated at x
%
%==========================================================================
function H = ihessian(f,x0,h)
    
    % sets the default step size if not input
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