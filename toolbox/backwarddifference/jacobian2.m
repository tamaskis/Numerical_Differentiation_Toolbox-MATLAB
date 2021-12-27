%==========================================================================
%
% jacobian2  Jacobian matrix of a multivariate, vector-valued function 
% using the complex-step approximation.
%
%   J = jacobian2(f,xa,xb)
%
% See also derivative2, partial2, gradient2, directional2.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-12-26
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TOOLBOX DOCUMENTATION:
% https://tamaskis.github.io/Numerical_Differentiation_Toolbox-MATLAB/
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Numerical_Differentiation.pdf
%
% REFERENCES:
%   [1] https://en.wikipedia.org/wiki/Finite_difference_method
%   [2] http://www.ohiouniversityfaculty.com/youngt/IntNumMeth/lecture27.pdf
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) multivariate, vector-valued function 
%             (f:Rn->Rm)
%   xa      - (n×1 double) auxiliary point
%   xb      - (n×1 double) point at which to evaluate the Jacobian matrix
%
% -------
% OUTPUT:
% -------
%   J       - (m×n double) Jacobian matrix of f evaluated at xb
%
% -----
% NOTE:
% -----
%   --> This function requires 2n evaluations of f(x).
%
%==========================================================================
function J = jacobian2(f,xa,xb)
    
    % determines size of Jacobian
    m = length(f(xa));
    n = length(xa);
    
    % preallocates array to store Jacobian matrix
    J = zeros(m,n);

    % evaluates gradient
    for j = 1:n
        
        % defines partial point
        xj = xb;
        xj(j) = xa(j);
        
        % populates gradient vector
        J(:,j) = (f(xb)-f(xj))/(xb(j)-xa(j));
        
    end
    
end