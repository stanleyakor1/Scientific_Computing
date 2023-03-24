#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan  8 08:42:56 2020

@author: aimsg
"""
#[s0+v0*t+0.5*a0*t**2+a0*t*(t-t1)]
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jan  8 08:42:56 2020

@author: aimsg
"""
#use package numpy and matplotlib
import numpy as np
import matplotlib.pyplot as plt

#computing the exact solution using labda function
ExactS = lambda x: x*(1+x)                 

#Variable definition
a = 0;b = 1
N = 100 #by freedom of choice, N=100
h = (b-a)/N
x = np.linspace(a,b,N+1)

#Calculating K1 and K2 as per the question definition
K1 = (x[1:N-1] + h/2) ** 2  
K2 = (x[2:N] - h/2) ** 2 
U = (x[1:N] + h/2)**2 + (x[1:N] - h/2)**2  #U is the elements in the diagonals.

#We sum together K1,K2 and the diagnonal matrix u 
A = np.diag(U) + np.diag(-K1,1) + np.diag(-K2,-1)  
'''
Consider the initial-boundary value problem with the uniform wind
'''
# Solving the system of equations. 
RHS = (h**2) * (-2 * x[1:N] - 6*(x[1:N]**2)) #RHS to represent the right hand side of the equation
RHS[-1] = (h**2) * (-2*x[N-1]-6*(x[N-1]*2)) + 2*((x[N-1]+h/2)**2)
solved= np.linalg.solve(A,RHS) #solS is the solution to the system of equations
Fsol = np.zeros(N+1) 
Fsol[-1] = 2
Fsol[1:-1] = solved
#plot of the exact solution
plt.plot(x,ExactS(x),'r',label="Exact")
#plotting
plt.plot(x,Fsol,'b--',label="Approx")
plt.legend()
plt.title("Graph of exact and approx solution")
plt.show()

##Second Question
mu = -0.8
N = 50
x = np.linspace(-2,3,N+1)
#initial condition
u0 = np.where(np.abs(x)<=1,1-x**2,0) 
DiagVal = np.diag(np.ones(N-1) * (1-mu)) #values at the diagonal
val = np.diag(np.ones(N-2) * mu,1) # values in the upper triangular matrix
MatrixN = DiagVal + val
plt.plot(x,u0,'r')
u0 = u0[1:-1]

#Plotting the graphs of the exact solution and the approximated
plot = np.zeros(N+1)
for i in range(21):
    RHS = u0 #RHS is the right hand side
    RHS[-1] -= mu*plot[N]
    u0 = np.linalg.solve(MatrixN,RHS)
    plot[1:-1] = u0
    plot[N] = plot[N-1]
    plt.plot(x,plot, 'violet')
plt.title("IVP using Backward-Forward scheme")
plt.show()