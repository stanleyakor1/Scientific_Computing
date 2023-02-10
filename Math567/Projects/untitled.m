% x=1:1:10; y=5:5:50;
% %sum(x(2:1:x(end)).*y(1:1:y(end)-1)-x(1:1:x(end)-1).*y(2:1:y(end)))
% for i=1:9
%     xiyi=x(i+1)*y(i); yixi=x(i)*y(i+1);
%     sub=xiyi-yixi;
%     subb(i)=sub;
% end
% subb


%MATH 569
close all
% clear all
% clc
% xdata=linspace(-1,1,2); fx=cos(pi/2.*xdata);
% m=size(x,2); L=ones(N,m);
% for l=1:N
%     x_l=x(l);
%     for i=1:N
%         x_i=x(i);
%         L(i,l)=1;
%         for j=1:N
%             x_j=x(j);
%             if (j~=i)
%                 L(i,:)=L(i,:).*((x -x_j)./(x_i-x_j));
%             end
%         end
%     end  
% end
% 
% %%%% Approximate function
% summ=zeros(1,N);
% for i=1:N
%      z=fx(i).*L(i,:); 
%      summ(i)=0+sum(z);
%     %summ(i)=summ(i)+sum(fx(i).*L(i,:));
% end
% % 
% plot(x,fx), hold on
% plot(x,summ)
% 
% error=(abs(summ-fx)).^2;
% plot(x,error)





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m=size(x,2);L=ones(m,m);
for i=1:length(x)
    for j=1:length(x)
       
            
        if i~=j
            L(i,:)=L(i,:).*((x-x(i))./(x(j)-x(i)));
        end
     
    end
end
% x=linspace(-1,1,64+1);
% m=length(x)-1;xx=linspace(-1,1,51);
% L=ones(m,length(x));y=0;
% fx=cos((pi/2).*x);
% %fx=1./(1+50*(x).^2);
% L=1;
% for k=1:m
%     for i=1:m
%         if (k~=i)
%             %L(k,:)=L(k,:).*((xx-x(i))./(x(k)-x(i)));
%             L=L.*((xx-x(i))./(x(k)-x(i)));
%         end
%     end
%     y=y+fx(i).*L;  %(k,:);
% end
% 
% % y=0;
% for i=1:m
%     y=y+fx(i).*L(i,:);
% end

%plot(x,fx), hold on
%plot(xx,y)
% error=(abs(y-fx)).^2;
% plot(xx,error)
% axis tight