clc;clear;
f = @(x) (1./(1+25.*x.^2)) ; 
N = 50; %[5;10;20;50]; 


for i = 1:numel(N)
    
n = N(i);

k = 0:n-1;
x_k = -1 + (2*k + 1)/n;
y_k = sin(pi*x_k/2); 

F_x = f(x_k)';
F_y = f(y_k)';

xs = -1:0.1:1;

Fs = f(xs)';

P_x = 0;
P_y = 0;

for k = 1:numel(xs)
    
P_x(k) = 0;
P_y(k) = 0;

for j = 1:numel(F_x)
    P_x(k) = P_x(k) + Langn(xs(k),x_k,j)*F_x(j);
    P_y(k) = P_y(k) + Langn(xs(k),y_k,j)*F_y(j);
end
end

end

figure;

subplot(1,2,1)
plot(xs,P_x,xs,Fs,'linewidth',2);
legend('Langrangian Interpolant','Runge Function');
title('Uniformly spaced nodes');
set(gca,'fontsize',25);

subplot(1,2,2)
plot(xs,P_y,xs,Fs,'linewidth',2);
legend('Lagrandian Interpolant','Runge Function');
title('Chebyshev nodes');
set(gca,'fontsize',25);

