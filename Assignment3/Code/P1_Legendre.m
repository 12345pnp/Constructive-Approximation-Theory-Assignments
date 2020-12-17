clc;clear;

f = @(x) (exp(x));

N =  [3,7,15,31,63,127];
MAX = 1000;
dx = 1/MAX;

load('nodes_data');

for i = 1:numel(N)
    
    
n = N(i);

y_k = nodes{i};
F_y = f(y_k)';


xs = -1:dx:1;


for k = 1:numel(xs)
    
P_1(k) = 0;

for j = 1:numel(F_y)
    P_1(k) = P_1(k) + Langn(xs(k),y_k,j)*F_y(j);
end
end
    
    

for k = 1:numel(xs)
    
P_2(k) = 0;

for j = 0:n
    P_2(k) = P_2(k) + legen_co(f,j)*legen(j,xs(k));
end
end
Fs = f(xs);
en = Fs - P_1;

en = en.^2;

en = sum(en);

en = sqrt(en);

e_n1(i) = en;

en = Fs - P_2;

en = en.^2;

en = sum(en);

en = sqrt(en);

e_n2(i) = en;
end

    
    
    
    
