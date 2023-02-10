clc
clear all
close all

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We degine two functions, one that takes the ODE and one that implements % 
% the numerical scheme.  Some of the variables used in this code are:     
% I : represents the infected cells
% V : represents the Influenza virus
% T : represents the epithelial cells of the respiratory tract.
%  
%
%
%
%  In other to ensure the stability and accuracy of our numerical scheme,
%  we need h to be small. From literature, it take between 1 to 4 days to
%  fall sick after being infected by an influza
%  (source: https://www.healthline.com/health/flu-incubation-period). Thus
%  we take h=1/(24*4) where 24 refers to the number of hours in a day.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


T0=30000;I0=0;V0=10;
z0=[T0,I0,V0];

a=0;b=2;h=1/(24*4);

beta=0.02;delta=0.01;p=0.025;c=0.05;

[z,t]=Nscheme(a,b,h,z0);
T=z(:,1); I=z(:,2);V=z(:,3);
plot(t,T,'r',LineWidth=2), hold on
plot(t,I,'b',LineWidth=2)
plot(t,V,'k',LineWidth=2)
xlabel('t')
ylabel('T(t),I(t),V(t)')
legend('T','I','V')
title('Plot of T(t), I(t), and V(t) against t')


function [z,t]=Nscheme(a,b,h,z0)
t=a:h:b;

N=length(t);

z=zeros(N,length(z0));

z(1,:)=z0; % Initial values 

%%%%%% Function Parameters %%%%%%%%%%
a_21=1/2; a_32=1/2; a_31=0; a_41=0;a_42=0;a_43=1;
c2=1/2; c3=1/2; c4=1; b1=1/6; b4=1/6; b2=1/3; b3=1/3;






%%%%%%%% The Numerical Scheme %%%%%%%%%%%%%%%%%%%
for i=1:N-1
    e1=z(i,:);

    e2=e1+h*a_21*f(t(i),e1);

    e3=e1+h*(a_31*f(t(i),e1)+a_32*f(t(i)+c2*h,e2));

    e4=e1+h*(a_41*f(t(i),e1)+a_42*f(t(i)+c2*h,e2)+a_43*f(t(i)+c3*h,e3));

    z(i+1,:)=e1+h*(b1*f(t(i),e1)+b2*f(t(i)+c2*h,e2)+b3*f(t(i)+c3*h,e3)+b4*f(t(i)+c4*h,e4));
end
end



%%%%%%% ODE %%%%%%%%%%%%%%%%%%%

function M=f(t,z)

% Assigning the elements of the vector z to their respective quantities

T=z(1);I=z(2);V=z(3);


% Function parameters
beta=0.02;delta=0.01;p=0.025;c=0.05;


% Rewriting equation 1

dTdt=-beta*T*V;

dIdt=beta*T*V-delta*I;

dVdt=p*I-c*V;

% A 1 by 3 vector to store the derivatives
M=cat(1,dTdt,dIdt,dVdt)';
end