function a_r = cheby_co(r)

C = 2/pi;

th = 0:0.001:pi;

y = abs(cos(th)).*cos(r.*th);

a_r = C*trapz(th,y);

end