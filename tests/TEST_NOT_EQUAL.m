%==========================================================================
%
% TEST_NOT_EQUAL  Raises an error if two double arrays are equal up to a 
% desired number of decimal places.
%
%   TEST_NOT_EQUAL(X1,X2)
%   TEST_NOT_EQUAL(X1,X2,n)
%   TEST_NOT_EQUAL(__,name,print)
%   [passed,result] = TEST_NOT_EQUAL(__)
%
% See also TEST_EQUAL.
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
%   result  - (char) string storing the result of the test
%
%==========================================================================
function [passed,result] = TEST_NOT_EQUAL(X1,X2,n,name,print)
    
    % sets decimal places of precision (defaults to 16, corresponding to 
    % 10⁻¹⁶)
    if (nargin < 3) || isempty(n)
        n = 16;
    end
    
    % appends colon to test name if input, otherwise defaults test name to 
    % empty string
    if (nargin < 4) || isempty(name)
        name = '';
    else
        name = [name,': '];
    end
    
    % defaults "print" to true if not input
    if (nargin < 5) || isempty(print)
        print = true;
    end
    
    % if the two arrays do not have the same size, they cannot be equal
    if size(X1) ~= size(X2)
        passed = true;
        result = 'Passed.';
        if print, fprintf([name,result,'\n']); end
        return;
    end
    
    % reshapes both arrays to column vectors
    X1 = X1(:);
    X2 = X2(:);
    
    % number of array elements
    N = length(X1);
    
    % array that stores decimals of precision for each element
    n_array = n*ones(N,1);
    
    % tracks number of inequalities
    m = 0;
    
    % loops through each array element, testing for equality at desired
    % precision or checking up to which precision equality exists +
    % counting the number of inequalities
    for i = 1:N
        while (n_array(i) > 0)
            element_equal = true;
            try
                assert(round(X1(i),n_array(i)) == round(X2(i),n_array(i)));
            catch
                n_array(i) = n_array(i)-1;
                element_equal = false;
            end
            if ~element_equal
                m = m+1;
            end
        end
    end
    
    % determines minimum number of decimal places of equality
    n_min = min(n_array);
    
    % determines if test passed (at least one elementwise inequality 
    % exists)
    passed = (m > 0);
    
    % determines data type of input
    if N == 1
        data_type = 'Values';
    else
        data_type = 'Arrays';
    end
    
    % results string
    if passed
        result = 'Passed.';
    else
        if n_min == 0
            result = ['ERROR -- Equal to ',num2str(n),...
                ' decimal places.'];
        else
            result = ['ERROR -- Equal to ',num2str(n),...
                ' decimal places. ',data_type,' ARE NOT equal to ',...
                num2str(n_min),' decimal places.'];
        end
    end
    
    % prints result
    if print, fprintf([name,result,'\n']); end
    
end