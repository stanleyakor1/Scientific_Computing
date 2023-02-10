clc
clear all
close all

%n=1;N=30;

%aram={n=1,N=30,alpha=0.5,beta=0.4,gamma=0.1,delta=0.17};


subplot(2,2,1)
[f1,r1,n]=dynamicmodel(0.17,500);
plot(n,f1), hold on
plot(n,r1)
axis tight
 
subplot(2,2,2)
[f1,r1,n]=dynamicmodel(0.05,500);
plot(n,f1), hold on
plot(n,r1)
axis tight

subplot(2,2,3)
[f1,r1,n]=dynamicmodel(0.05,10);
plot(n,f1), hold on
plot(n,r1)
axis tight

subplot(2,2,4)
[f1,r1,n]=dynamicmodel(0.05,2300);
plot(n,f1), hold on
plot(n,r1)
axis tight

%[f1,r1,n]=dynamicmodel(0.05,2300);
function [F,R,n1]=dynamicmodel(delta, F1)
alpha=0.5;beta=0.4;gamma=0.1;n=1;N=30;
n1=linspace(n,N,30);
F=zeros(1,length(n1));
R=zeros(1,length(n1));
R(1)=200;
F(1)=F1;
for i=1:length(n1)-1
    F(i+1)=F(i)-alpha*F(i)+beta*R(i);
    R(i+1)=R(i)+gamma*R(i)-delta*F(i);   
    
end
end
% plot(n,F), hold on
% plot(n,R)
% axis tight
