clc
clear all
close all
warning('off')
figure, hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We define a function Mass_of_drugs which takes in the start time (a),   %
% the end time (b), the time step (h), an arbitrary prescribed dose (d)   %
% and returns the mass of drug (M) in the body at each time step.         %
%                                                                         %
%                                                                         %  
%                                                                         %      
% Two parameters A and B obtained by implementing the implicit trapezoid  %
% rule on the differential equation are introduced in the code.        %
%                                                                         %
% A=(1-0.5*k*h)                                                           %
% B=(1+0.5*k*h)                                                           %
%                                                                         %
% Where A and B are the coefficients of M(i)  and M(i+1) respectively.    %
%                                                                         %
% Here k is a constant and h is the step size.                            %
%                                                                         %
%  
% 
% We have used h=1/24. The choice of h is critical in our 
% numerical scheme because if h is too big, the approximations will be
% bad. However, if h is too small, then we shall have many data points
% ; thus, our solution will be too close to the exact. More so, due to the 
% stability of the trapezoidal rule, we do not need h to be too small. 
% Setting h=1/24 gives the total amount of drugs in the body every hour.
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











for j=1:5 % prescribed dose [1 2 3 4 5]

    % Setting up an array for all the days being considered (Two weeks)
    T=0:1:14;
    
    n=length(T); k=5;
   


    % An array for storing the residuals. 
    % We initialise our array as 0 because for the first day there is no
    % residual.
    R(1)=0;

    % Colour scheme for the plots %
    colour= {'r','b','k','c','m'};  
    
    for i=1:n-1
        legnd=[];
        
        h=1/24;
        % setting a smaller time step for each day
        a=T(i); b=T(i+1);

        
        M_nt=j+R(end); % drug in the body during the ith day
        
        % Applying the mass function defined below

        [M,t]=Mass_of_drug(a,b,h,k,M_nt);

        % Here we update the residue
        R(end+1)=M(end);

       % Plottings and legend manipulation %
        hsg=plot(t,M,colour{j},'LineWidth',2);
        legnd(end+1)=hsg;
    end
    % The residuals from a particular dose is cleared, so that for a new 
    %  prescribed dose, a new residual array starting with zero is created.
    clear R;

    % Setting the legend %
    l={'d = 1', 'd = 2', 'd = 3', 'd = 4', 'd = 5'};
    LEGND(j)=legnd;
    legend(LEGND,l,'Orientation','horizontal',Location="southoutside")
    xlabel('t')
    ylabel('M_T(t)')
    title('Mass of drug in the body per time')

    
end

%%%%%%%%%%%% Total Mass function %%%%%%%%%%%%%%%%%%%%%%%%%%%

function [M,t]=Mass_of_drug(a,b,h,k,d)
t=a:h:b;
N=length(t);
M=zeros(1,N);
M(1)=d;
A=(1-0.5*k*h);
B=(1+0.5*k*h);
for i=1:N-1
    M(i+1)=(A/B)*M(i);
end
end


