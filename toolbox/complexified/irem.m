%==========================================================================
%
% irem  Remainder after division with dividend's sign (complexified version 
% of |rem|).
%
%   r = irem(a,n)
%
% See also rem.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-06
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
%   a       - (1×1 complex) dividend
%   n       - (1×1 double) divisor
%
% -------
% OUTPUT:
% -------
%   r       - (1×1 complex) remainder of a/n (with dividend's sign)
%
% -----
% NOTE:
% -----
%   --> "n" is a real number.
%
%==========================================================================
function r = irem(a,n)
    r = a-fix(a/n)*n;
end