function [Y,f,b,c,d] = cbcspline(f,x,n,xs)

for i = 1:n-1
    h(i) = x(i+1) - x(i);
end

for i =2:n-1
p(i) = 3*(f(i+1) - f(i))/h(i) - 3*(f(i) - f(i-1))/h(i-1);    
end

l(1) = 1;
u(1) = 0;
z(1) = 0;

for i = 2:n-1
l(i) = 2*(x(i+1) - x(i-1)) - h(i-1)*u(i-1); 
u(i) = h(i)/l(i); 
z(i) = (p(i) - h(i-1)*z(i-1))/l(i);
end

l(n) = 1;
z(n) = 0;
c(n) = 0;

for j = n-1:-1:1
    c(j) = z(j) - u(j)*c(j+1);
    b(j) = (f(j+1) - f(j))/h(j) - h(j)*(c(j+1) +2*c(j))/3;
    d(j) = (c(j+1) - c(j))/3/h(j); 
end


dx = x(2) - x(1); 


for k = 1:numel(xs) 
    

i = (xs(k) - x(1) )/dx;

i = ceil(i);

if(i <= 0)
   i = 1;
end


if (i >= n )
    i = n - 1;
end

    hh = xs(k)-x(i);    
    Y(k) = f(i) + b(i)*hh + c(i)*hh^2 +  d(i)*hh^3;
end

end