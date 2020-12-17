clc;clear;
f = @(x) (1./(1+25.*x.^2)) ; 
N = 50; %[5;10;20;50]; 


for i = 1:numel(N)
    
n = N(i);

k = 0:n-1;
x_k = -1 + (2*k + 1)/n;
y_k = sin(pi*x_k/2); 

V_x = VAN(x_k);
V_y = VAN(y_k);

F_x = f(x_k)';
F_y = f(y_k)';

A_x = (V_x)\F_x;
A_y = (V_y)\F_y;

xs = -1:0.1:1;

Vs = Fncn(xs,n);

P_x = Vs*A_x;
P_y = Vs*A_y;

Fs = f(xs);

end


subplot(1,2,1)
plot(xs,P_x,xs,Fs,'linewidth',2);
legend('Vandermonde Interpolant','Runge Function');
title('Uniformly spaced nodes');set(gca,'fontsize',25);

subplot(1,2,2)
plot(xs,P_y,xs,Fs,'linewidth',2);
legend('Vandermonde Interpolant','Runge Function');
title('Chebyshev nodes');
set(gca,'fontsize',25);
