clc
clear all
 a=[];b=[];a(1)=1;b(1)=1/sqrt(2);j=[];j(1)=1;t=[];t(1)=1/4;eps=1e-14;pi_approx=[];
counter=0;
while abs(a(end)-b(end))>=eps
    counter=counter+1;
    y=a(end);
    a(end+1)=(a(end)+b(end))/2;
    b(end+1)=sqrt(b(end)*y);
    t(end+1)=t(end)-j(end)*(a(end)-y)^2;
    j(end+1)=2*j(end);
    pi_approx(counter)=(a(end)^2)/t(end);
end

error=abs(pi-pi_approx);

%%%%%%%%%%%%%%%%%%% Table (first case)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Error= error';
Approximate = pi_approx';

Result1 = table(Error, Approximate);


Result1






%%%%%%%%CASE TWO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
digits(110)
a=[];b=[];a(1)=1;b(1)=1/sqrt(2);j=[];j(1)=1;t=[];t(1)=1/4;eps=1e-14;pi_approx=[];
a_vpa=vpa(a);b_vpa=vpa(b);j_vpa=vpa(j);t_vpa=vpa(t);pi_vpa=vpa(pi_approx);
counter2=0;
while abs(a_vpa(end)-b_vpa(end))>=1e-100
    counter2=counter2+1;
    y=a_vpa(end);
    a_vpa(end+1)=(a_vpa(end)+b_vpa(end))/2;
    b_vpa(end+1)=sqrt(b_vpa(end)*y);
    t_vpa(end+1)=t_vpa(end)-j_vpa(end)*(a_vpa(end)-y)^2;
    j_vpa(end+1)=2*j_vpa(end);
    pi_vpa(counter2)=(a_vpa(end)^2)/t_vpa(end);
end

exact=vpa(pi);

error_vpa=abs(exact-pi_vpa);



%%%%%%%%%% Table (second case) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Error2= error_vpa';
Approximate2 = pi_vpa';

Result2 = table(Error2, Approximate2);

Result2