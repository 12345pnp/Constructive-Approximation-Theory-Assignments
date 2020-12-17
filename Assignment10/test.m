clc;clear;

f = @(x)(-pi^2*sin(pi*x)^2 ); 
N = 10000;
h = 1/(N+1);
b = -2;
d(1) =  f(h)/b;
for i = 2:N
c = (1 - i)/(i);
d(i) = (f(i*h) - d(i-1) )/(b - c); 
end

K = h:h:h*N;