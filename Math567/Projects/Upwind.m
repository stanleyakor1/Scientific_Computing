
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Upwind Scheme %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [U,E,Error,Max_error,x]=Upwind(dx,h)

    
    x=0:dx:1;
    t=0:h:1;
    
    %%%% CFL Criterion for stability of the scheme %%%%
    %%%%            mu=a*(h/dx)<=1                 %%%%
    
    mu=(1+x).*(h/dx); % an array of mu values

    %%% mu is empty when dx is 0, length of mu is less than 2 when dx>1 %%%
    if any(mu>1) || isempty(mu) || length(mu)<2
        
        disp('It is not possible to solve the upwind scheme with the chosen step sizes.');

        error(" Try a different stepsize. Choose dx ∈ (0,1) and h < dx.");
        
    end
    
    %%% storage for the upwind scheme
    U=zeros(length(t),length(x));
    
    %%% storage for the exact solution
    E=zeros(length(t),length(x));

    % storage for the initial condition
    IC=zeros(length(x),1);

    % storage for the initial condition
    BC=zeros(length(t),1);
    
    %%%% Implementing the initial condition
    for i=1:length(IC)
        IC(i)=x(i)+1;
    end
    
    %%% initial condition
    U(1,:)=IC;
    
  

    %%%% Implementing the boundary condition
    for i=1:length(BC)
        BC(i)=exp(-t(i));
    end
    
    %%% Boundary condition
    U(:,1)=BC;
    
    
   % Solving for everywhere else %
    for n=1:size(U,1)-1
    
        for i=2:size(U,2)
    
            U(n+1,i)=U(n,i)-mu(i)*U(n,i)+mu(i)*U(n,i-1);
    
        end
    
    end
    
    %%%%% Exact Solution

    ft=@(x,t)(x+1)*(exp(-t));
    
    for i=1:size(E,1)
    
        for j=1:size(E,2)
    
            E(i,j)=ft(x(j),t(i));
    
        end
    
    end

    %%%% Error %%%%%%%

    Error= abs(U-E);
    Max_error=max(max(Error));

end