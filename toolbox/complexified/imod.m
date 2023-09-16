%==========================================================================
%
% imod  Remainder after division with divisor's sign (complexified version 
% of mod).
%
%   r = imod(a,n)
%
% See also mod.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-11-12
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
%   r       - (1×1 complex) remainder of a/n (with divisor's sign)
%
% -----
% NOTE:
% -----
%   • "n" is a real number.
%
%==========================================================================
function r = imod(a,n)
    r = a-floor(a/n)*n;
end