clc
clear all
close all

function [xx,yy]=trapezoid(t_init,t_final,M_o,g,N)
h=(t_final-t_init)/N;
t1=linspace(a,b,N);
M=zeros(lenght(M_o),length(t1));
M(1)=M_o;
for i=1:N-1
    ti=t_init +a*h;

end
end