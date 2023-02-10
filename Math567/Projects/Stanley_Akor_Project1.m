clc
close all
clear all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We define a function that takes in the variable parameters (i.e F_1 and 
% delta) in the dynamic model. The function returns an array of all the 
% years y, an array of foxes population through the years (Fn) 
% and an array of Rabbits population through the years (Rn).
%
%
% The parameters used in the code are:
% Fn : An array of Foxes population from year 1 to year 30.
% Rn : An array of rabbits population from year 1 to year 30.
% gamma : Rabbits population growth rate when Foxes are absent.
% delta : Rate at which Rabbits population decrease when Foxes are present.
% alpha : Foxes population death rate if no rabbits are available.
% beta : Foxes population growth rate when rabbits are availabe for food.
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%% Figures %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
% Calling the dynamicmodel function for  values of delta and F_1
[Fn1,Rn1,y]=dynamicmodel(0.17,500); 
plot(y,Fn1), hold on
plot(y,Rn1)
xlabel("n")
ylabel("Foxes and Rabbits")
legend("Foxes", "Rabbits","Location","north")
title('\delta =0.17 , F_1=500 ')
axis tight

subplot(2,2,2)
% Calling the dynamicmodel function for  values of delta and F_1
[Fn2,Rn2,y]=dynamicmodel(0.05,500);   
plot(y,Fn2), hold on
plot(y,Rn2)
title('\delta =0.05, F_1=500')
xlabel("n")
ylabel("Foxes and Rabbits")
legend("Foxes", "Rabbits","Location","north")
axis tight

subplot(2,2,3)
% Calling the dynamicmodel function for  values of delta and F_1
[Fn3,Rn3,y]=dynamicmodel(0.05,10);  
plot(y,Fn3), hold on
plot(y,Rn3)
title('\delta =0.05, F_1=10')
xlabel("n")
ylabel("Foxes and Rabbits")
legend("Foxes", "Rabbits","Location","north")
axis tight

subplot(2,2,4)
% Calling the dynamicmodel function for  values of delta and F_1
[Fn4,Rn4,y]=dynamicmodel(0.05,2300);  
plot(y,Fn4), hold on
plot(y,Rn4)
title('\delta =0.05, F_1=2300')
xlabel("n")
ylabel("Foxes and Rabbits")
legend("Foxes", "Rabbits","Location","north")
axis tight

sgtitle('Population Dynamics of Foxes and Rabbits') 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%% DynamicModel %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Fn,Rn,y]=dynamicmodel(delta, F_1)

% An array of all the years being considered i.e from year 1 to year 30 
n=1;N=30;y=linspace(n,N,30);

Fn=[]; % An empy array for storing the population of foxes for each year

% Initializing the population of Foxes at the begining of year 1
Fn(1)=F_1; 

Rn=[];  % An empy array for storing the population of foxes for each year
Rn(1)=200; % Initializing the population of foxes at the begining of year 1

alpha=0.5; beta=0.4; gamma=0.1; % function parameters that stays the same.

% We begin our iteration from year 2 to 3O becacuse we already have 
% information about year 1.

for i=2:length(y) 
    % Rewriting the dynamical model equations
    Fn(i)=Fn(i-1)-alpha*Fn(i-1)+beta*Rn(i-1); 
    Rn(i)=Rn(i-1)+gamma*Rn(i-1)-delta*Fn(i-1);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%