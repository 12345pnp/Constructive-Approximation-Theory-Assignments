clc;clear;
f = @(x) (1./(1+25.*x.^2)) ; 
N = [5, 9, 17, 33, 65, 129, 257];
MAX = 1000;
dx = 1/MAX; 

for i = 1:numel(N)
    
n = N(i);


k = 0:n-1;
x_k = -1 + (2*k + 1)/n;
y_k = sin(pi*x_k/2); 

xs = -1:dx:1;

F_x = f(x_k)';
F_y = f(y_k)';


for k = 1:numel(xs)
    
P_C(k) = 0;

for j = 1:numel(F_y)
    P_C(k) = P_C(k) + Langn(xs(k),y_k,j)*F_y(j);
end
end

P_3 = cbcspline( F_x,x_k,n,xs); 

Fs = f(xs);

e_n_C(i) = max (abs(Fs - P_C)); 

e_n_3(i) = max (abs(Fs - P_3)); 

end

plot(N,log10(e_n_3),N,log10(e_n_C),'linewidth',3.5) 
legend('Cubic','Chebyshev') 
set(gca,'fontsize',40) 
xlabel('Number of nodes')
ylabel('log_{10} (e_n)')
%plot(xs,Fs,xs,P_3,xs,P_C,'linewidth',2)
%legend('Actual','Cubic','Chebyshev') 