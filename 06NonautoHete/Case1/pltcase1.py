import numpy as np
import matplotlib.pyplot as plt 
import proplot as ppt

plt.rcParams['font.family'] = 'Times New Roman'
plt.rcParams['xtick.labelsize'] = 16
plt.rcParams['ytick.labelsize'] = 16
lw = 2
ms = 0.25
ft = 18


le = np.loadtxt('lek_case1.csv',delimiter=',')
bif = np.loadtxt('bifk_case1.csv',delimiter=',')

ww = np.linspace(0,5,401)

fig,ax = plt.subplots(2,1,figsize=(6.5,4),constrained_layout=True,sharex=True)
ax[0].plot(ww,le[:,0],lw=lw,color='r',label='LE1')
ax[0].plot(ww,le[:,1],lw=lw,color='b',label='LE2')
ax[0].plot(ww,np.zeros(401),lw=lw,color='k')
ax[0].legend(loc='lower left',ncol=2,fontsize=ft,facecolor='None',edgecolor='None')
ax[1].plot(bif[:,0],bif[:,1],'.g',markersize=ms)
yl = np.array(['LEs','X'])
for i in range(2):
    ax[i].spines[:].set_linewidth(1.5)
    ax[i].set_xlim([0,5])
    ax[i].set_ylabel(yl[i],fontsize=ft)

ax[1].set_xlabel('k',fontsize=ft)
#plt.show()

fig.savefig('case1k.pdf')
fig.savefig('case1k.jpg',dpi=300)