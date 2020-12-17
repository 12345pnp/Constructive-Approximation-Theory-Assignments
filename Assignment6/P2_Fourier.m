clc;clear;
f = @(x) ( (x - floor(x)).*(1 - (x - floor(x))) );



n = 1000;

L = 0.5;
x = -L:0.0001:L;

for i = 1:n

   y = f(x).*cos(i*pi.*x/L);
   a(i) =  trapz(x,y)/L;
    
   y = f(x).*sin(i*pi.*x/L);
   b(i) =  trapz(x,y)/L;

end

a0 = trapz(x, f(x))/(2*L); 

F = a0;
x2 = -2:0.01:2; 
for i = 1:n
    
    F = F + a(i)*cos(i*pi.*x2/L) + b(i)*cos(i*pi.*x2/L); 
    
end

nn = 1:n;
nn = log10(nn);