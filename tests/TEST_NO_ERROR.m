%==========================================================================
%
% TEST_NO_ERROR  Test to ensure an error is NOT thrown.
%
%   TEST_NO_ERROR(f)
%   TEST_NO_ERROR(f,args)
%   TEST_NO_ERROR(__,name,print)
%   [passed,result,message] = TEST_NO_ERROR(__)
%
% See also TEST_ERROR.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-11-05
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) function handle assigned to function you 
%             want to test
%   args    - (OPTIONAL) (cell array) input arguments to f
%   name    - (OPTIONAL) (char) test name
%   print   - (OPTIONAL) (1×1 logical) true if test result should be 
%             printed to Command Window, false otherwise
%
% -------
% OUTPUT:
% -------
%   passed  - (1×1 logical) true if test passed, false otherwise
%   result  - (char) string storing result of test
%   message - (char) string storing additional diagnostic message if test
%             failed
%
%==========================================================================
function [passed,result,message] = TEST_NO_ERROR(f,args,name,print)
    
    % defaults test name to empty string
    if (nargin < 3) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true if not input
    if (nargin < 4) || isempty(print)
        print = true;
    end
    
    % assumes error is thrown
    no_error_thrown = false;
    
    % if error is in fact NOT thrown, "no_error_thrown" is updated 
    % accordingly
    try
        if nargin == 1
            f;
        else
            f(args{:});
        end
        no_error_thrown = true;
        error_str = '';
    catch error
        error_str = error.message;
    end
    
    % test passed if error was not thrown
    passed = no_error_thrown;
    
    % result string
    if passed
        result = 'Passed.';
    else
        result = 'FAILED.';
    end
    
    % diagnostic message
    if passed
        message = '';
    else
        message = ['Function threw the following error: ',error_str];
    end
    
    % name string
    if isempty(name)
        name_str = '';
    else
        name_str = [name,': '];
    end
    
    % prints result
    if print
        if isempty(message)
            fprintf([name_str,result,'\n']);
        else
            fprintf([name_str,result,'\n    >>>> ',message,'\n']);
        end
    end
    
end