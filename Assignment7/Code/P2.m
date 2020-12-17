clc;clear;
f = @(x)(exp(x.^2) );
fd = @(x)( 2*x.*f(x) ); 

fd0 = fd(0);
fd1 = fd(1);

FD = fd1 - fd0; 

N = [2, 5, 10, 20, 50, 100, 200, 500, 1000];

IE = 1.46265174590718161;

for i = 1:numel(N)
n = N(i);

h = 1/n;

xk = 0:h:1; 

T = trapp(f(xk),h);

T2 = T - h^2*FD/12; 

e(i) = abs(T - IE);

e2(i) = abs(T2 - IE); 

end

plot(log10(N),log10(e),log10(N),log10(e2), 'linewidth',2.5)
set(gca,'fontsize',25)
legend('Trapezoidal Approximation', 'Trapezoidal with End corrections')
xlabel('log_{10}(N)');
ylabel('log_{10}(error)');

function t = trapp(f,h)
t = 2*sum(f);

t = t - f(1) - f(end);

t = t*h/2; 
end


