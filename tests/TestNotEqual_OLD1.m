%==========================================================================
%
% TestNotEqual  Class defining a test that tests for array inequality to a
% certain number of decimal places.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%==========================================================================

classdef TestNotEqual < handle
    
    % -----------
    % Properties.
    % -----------
    
    properties
        X1      % (double array) double array #1
        X2      % (double array) double array #2
        n       % (1×1 double) decimal places of precision
        name    % (char) test name
        passed  % (1×1 logical) true if test passed, false otherwise
    end
    
    % ---------------
    % Public methods.
    % ---------------
    
    methods (Access = public)
        
        function obj = TestNotEqual(X1,X2,name,n)
            % obj = TestNotEqual(X1,X2,name,n)
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
            %   obj     - (1×1 TestNotEqual) TestNotEqual object
            %
            %--------------------------------------------------------------
            
            % sets decimal places of precision (defaults to 16, 
            % corresponding to 10⁻¹⁶)
            if (nargin < 3) || isempty (n)
                obj.n = 16;
            else
                obj.n = n;
            end
            
            % stores inputs
            obj.X1 = X1;
            obj.X2 = X2;
            obj.name = name;
            
            % "passed" initialized to false (test cannot have passed before
            % it wass run)
            obj.passed = false;
            
        end
        
        function n_passed = run(obj,n_passed,n_total)
            % TestEqual.run
            %
            % Runs the test.
            %--------------------------------------------------------------
            %
            % ------
            % INPUT:
            % ------
            %   n_passed    - (1×1 double) number of tests that have passed
            %                 thus far
            %   n_total     - (1×1 double) total number of tests
            %
            % -------
            % OUTPUT:
            % -------
            %   n_passed    - (1×1 double) updated numebr of tests that
            %                 have passed thus far
            %
            %--------------------------------------------------------------
            
            % runs test
            [obj.passed,result] = TEST_NOT_EQUAL(obj.X1,obj.X2,obj.n,...
                obj.name,false);
            
            % increments number of passed tests results if test passed
            if obj.passed, n_passed = n_passed + 1; end
            
            % determines if (# passed) / (total #) ratio should be printed
            ratio = (nargin == 2) && ~isempty(n_passed) &&...
                ~isempty(n_total);
            
            % prints results
            if ratio
                fprintf([obj.name,result,'(',num2str(n_passed),'/',...
                    num2str(n_total),')\n']);
            else
                fprintf([obj.name,result,'\n']);
            end
            
        end
        
    end
    
end