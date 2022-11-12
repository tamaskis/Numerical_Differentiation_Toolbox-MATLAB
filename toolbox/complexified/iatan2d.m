%==========================================================================
%
% iatan2d  Four-quadrant inverse tangent in degrees (complexified version
% of atan2d).
%
%   z = iatan2d(y,x)
%
% See also atan2d.
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
%   y       - (1×1 complex) input argument
%   x       - (1×1 complex) input argument
%
% -------
% OUTPUT:
% -------
%   z       - (1×1 complex) four quadrant inverse tangent of (x,y) [deg]
%
%==========================================================================
function z = iatan2d(y,x)
    a = real(y);
    b = imag(y);
    c = real(x);
    d = imag(x);
    z = (180/pi)*(atan2(a,c)+1i*((c*b-a*d)/(a^2+c^2)));
end