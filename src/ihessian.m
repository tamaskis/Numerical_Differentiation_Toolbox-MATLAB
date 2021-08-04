%==========================================================================
%
% ihessian  Calculates the Hessian of a scalar-valued function using a
% combination of a complex step approximation and central difference
% approximation.
%
%   H = ihessian(f,x)
%
% See also iderivative, igradient, ijacobian.
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-03
% Website: tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% REFERENCES:
%   [1] https://www.mathworks.com/matlabcentral/fileexchange/65434-dt-qp-project?s_tid=srchtitle
%   [2] https://www.mathworks.com/matlabcentral/fileexchange/18177-complex-step-hessian?s_tid=srchtitle
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) scalar-valued function (f:Rn-->R)
%   x       - (n×1 double) point at which to evaluate the Hessian matrix
%
% -------
% OUTPUT:
% -------
%   H       - (n×1 double) Hessian matrix of f evaluated at x
%
%==========================================================================
function H = ihessian(f,x)
    
    % step size
    h = sqrt(eps);
    
    % determines dimension of "x"
    n = length(x);
    
    % preallocates array to store Hessian
    H = zeros(n);
    
    % loops over each independent variable
    for k = 1:n
        
        % reference point with complex increment in kth independent
        % variable
        x0 = x;
        x0(k) = x0(k)+h*1i;
        
        % loops through diagonal + upper triangular elements
        for l = k:n
            
            % reference point with lth independent variable incremented
            xp = x0;
            xp(l) = xp(l)+h;
            
            % reference point with lth independent variable decrementerd
            xm = x0;
            xm(l) = xm(l)-h;
            
            % evaluates function at xp and xm
            up = f(xp);
            um = f(xm);
            
            % Hessian (central + complex step)
            H(k,l) = imag(up-um)/(2*h^2);
            
            % symmetry
            H(l,k) = H(k,l);
            
        end

    end
    
end