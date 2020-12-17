clc;clear
C = sqrt(2*pi);

f1 = @(n) ( log( C*n^(n + 1/2) * exp(-n + 1/12/n) )); 

f2 = @(n) ( log (C*n^(n + 1/2) * exp(-n) ) ); 

N = 2;

for n = 1:10^N

    x = 1:n;
    y = log(x);
    y = sum(y);
    
    e1(n) = abs(f1(n) - y);
    e2(n) = abs(f2(n) - y);

end

K = 1:10^N;

plot( log10(K),log10(e1),log10(K),log10(e2),'linewidth',2.5)
xlabel('log(n)');
ylabel('log(error)'); 
legend('O(1/{n^3})', 'O(1/n)')

set(gca,'fontsize',25)

