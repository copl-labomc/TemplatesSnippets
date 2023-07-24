from math import erfc
import numpy as np
import matplotlib.pyplot as plt

x= np.linspace(0,100,1000)
a= np.zeros(1000)
b=2
for i in range(len(x)):
    a[i]= erfc((-x[i]+10)/0.001)


plt.plot(x,a)
plt.show()