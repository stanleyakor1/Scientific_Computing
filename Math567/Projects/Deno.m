clc
close all
clear all
% x=[2 4 5 ];
% y=[4 5 7 ];
% sum_xy=zeros(1,3);
% for i=1:length(x)
%     for j=1:length(y)
%         sum_xy(i)=sum_xy(i) +x(i)*y(j)
%     end
% end


x=linspace(-0.5,0.5,20);
%x=0.5;
N=16;
lippo=[];
for j=1:length(x)
    if -1<=x(j)<=1
        estimate=1;
        factorial=1;
        for i=1:N
            factorial=factorial*i;
            estimate=estimate+(x(j)^(i))/factorial;
        end
    
    lippo(j)=estimate;
    end
    if (x(j)<-1)
        estimate1=1;
        factorial1=1;
        for k=1:N
            factorial1=factorial1*k;
            estimate1=estimate1+(abs(x(j))^(k))/factorial1;
        end
    lippo(j)=estimate1^(-1);
    end

    if (x(j)>1)
        estimate2=1;
        factorial2=1;
        for l=1:N
            factorial2=factorial2*l;
            estimate2=estimate2+(x(j)^(l))/factorial2;
        end
      lippo(j)=1/estimate2^-1;
    end
end

% exact_x=exp(x);
% error=abs(exact_x-lippo);
% fprintf('Error = %.1e\n',error)
% x=-64;
% estimate=1;
% factorial=1;
% N=40;
% for i=1:N
%     factorial=factorial*i;
%     estimate=estimate+(abs(x)^(i))/factorial;
% end
% result=estimate^(-1)
% positive=[];
% positive=lippo(1:length(lippo)-3)
% positive=1./positive;
% 
% error2=exp(x(1:length(x)-3));
% fprintf('Error = %2.1e\n',error2)