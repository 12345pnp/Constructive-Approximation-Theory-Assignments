%FINDING LEGENDRE COEFFICIENTS USING RECURSION
%FFINITE PRECISION ERROR WINDUP
%DOESNT WORK

function a_r = legen_c(f,r)

a_p = 0.5*(f(1) - f(-1));

a_r = 3*f(-1);

if r<1
    a_r  = a_p;
end


for i = 2:r
    k = a_r;
    a_r = ( - a_r + a_p/(2*i -3) )*(2*i +1 );
    a_p = k;
end


end