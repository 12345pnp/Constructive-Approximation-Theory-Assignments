clc;clear;

N = [5;10;20;50]; 

for i = 1:numel(N)
    
n = N(i);

k = 0:n-1;
x_k = -1 + (2*k + 1)/n;
y_k = sin(pi*x_k/2); 

V_x = VAN(x_k);
V_y = VAN(y_k);

c_x(i) = cond(V_x);
c_y(i) = cond(V_y);
end

semilogy(N,c_x,N,c_y, 'linewidth',2.5);
hold on
scatter(N,c_x,100,'fill');
scatter(N,c_y,100,'fill');

set(gca,'fontsize',25);
legend('Uniform nodes','Chebyshev nodes'); 
xlabel('size of matrix');
ylabel('condition number'); 