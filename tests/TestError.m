%==========================================================================
%
% TestError  Unit test for confirming that a function throws an error.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestError < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestError(f,args,name)
            % obj = TestError(f,args,name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (function_handle) function handle assigned to 
            %             function you want to test
            %   args    - (OPTIONAL) (cell array) input arguments to f
            %   name    - (char) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestError) TestError object
            %
            %--------------------------------------------------------------
            
            % defaults input arguments to empty vector
            if (nargin < 2)
                args = [];
            end
            
            % initializes TestError object (subclass of UnitTest)
            obj@UnitTest({f,args},name,'error');
            
        end
        
    end
    
end