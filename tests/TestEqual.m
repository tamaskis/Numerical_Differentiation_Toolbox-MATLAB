%==========================================================================
%
% TestEqual  Unit test for array equality to a certain number of decimal 
% places.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-11-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestEqual < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestEqual(X1,X2,name,n)
            % obj = TestEqual(X1,X2,name,n)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   X1      - (double array) double array #1
            %   X2      - (double array) double array #2
            %   name    - (char) test name
            %   n       - (OPTIONAL) (1×1 double) decimal places of 
            %             precision
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestEqual) TestEqual object
            %
            %--------------------------------------------------------------
            
            % defaults decimal places of precision to 16 (corresponding to 
            % 10⁻¹⁶)
            if (nargin < 4) || isempty (n)
                n = 16;
            end
            
            % initializes TestEqual object (subclass of UnitTest)
            obj@UnitTest({X1,X2,n},name,'equal');
            
        end
        
    end
    
end