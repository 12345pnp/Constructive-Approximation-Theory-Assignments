clc;clear;
f = @(x)(1./(1 + 25.*x.^2)); 
x = 0;

N = 10:10:400;
for i = 1:numel(N)
n = N(i); 
Fx = f(x);
Bx = Bn(f,x,n); 

en(i) = abs(Bx - Fx); 
end

figure(1)
plot(N,en,'linewidth',2.5)
set(gca,'fontsize',25)
xlabel('degree n');
ylabel('error |B_n - f|');

x = -1:0.01:1;
N = [10,20,50,100,200];

for i = 1:numel(N)
n = N(i); 
Fx = f(x);
Bx = Bn(f,x,n);
figure(i+1) 
plot(x,Fx,x, Bx, 'linewidth',2.5);
set(gca,'fontsize',25)
legend('Runge','Bernstein');
title(num2str(n)); 
end