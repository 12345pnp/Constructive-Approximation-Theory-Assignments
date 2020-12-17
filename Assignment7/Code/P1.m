clc;clear;
N = 1:500;

for n = N(1):N(end)

k = 0:n;

xk  = -1 + 2*k/n; 


f = @(x)(1./(1 + 25.*x.^2) );

%x0 = -1;
xn = -1 + 1/n;
%xn = (x0 + x1)/2; 

f2 = 0;
f1 = f(xn);
F = f(xk)';


for j = 1:numel(xk)
    f2 = f2 +  Langn(xn,xk,j)*F(j);
end

e(n) = abs(f1 - f2); 

end
plot(N,log10(e),'linewidth',2)
xlabel('n')
ylabel('log_{10}(error)')
set(gca,'fontsize',25)
