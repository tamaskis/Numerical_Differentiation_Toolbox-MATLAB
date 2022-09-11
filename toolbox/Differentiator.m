%==========================================================================
%
% Differentiator  Class defining a differentiator.
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

classdef Differentiator < handle
    
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
        hi          % (1×1 double) step size for complex-step approximation (defaults to 10⁻²⁰⁰)
        hc          % (1×1 double) relative step size for central difference approximation (defaults to ε¹ᐟ³)
        hf          % (1×1 double) relative step size for forward difference approximation (defaults to √ε)
        hf2         % (1×1 double) relative step size for calculating Hessian using forward difference approximation (defaults to ε¹ᐟ³)
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = Differentiator(method)
            % obj = Differentiator(method)
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
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 Differentiator) differentiator object
            %
            %--------------------------------------------------------------
            
            % defaults "method" to 'central difference' if not input
            if (nargin == 0) || isempty(method)
                obj.method = 'central difference';
            else
                obj.method = method;
            end
            
            % default step sizes
            obj.hc = eps^(1/3);
            obj.hi = 1e-200;
            obj.hf = sqrt(eps);
            obj.hf2 = eps^(1/3);
            
            % sets up differentiation functions
            obj.set_differentiation_functions;
            
        end
        
        function obj = set_step_size(obj,h)
            % Differentiator.set_step_size(h)
            %
            % Sets the step size.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   h       - (1×1 double) step size (for complex-step 
            %             approximation) OR relative step size (for central
            %             and forward difference approximations)
            %
            %--------------------------------------------------------------
            
            % step size for complex-step approximation
            if strcmpi(obj.method,'complex-step')
                obj.hi = h;
                
            % relative step size for central difference approximation
            elseif strcmpi(obj.method,'central difference')
                obj.hc = h;
                
            % relative step sizes for forward-difference approximation
            else
                obj.hf = h;
                obj.hf2 = h;
                
            end
            
            % updates differentiation functions
            obj.set_differentiation_functions;
            
        end
        
    end
    
    % ---------------
    % Private methods.
    % ---------------
    
    methods (Access = private)
        
        function obj = set_differentiation_functions(obj)
            % Differentiator.set_differentiation_functions
            %
            % Sets up the differentiation functions.
            %--------------------------------------------------------------
            
            % sets up differentiation functions
            if strcmpi(obj.method,'central difference')
                obj.derivative = @(f,x) cderivative(f,x,obj.hc);
                obj.partial = @(f,x,k) cpartial(f,x,k,obj.hc);
                obj.gradient = @(f,x) cgradient(f,x,obj.hc);
                obj.directional = @(f,x,v) cdirectional(f,x,v,obj.hc);
                obj.jacobian = @(f,x) cjacobian(f,x,obj.hc);
                obj.hessian = @(f,x) chessian(f,x,obj.hc);
                obj.vechessian = @(f,x) cvechessian(f,x,obj.hc);
            elseif strcmpi(obj.method,'complex-step')
                obj.derivative = @(f,x) iderivative(f,x,obj.hi);
                obj.partial = @(f,x,k) ipartial(f,x,k,obj.hi);
                obj.gradient = @(f,x) igradient(f,x,obj.hi);
                obj.directional = @(f,x,v) idirectional(f,x,v,obj.hi);
                obj.jacobian = @(f,x) ijacobian(f,x,obj.hi);
                obj.hessian = @(f,x) ihessian(f,x,obj.hi,obj.hc);
                obj.vechessian = @(f,x) ivechessian(f,x,obj.hi,obj.hc);
            elseif strcmpi(obj.method,'forward difference')
                obj.derivative = @(f,x) fderivative(f,x,obj.hf);
                obj.partial = @(f,x,k) fpartial(f,x,k,obj.hf);
                obj.gradient = @(f,x) fgradient(f,x,obj.hf);
                obj.directional = @(f,x,v) fdirectional(f,x,v,obj.hf);
                obj.jacobian = @(f,x) fjacobian(f,x,obj.hf);
                obj.hessian = @(f,x) fhessian(f,x,obj.hf2);
                obj.vechessian = @(f,x) fvechessian(f,x,obj.hf2);
            end
            
        end
        
    end
    
end