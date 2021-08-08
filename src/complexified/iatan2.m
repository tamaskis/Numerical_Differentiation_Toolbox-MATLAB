% https://mdolab.engin.umich.edu/misc/files/complexify.f90
function result = iatan2(y,x)
    a = real(y);
    b = imag(y);
    c = real(x);
    d = imag(x);
    result = atan2(a,c)+1i*((c*b-a*d)/(a^2+c^2));
end