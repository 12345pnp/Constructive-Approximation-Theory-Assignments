function L = Langn(x,x_n,k)


L = 1;

for i = 1:(k-1)

   L = L.*(x - x_n(i))./(x_n(k) - x_n(i) );
    
    
    
end
for i = (k+1):numel(x_n)

   
       L = L.*(x - x_n(i))./(x_n(k) - x_n(i) );

    
    
end

end
