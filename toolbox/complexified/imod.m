%==========================================================================
%
% imod  Remainder after division ("complexified" version of the |mod| 
% function).
%
%   r = imod(a,n)
%
% See also mod.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2022-09-10
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
%   r       - (1×1 complex) remainder of a/n
%
% -----
% NOTE:
% -----
%   --> "n" is a real number.
%
%==========================================================================
function r = imod(a,n)
    r = a-floor(a/n)*n;
end