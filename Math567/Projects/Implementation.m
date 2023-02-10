clc; close all; clear all;


%%%%%%%%%%% User's input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dx=input("Enter the spatial step size: ");

h=input("Enter the temporal step size: ");
 
   

[U,E,Error,Max_error,x]=Upwind(dx,h);




%%%%%%%%%%%%%% Plot generation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(2,1,1)
plot(U(:,find(x==0.5)),'k',LineWidth=2), hold on
plot(U(:,find(x==1.0)),'r',LineWidth=2)
legend('U(t,0.5)','U(t,1)',Location='best')
xlabel('t')
ylabel('U(t,x)')
title(['Approximate solution using dx = ',num2str(dx), ' and h = ',num2str(h)])
axis tight

subplot(2,1,2)
plot(Error(:,find(x==0.5)),'k',LineWidth=2), hold on
plot(Error(:,find(x==1.0)),'r',LineWidth=2)
legend('Error(t,0.5)','Error(t,1)',Location='best')
title(['Absolute error in the scheme using dx = ',num2str(dx), ' and h = ',num2str(h)])
xlabel('t')
ylabel('Error(t,x)')
axis tight





