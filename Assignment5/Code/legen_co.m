function a_r = legen_co(Qr,r)

C = 0.5*(2*r +1);

x = -1:0.001:1;

y = abs(x).*Qr(x);

a_r = C*trapz(x,y);

end