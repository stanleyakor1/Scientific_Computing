clc
close all
clear all
%plotlagrange1(linspace(-1,1,50))
x=linspace(-1,1,50);
f=@(x)(1./(1+50*(x).^2));

% function plotlagrange1( x ) 
% plot lagrange basis functions 
%figure(1); clf; hold on; 
n = length(x)-1; 
xx = linspace( min(x), max(x), 50); 
y=0;
%fx=cos((pi/2).*xx);
fx=f(xx);
%fx=1./(1+50*(x).^2);
for j = 1:n
    L = ones( size(xx) ); 
    for k = 1:n 
        if (k == j),continue; end 
        L = L .* (xx- x(k))./(x(j)- x(k)); 
    end 
%     plot( xx, L, 'LineWidth', 1.5 ), hold on
%     text( x(j), 1.1, sprintf( 'L_%d(x)', j ) ); 
    
    y=y+fx(j).*L;
end 
plot(xx,y,'k--'), hold on
plot(xx,fx,'b')
plot(x,f(x),'o')
% plot( x, ones( size(x) ), '.b', 'MarkerSize', 18 ); 
% plot( x, zeros( size(x) ), 'sr' ); 
% axis( [min(x)-0.2, max(x)+0.2, ceil(min(L))-1.0, floor(max(L))+0.5] ); 
% title('Lagrange Basis Functions'); 
% return
% % end
% plot(xx,fx), hold on
% plot(xx,y)
% legend('T','F')
% 

% error=(abs(y-fx)).^2
% plot(xx,error)

