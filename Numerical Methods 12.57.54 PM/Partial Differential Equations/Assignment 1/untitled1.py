import matplotlib.pyplot as plt
import math 
import numpy as np

#create an empty array
#----------------------------------
f_x=np.zeros(600)
x=np.zeros(600)

count=-3
increase=0 #define the starting number of P
# generate a number p and calculate s(p) and store p, s(p) in an array
#---------------------------------------------------------------
#-----------------------------------------------------------------
while (count<=3):
    count+=0.01
    if count>=-1 and count <0:
        f_x[increase:increase+1]=-1
        x[increase:increase+1]=count*np.pi
    elif count>=0 and count <1:
        f_x[increase:increase + 1] = 1
        x[increase:increase + 1] = count * np.pi
    elif count <-1 or count >=1:
        f_x[increase:increase + 1] = 0
        x[increase:increase + 1] = count * np.pi
    
    increase+=1
# generate a graphical sketch for all the paramemters
#---------------------------------------------------------------
#-----------------------------------------------------------------
fig, axs = plt.subplots()
axs.scatter(x,f_x, color='red')
axs.set_xlabel('x')
axs.set_ylabel('f(x)')

plt.show()