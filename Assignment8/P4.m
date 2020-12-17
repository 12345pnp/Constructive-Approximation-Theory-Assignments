clc;clear;

n = 20; 

K = 1:80;

a = 2*rand(n,1) - 1; %uniformly distributed points in [-1,1]
b = 2*rand(n,1) - 1; %%uniformly distributed points in [-1,1]

a_0 = 2*rand(1,1) - 1; %pseudo-random number in [-1,1]

for k = 1:K(end) %1:K(end) %k - number of points to approximate using trapezoidal rule
h = (2/(k-1));    %step size

x = -1:h:1; 

f_x = fx(a_0,  a,b,x); %evaluating the function

Ie =  Fx(a_0,  a,b,1) - Fx(a_0,  a,b,-1) ; %Exact integral
if(k>1)
It = trapp(f_x,h); %trapezoidal approximation of integral
else
It = 0; 
end

e(k) = abs(It - Ie); %error

end

plot(K,e) %Plotting the error

function f = fx(a_0,  a,b,x) 

f = a_0;

for i = 1:numel(a) 
    f = f + b(i)*sin(2*i*pi.*x) ; %+ a(i)*cos(2*i*pi.*x) 
end

end


function F = Fx(a_0,  a,b,x) 

F = a_0.*x;

for i = 1:numel(a)
    F = F  - b(i)*2*i*pi*cos(2*i*pi.*x) ; %+ a(i)*2*i*pi*sin(2*i*pi.*x)
end

end

function t = trapp(f,h)
t = 2*sum(f);

t = t - f(1) - f(end);

t = t*h/2; 
end

