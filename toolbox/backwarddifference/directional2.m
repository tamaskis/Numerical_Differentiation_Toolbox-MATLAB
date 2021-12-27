%==========================================================================
%
% directional2  Directional derivative of a multivariate, scalar-valued
% function using the backward difference approximation (given two points).
%
%   Dv = directional2(f,xa,xb,v)
%
% See also derivative2, partial2, gradient2, jacobian2.
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
%   f       - (1×1 function_handle) multivariate, scalar-valued function 
%             (f:Rn->R)
%   xa      - (n×1 double) auxiliary point
%   xb      - (n×1 double) point at which to evaluate the directional
%             derivative
%   v       - (n×1 double) vector defining direction of differentiation
%
% -------
% OUTPUT:
% -------
%   Dv      - (1×1 double) directional derivative of f evaluated at xb in
%             the direction of v
%
% -----
% NOTE:
% -----
%   --> This function requires 2n evaluations of f(x).
%
%==========================================================================
function Dv = directional2(f,xa,xb,v)
    
    % determines dimension of x
    n = length(xa);

    % preallocates vector to store gradient
    g = zeros(n,1);

    % evaluates gradient
    for j = 1:n
        
        % defines partial point
        xj = xb;
        xj(j) = xa(j);
        
        % populates gradient vector
        g(j) = (f(xb)-f(xj))/(xb(j)-xa(j));
        
    end
    
    % evaluates directional derivative
    Dv = dot(v,g);
    
end