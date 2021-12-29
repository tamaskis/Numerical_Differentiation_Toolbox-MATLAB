%==========================================================================
%
% ipartial Partial derivative of a multivariate, scalar or vector-valued 
% function using the complex-step approximation.
%
%   pf = ipartial(f,x0,j)
%   pf = ipartial(f,x0,j,h)
%
% See also iderivative, igradient, idirectional, ijacobian, ihessian.
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
%   [1] Martins et. al, "The Complex-Step Derivative Approximation",
%       https://dl.acm.org/doi/pdf/10.1145/838250.838251
%   [2] Squire et. al, "Using Complex Variables to Estimate Derivatives of 
%       "Real Functions", https://epubs.siam.org/doi/pdf/10.1137/S003614459631241X
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (1×1 function_handle) multivariate, scalar or vector-valued 
%             function (f:Rn->R or f:Rn->Rm)
%   x0      - (n×1 double) point at which to differentiate
%   j       - (1×1 double) index of element of x to differentiate with 
%             respect to
%   h       - (OPTIONAL) (1×1 double) step size (defaults to √(ɛ), where ɛ
%             is double precision)
%
% -------
% OUTPUT:
% -------
%   pf      - (m×1 double) partial derivative of f with respect to xj, 
%             evaluated at x0
%
% -----
% NOTE:
% -----
%   --> If the function is scalar-valued, then m = 1.
%   --> This function requires 1 evaluation of f(x).
%
%==========================================================================
function pf = ipartial(f,x0,j,h)

    % sets the default step size if not input
    if nargin == 3 || isempty(h)
        h = sqrt(eps);
    end
    
    % redefine x0
    x0(j) = x0(j)+h*1i;
    
    % evaluates partial derivative with respect to xj
    pf = imag(f(x0))/h;
    
end