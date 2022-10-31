%==========================================================================
%
% TEST_NO_ERROR  Test to ensure an error is NOT thrown.
%
%   TEST_NO_ERROR(f)
%   TEST_NO_ERROR(@function)
%   TEST_NO_ERROR(f,__)
%   TEST_NO_ERROR(@(__)function(__),__)
%
% See also TEST_ERROR.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-29
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f           - (function_handle) function handle assigned to function
%                 you want to test
%   varargin    - (OPTIONAL) inputs to f
%
%==========================================================================
function TEST_NO_ERROR(f,varargin)
    
    % assumes error is thrown
    no_error_thrown = false;
    
    % if error is in fact NOT thrown, "no_error_thrown" is updated 
    % accordingly
    try
        if nargin == 1
            f;
        else
            f(varargin{:});
        end
        no_error_thrown = true;
    end
    
    % displays error message if the function was supposed to throw an error
    % but did not
    if ~no_error_thrown
        error('Function threw an error.');
    end
    
end