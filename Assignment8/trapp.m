
function t = trapp(f,h)
t = 2*sum(f);

t = t - f(1) - f(end);

t = t*h/2; 
end