
n=10;
A=tril(rand(n));
R=size(A);
l=0

for i=1:n
    for k=1:n
    
        l=l+R(k,i)^2;

    end  
        R(i,i)=sqrt(A(i,i)-l);