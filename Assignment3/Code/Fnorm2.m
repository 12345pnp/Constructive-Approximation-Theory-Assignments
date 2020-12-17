function n = Fnorm2(y,x)

y2 = y.^2;
n = trapz(x,y2);
n = sqrt(n);


end