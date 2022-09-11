%==========================================================================
%
% Differentiator  Class defining a differentiator object.
%
% Copyright © 2022 Tamas Kis
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
%==========================================================================

classdef Differentiator
    
    % -----------
    % Properties.
    % -----------
    
    properties
        derivative  % (1×1 function_handle) derivative of a univariate, vector-valued function
        partial     % (1×1 function_handle) partial derivative of a multivariate, vector-valued function
        gradient    % (1×1 function_handle) gradient of a multivariate, scalar-valued function
        directional % (1×1 function_handle) directional derivative of a multivariate, scalar-valued function
        jacobian    % (1×1 function_handle) Jacobian of a multivariate, vector-valued function
        hessian     % (1×1 function_handle) Hessian of a multivariate, scalar-valued function
        vechessian  % (1×1 function_handle) vector Hessian of a multivariate, vector-valued function
        method      % (char) differentiation method
        hi          % (1×1 double) step size for complex-step approximation
        hc          % (1×1 double) relative step size for central difference approximation
        hf          % (1×1 double) relative step size for forward difference approximation
        hf2         % (1×1 double) relative step size for calculating Hessian using forward difference approximation
    end
    
    % --------
    % Methods.
    % --------
    
    methods
        
        % ------------
        % Constructor.
        % ------------
        
        function obj = Differentiator(method,hi,hc,hf,hf2)
            % obj = Differentiator(method,hi,hc,hf,hf2)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   method  - (OPTIONAL) (char) differentiation method; 
            %             'central difference', 'complex-step', or
            %             'forward difference' (defaults to 
            %             'central difference')
            %   hi      - (OPTIONAL) (1×1 double) step size for
            %             complex-step approximation (defaults to 10⁻²⁰⁰)
            %   hc      - (OPTIONAL) (1×1 double) relative step size for
            %             central difference approximation (defaults to
            %             ε¹ᐟ³)
            %   hf      - (OPTIONAL) (1×1 double) relative step size for
            %             forward difference approximation (defaults to √ε)
            %   hf2     - (OPTIONAL) (1×1 double) relative step size for
            %             calculating Hessian using forward difference 
            %             approximation (defaults to ε¹ᐟ³)
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 Differentiator) differentiator object
            %
            %--------------------------------------------------------------
            
            % defaults "method" to 'central difference' if not input
            if (nargin < 1) || isempty(method)
                method = 'central difference';
            end
            
            % defaults "hi" to 10⁻²⁰⁰ if not input
            if (nargin < 2) || isempty(hi)
                hi = 1e-200;
            end
            
            % defaults "hc" to ε¹ᐟ³ if not input
            if (nargin < 3) || isempty(hc)
                hc = eps^(1/3);
            end
            
            % defaults "hf" to √ε if not input
            if (nargin < 4) || isempty(hf)
                hf = sqrt(eps);
            end
            
            % defaults "hf2" to ε¹ᐟ³ if not input
            if (nargin < 5) || isempty(hf2)
                hf2 = eps^(1/3);
            end
            
            % sets up differentiation functions
            if strcmpi(method,'central difference')
                obj.derivative = @(f,x) cderivative(f,x,hc);
                obj.partial = @(f,x,k) cpartial(f,x,k,hc);
                obj.gradient = @(f,x) cgradient(f,x,hc);
                obj.directional = @(f,x,v) cdirectional(f,x,v,hc);
                obj.jacobian = @(f,x) cjacobian(f,x,hc);
                obj.hessian = @(f,x) chessian(f,x,hc);
                obj.vechessian = @(f,x) cvechessian(f,x,hc);
            elseif strcmpi(method,'complex-step')
                obj.derivative = @(f,x) iderivative(f,x,hi);
                obj.partial = @(f,x,k) ipartial(f,x,k,hi);
                obj.gradient = @(f,x) igradient(f,x,hi);
                obj.directional = @(f,x,v) idirectional(f,x,v,hi);
                obj.jacobian = @(f,x) ijacobian(f,x,hi);
                obj.hessian = @(f,x) ihessian(f,x,hi,hc);
                obj.vechessian = @(f,x) ivechessian(f,x,hi,hc);
            elseif strcmpi(method,'forward difference')
                obj.derivative = @(f,x) fderivative(f,x,hf);
                obj.partial = @(f,x,k) fpartial(f,x,k,hf);
                obj.gradient = @(f,x) fgradient(f,x,hf);
                obj.directional = @(f,x,v) fdirectional(f,x,v,hf);
                obj.jacobian = @(f,x) fjacobian(f,x,hf);
                obj.hessian = @(f,x) fhessian(f,x,hf2);
                obj.vechessian = @(f,x) fvechessian(f,x,hf2);
            end
            
            % sets method and step sizes as properties so they may be 
            % queried/edited
            obj.method = method;
            obj.hc = hc;
            obj.hi = hi;
            obj.hf = hf;
            obj.hf2 = hf2;
            
        end
        
    end
    
end