function Q = legen(n,x)

Q_p = 1;

Q = x;

if n<1
    Q  = Q_p;
end


for i = 2:n 
    k = Q;
    Q = ( (2*i - 1 )*x * Q - (i-1)*Q_p ) / (i);
    Q_p = k;
   
end

end
