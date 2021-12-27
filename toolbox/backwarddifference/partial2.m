%==========================================================================
%
% partial2 Partial derivative of a multivariate, scalar or vector-valued 
% function using the backward difference approximation (given two points).
%
%   pf = partial2(f,xa,xb,j)
%
% See also derivative2, gradient2, directional2, jacobian2.
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
%   f       - (1×1 function_handle) multivariate, scalar or vector-valued 
%             function (f:Rn->R or f:Rn->Rm)
%   xa      - (n×1 double) auxiliary point
%   xb      - (n×1 double) point at which to differentiate
%   j       - (1×1 double) index of element of x to differentiate with 
%             respect to
%
% -------
% OUTPUT:
% -------
%   pf      - (m×1 double) partial derivative of f with respect to xj, 
%             evaluated at xb
%
% -----
% NOTE:
% -----
%   --> If the function is scalar-valued, then m = 1.
%   --> This function requires 2 evaluations of f(x).
%
%==========================================================================
function pf = partial2(f,xa,xb,j)
    
    % defines partial point
    xj = xb;
    xj(j) = xa(j);
        
    % evaluates partial derivative with respect to xj
    pf = (f(xb)-f(xj))/(xb(j)-xa(j));
    
end