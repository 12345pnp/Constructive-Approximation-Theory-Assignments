function F = Fncn(x,n)

if(~iscolumn(x))
    x = x';
end

s = size(x,1);
F = [];

for i = 1:s
    f = [];
    for j = 0:n-1
        f = [f,x(i)^j];
    end
    F = [F;f];
end


end
