clc;clear;
N = 20; 
KK = 1:10*N; 

K = 52;
%for K = 1:10*N
    f = 0;

for j = 1:(K-2)
    c(j) = cos(4*pi*N *j/(K-1) );
    f = f + c(j); 
end
%F(K) = 1 + f; 
%end