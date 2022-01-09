import matplotlib.pyplot as plt
import numpy as np

x = np.array([0,3,5,7,9,11,12,13,14,15])
y = np.array([0,1.2,1.7,2.0,2.1,2.0,1.8,1.2,1.0,1.6])

z1 = np.polyfit(x,y,3) #用3次多项式拟合  返回三次多项式系数
z2 = np.polyfit(x,y,6)
z3 = np.polyfit(x,y,8)
z4 = np.polyfit(x,y,9)
z5 = np.polyfit(x,y,12)

p1= np.poly1d(z1)
p2= np.poly1d(z2)
p3= np.poly1d(z3)
p4= np.poly1d(z4)
p5= np.poly1d(z5)

print(p1) #在屏幕上打印拟合多项式
print(p2) #在屏幕上打印拟合多项式
print(p3) #在屏幕上打印拟合多项式
print(p4) #在屏幕上打印拟合多项式
print(p5) #在屏幕上打印拟合多项式

yvals1 = p1(x)#也可以使用yvals=np.polyval(z1,x)
yvals2 = p2(x)
yvals3 = p3(x)
yvals4 = p4(x)
yvals5 = p5(x)

plot0 = plt.plot(x,y,'*',label='original values')
plot1 = plt.plot(x,yvals1,'g',label='3 polyfit values')
plot2 = plt.plot(x,yvals2,'g',label='6 polyfit values')
plot3 = plt.plot(x,yvals3,'g',label='8 polyfit values')
plot4 = plt.plot(x,yvals4,'b',label='9 polyfit values')
plot5 = plt.plot(x,yvals5,'r',label='12 polyfit values')

plt.xlabel('X')
plt.ylabel('Y')
plt.legend(loc=4)  #指定legend的位置
plt.title('polyfit')
plt.show()


