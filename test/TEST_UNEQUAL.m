%==========================================================================
%
% TEST_UNEQUAL  Determines if the actual result is different than the 
% expected result, above some minimum error.
%
%   TEST_UNEQUAL(actual,expected)
%   TEST_UNEQUAL(actual,expected,min_err)
%
% Author: Tamas Kis
% Last Update: 2021-12-06
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   actual      - (double array) actual result (what your function found)
%   expected    - (double array) expected result (testing against this)
%   min_err     - (OPTIONAL) (1×1 double) minimum error (defaults to
%                 10^-15)
%
% -----
% NOTE:
% -----
%                            |(actual) - (expected)|
%           relative error = -----------------------
%                                   expected
%
%           absolute error = |(actual) - (expected)|
%
%==========================================================================
function TEST_UNEQUAL(actual,expected,min_err)
    
    % sets minimum error (defaults to 10^-15)
    if nargin < 3
        min_err = 1e-15;
    end

    % reshapes both arrays to column vectors
    expected = expected(:);
    actual = actual(:);

    % preallocates array to store errors
    err = zeros(size(actual));

    % calculates error for each element
    for i = 1:length(actual)

        % calculates error as relative error if expected result is nonzero
        if expected(i) ~= 0
            err(i) = abs((actual(i)-expected(i))./expected(i));

        % calculates error as absolute error if expected result is zero
        else
            err(i) = abs(actual(i)-expected(i));
        end

    end
    
    % tests if elements are unequal (error should be greater than minimum 
    % error)
    for i = 1:length(err)
        assert(err(i) > min_err);
    end

end