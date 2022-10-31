%==========================================================================
%
% TEST_ERROR  Test if an error is successfully thrown.
%
%   TEST_ERROR(f)
%   TEST_ERROR(@function)
%   TEST_ERROR(f,__)
%   TEST_ERROR(@(__)function(__),__)
%
% See also TEST_NO_ERROR.
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
function TEST_ERROR(f,varargin)
    
    % assumes error is not thrown
    error_thrown = false;
    
    % if error is in fact thrown, "error_thrown" is updated accordingly
    try
        if nargin == 1
            f;
        else
            f(varargin{:});
        end
    catch
        error_thrown = true;
    end
    
    % displays error message if the function was supposed to throw an error
    % but did not
    if ~error_thrown
        error('Function did not throw error.');
    end
    
end