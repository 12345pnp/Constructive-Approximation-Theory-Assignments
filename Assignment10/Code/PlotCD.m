data = load('out.dat');

e = data(:,3);

t = data(:,2);

N = data(:,1);

figure(1)
plot(log10(N),log10(e),'linewidth',2);
set(gca,'fontsize',25);

xlabel('log_{10}(N)');
ylabel('log_{10}(e)');

figure(2)
plot(log10(N),log10(t),'linewidth',2);
set(gca,'fontsize',25);

xlabel('log_{10}(N)');
ylabel('log_{10}(t)');
