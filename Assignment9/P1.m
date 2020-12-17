x = chebfun('x'); f = 1./(1+25*x.^2); nn = 0:10:200; ee = 0*nn;
for j = 1:length(nn)
    n = nn(j); fn = chebfun(f,n+1); ee(j) = norm(f-fn,inf);
end
hold off, semilogy(nn,ee,'.'), grid on, axis([0 200 1e-17 10])
FS = 'fontsize';
title(['Geometric convergence of Chebyshev ' ...
      ' interpolants -- analytic function'],FS,9)