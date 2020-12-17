
function f = fx(a_0,  a,b,x) 

f = a_0;

for i = 1:numel(a) 
    f = f + a(i)*cos(2*i*pi.*x) + b(i)*sin(2*i*pi.*x);
end

end