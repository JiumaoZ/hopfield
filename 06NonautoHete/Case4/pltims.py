import numpy as np
import matplotlib.pyplot as plt
from matplotlib.colors import TwoSlopeNorm

import warnings
warnings.filterwarnings("ignore")
plt.rcParams['font.family'] = 'Times New Roman'
plt.rcParams['xtick.labelsize'] = 16
plt.rcParams['ytick.labelsize'] = 16

cmp = plt.cm.hot
p1 = np.loadtxt('ka1.csv',delimiter=',')
p2 = np.loadtxt('kw1.csv',delimiter=',')
p3 = np.loadtxt('a1w1.csv',delimiter=',')
p4 = np.loadtxt('ka2.csv',delimiter=',')

N = 301
A1 = np.linspace(0.5,1.5,N)
w1 = np.linspace(0.5,2,N)
A2 = np.linspace(0.5,2.5,N)
w2 = np.linspace(0.5,2,N)
K = np.linspace(0,5,N)

nc = 0
n1 = TwoSlopeNorm(vmin=p1.min(),vcenter=nc,vmax=p1.max())
n2 = TwoSlopeNorm(vmin=p2.min(),vcenter=nc,vmax=p2.max())
n3 = TwoSlopeNorm(vmin=p3.min(),vcenter=nc,vmax=p3.max())
n4 = TwoSlopeNorm(vmin=p4.min(),vcenter=nc,vmax=p4.max())


fig,ax = plt.subplots(2,3,figsize=(12,8),constrained_layout=True)
c0 = ax[0,0].pcolormesh(K,A1,p1,cmap=cmp,norm=n1)
c1 = ax[0,1].pcolormesh(K,w1,p2,cmap=cmp,norm=n2)
c2 = ax[0,2].pcolormesh(A1,w1,p3,cmap=cmp,norm=n3)
c3 = ax[1,0].pcolormesh(K,A2,p4,cmap=cmp,norm=n4)


fig.colorbar(c0,ax=ax[0,0])
fig.colorbar(c1,ax=ax[0,1])
fig.colorbar(c2,ax=ax[0,2])
fig.colorbar(c3,ax=ax[1,0])
plt.show()

