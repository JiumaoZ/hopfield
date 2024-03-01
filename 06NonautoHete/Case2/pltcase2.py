import numpy as np
import matplotlib.pyplot as plt 
import proplot as ppt

plt.rcParams['font.family'] = 'Times New Roman'
plt.rcParams['xtick.labelsize'] = 16
plt.rcParams['ytick.labelsize'] = 16
lw = 2
ms = 0.25
ft = 18

lea = np.loadtxt('lea_case2.csv',delimiter=',')
bifa = np.loadtxt('bifa_case2.csv',delimiter=',')
lew = np.loadtxt('lew_case2.csv',delimiter=',')
bifw = np.loadtxt('bifw_case2.csv',delimiter=',')
wa = np.linspace(0,1.5,401)

fig,ax = plt.subplots(2,2,figsize=(12,4),constrained_layout=True,sharex='col')
ax[0][0].plot(wa,lea[:,0],lw=lw,color='r',label='LE1')
ax[0][0].plot(wa,lea[:,1],lw=lw,color='b',label='LE2')
ax[0][0].plot(wa,np.zeros(401),lw=lw,color='k')
ax[0][0].legend(loc='lower left',ncol=2,fontsize=ft,facecolor='None',edgecolor='None')
ax[1][0].plot(bifa[:,0],bifa[:,1],'.g',markersize=ms)
yl = np.array(['LEs','X'])
for i in range(2):
    ax[i][0].spines[:].set_linewidth(1.5)
    ax[i][0].set_xlim([0.5,1.5])
    ax[i][0].set_ylabel(yl[i],fontsize=ft)

ax[1][0].set_xlabel(r'$A_1$'+'\n (a)',fontsize=ft)


ww = np.linspace(0,2,401)
ax[0][1].plot(ww,lew[:,0],lw=lw,color='r',label='LE1')
ax[0][1].plot(ww,lew[:,1],lw=lw,color='b',label='LE2')
ax[0][1].plot(ww,np.zeros(401),lw=lw,color='k')
ax[0][1].legend(loc='lower left',ncol=2,fontsize=ft,facecolor='None',edgecolor='None')
ax[1][1].plot(bifw[:,0],bifw[:,1],'.g',markersize=ms)
yl = np.array(['LEs','X'])
for i in range(2):
    ax[i][1].spines[:].set_linewidth(1.5)
    ax[i][1].set_xlim([0.5,2])
    #ax[i][1].set_ylabel(yl[i],fontsize=ft)

ax[1][1].set_xlabel(r'$w_1$'+'\n (b)',fontsize=ft)

#plt.show()
fig.savefig('case2lebif.pdf')
fig.savefig('case2lebif.jpg',dpi=300)
