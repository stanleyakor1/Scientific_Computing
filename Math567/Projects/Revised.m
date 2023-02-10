clc;clear all;close all


n=[2,4,100];
%figure(2)
for i=1:length(n)
    [U,t]=Nscheme(n(i));
    plot(t,U,'--',LineWidth=2),hold on
    
end
legend('n=2','n=4','n=100')
xlabel('t')
ylabel('u^h(t)')
axis tight



function [U,t]=Nscheme(n)
h=pi/n;
for i=2:n
    ti=(i-1)*h;
    A(i-1,i-1)=(1/h)*(sin(ti-h/2)+sin(ti+h/2))+2*h*sin(ti);
    A(i-1,i)=-1/h*(sin(ti-h/2));
    A(i,i-1)=A(i-1,i);
end
A=A(1:n-1,1:n-1);

for i=1:n+1
    t(i)=(i-1)*h;
end

q=size(A,1);
b=zeros(1,q)';
 for i=2:n
      b(i-1)=2*h*sin(2*t(i))+(1/pi)*(sin(t(i-1))-sin(t(i+1)))+((4/n)*(t(i))-2*h)*sin(t(i));
 end

c=A\b;

U=zeros(1,n+1);
U(1)=1;U(end)=-1;



h=pi/n;
for i=1:n+1
     t(i)=(i-1)*h;
end

U=zeros(1,n+1);
U(1)=1;U(end)=-1;

for k=2:length(t)-1
    for i=2:length(t)-1
        phi=hat1(i,t,t(k),h);
        U(k)=U(k)+phi*c(i-1);
    end
    
    U(k)=U(k)+(hat0(k,t,h)-hatn(k,t,h));
    
end

end


function phi=hat1(i,t,t_i,h)
    
    if (t(i-1)<=t_i) && (t_i<=t(i))
        phi=(t_i-t(i-1))/h;
    elseif (t(i)<=t_i) && (t_i<=t(i+1))
        phi=(t(i+1)-t_i)/h;
    elseif t_i<=t(i-1) || t_i>=t(i+1)
        phi=0;
    else
        phi=0;
    end
end

function phi2=hatn(i,t,h)

    if t(i)<=t(end-1)
        phi2=0;
    elseif (t(end-1)<=t(i)) && (t(i)<=t(end))
        phi2=(t(i)-t(end-1))/h;
     else
        phi2=0;
    end
end

 
 function phi3=hat0(i,t,h)
     phi3=0;
     if (t(1)<=t(i)) && (t(i)<=t(2))
         phi3=(t(2)-t(i))/h;
     elseif t(i)>=t(2)
         phi3=0;
     else
        phi3=0;
     end
 end
