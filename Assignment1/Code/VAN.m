function V = VAN(x)

if(~iscolumn(x))
    x = x';
end

n = size(x,1) - 1;
V = [];

for i = 0:n
   V = [V,x.^i];
end



end
