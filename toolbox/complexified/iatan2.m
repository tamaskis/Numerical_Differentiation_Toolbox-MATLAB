%==========================================================================
%
% iatan2  Four-quadrant inverse tangent in radians (complexified version 
% of |atan2|).
%
%   z = iatan2(y,x)
%
% See also atan2.
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
%   y       - (1×1 complex) input argument
%   x       - (1×1 complex) input argument
%
% -------
% OUTPUT:
% -------
%   z       - (1×1 complex) four quadrant inverse tangent of (x,y) [rad]
%
%==========================================================================
function z = iatan2(y,x)
    a = real(y);
    b = imag(y);
    c = real(x);
    d = imag(x);
    z = atan2(a,c)+1i*((c*b-a*d)/(a^2+c^2));
end