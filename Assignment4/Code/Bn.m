function F = Bn(f,x,n)

x = x';
F = zeros(numel(x),1);

for  r = 0:n
    F = F + nchoosek(n,r).*(x./2 + 0.5).^r.*(1-(x./2 + 0.5)).^(n-r)*f(2*r/n - 1); 
end


end
