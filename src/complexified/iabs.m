% https://mdolab.engin.umich.edu/misc/files/complexify.f90
function result = iabs(x)
    if (real(x) < 0)
        result = -real(x)-1i*imag(x);
    else
        result = x;
    end
end