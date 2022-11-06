%==========================================================================
%
% TestNoError  Test for confirming that a function does not throw an error.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestNoError < UnitTest
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestNoError(f,args,name)
            % obj = TestNoError(f,args,name)
            %
            % Constructor.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   f       - (function_handle) function handle assigned to 
            %             function you want to test
            %   args    - (cell array) input arguments to f
            %   name    - (char) test name
            %
            % -------
            % OUTPUT:
            % -------
            %   obj     - (1×1 TestNoError) TestNoError object
            %
            %--------------------------------------------------------------
            
            % initializes TestNoError object (subclass of UnitTest)
            obj@UnitTest({f,args},name,'no error');
            
        end
        
    end
    
end