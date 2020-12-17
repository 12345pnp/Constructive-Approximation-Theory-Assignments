function a_r = legen_co(f,r)

C = (2*r + 1)/factorial(r);
C = C/(2^(r+1));

x = -1:0.001:1;

y = f(x).*(1 - x.^2).^r;

a_r = C*trapz(x,y);

end