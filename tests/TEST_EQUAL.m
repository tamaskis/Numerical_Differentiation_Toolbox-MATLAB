%==========================================================================
%
% TEST_EQUAL  Raises an error if two double arrays are not equal up to a 
% desired number of decimal places.
%
%   TEST_EQUAL(X1,X2)
%   TEST_EQUAL(X1,X2,n)
%   TEST_EQUAL(__,name,print)
%   [passed,result,message] = TEST_EQUAL(__)
%
% See also TEST_NOT_EQUAL.
%
% Copyright © 2022 Tamas Kis
% Last Update: 2022-10-30
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   X1      - (double array) double array #1
%   X2      - (double array) double array #2
%   n       - (OPTIONAL) (1×1 double) decimal places of precision
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
function [passed,result,message] = TEST_EQUAL(X1,X2,n,name,print)
    
    % sets decimal places of precision (defaults to 16, corresponding to 
    % 10⁻¹⁶)
    if (nargin < 3) || isempty(n)
        n = 16;
    end
    
    % defaults test name to empty string
    if (nargin < 4) || isempty(name)
        name = '';
    end
    
    % defaults "print" to true if not input
    if (nargin < 5) || isempty(print)
        print = true;
    end
    
    % if the two arrays do not have the same size, they cannot be equal
    if size(X1) ~= size(X2)
        passed = false;
        result = 'FAILED.\n • The two arrays are not the same size.';
        message = 'The two arrays are not the same size';
        if print, fprintf([name,result,'\n • ',message,'\n']); end
        return;
    end
    
    % reshapes both arrays to column vectors
    X1 = X1(:);
    X2 = X2(:);
    
    % number of array elements
    N = length(X1);
    
    % array that stores decimals of precision for each element
    n_array = n*ones(N,1);
    
    % loops through each array element, testing for equality at desired
    % precision or checking up to which precision equality exists
    for i = 1:N
        while (n_array(i) > 0) 
            try
                assert(round(X1(i),n_array(i)) == round(X2(i),n_array(i)));
                break;
            catch
                n_array(i) = n_array(i)-1;
            end
        end
    end
    
    % determines minimum number of decimal places of equality
    n_min = min(n_array);
    
    % determines if test passsed (arrays are equal to n decimal places)
    passed = (n_min == n);
    
    % determines data type of input
    if N == 1
        data_type_1 = 'Values';
        data_type_2 = 'values';
    else
        data_type_1 = 'Arrays';
        data_type_2 = 'arrays';
    end
    
    % results string
    if passed
        result = 'Passed.';
    else
        result = 'FAILED.';
    end
    
    % diagnostic message
    if passed
        message = '';
    elseif ~passed && (n_min > 0)
        message = ['Not equal to ',num2str(n),' decimal places. ',...
            data_type_2,' ARE equal to ',num2str(n_min),' decimal places.'];
    else
        message = 'Not equal to any decimal places.';
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
            fprintf([name_str,result,'\n • ',message,'\n']);
        end
    end
    
end