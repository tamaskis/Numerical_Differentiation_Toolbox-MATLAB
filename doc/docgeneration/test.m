clear;clc;close all;

test_func(2,1)

function x = test_func(x,y)
    tic
    if nargin == 1 || isempty(y)
        y = 1;
    end
    toc
end