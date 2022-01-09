from numpy import arctan
from pylab import *
import warnings
import math
warnings.filterwarnings('ignore')

def f(t,y):
    '''
    求解的微分方程，
    '''
    return arctan(t+y)*math.exp(-(t**2+y**2)) 

def euler_forward(f,a=0,b=1,ya=1,h=0.1,verbose=True):
    '''向前欧拉法
    Args
    ----------
    f： callable function
        需要求解的函数
    a: float
        求解区间起始值
    b：float
        求解区间终止值
    ya：float
        起始条件，ya=y(a)
    h：float
        求解步长（区间[a,b]n等分）
    verbose：logical，default is True
        显示迭代结果
    
    Returns
    ----------
    res：list like
        返回向前欧拉发求解的结果
    '''
#     i = 0
    res = []
    xi = a 
    yi = ya
    j = 0
    x = []
    while xi<=b: # 在求解区间范围
        y = yi + h*f(xi,yi)
        if verbose:
            print('x[{}]:{:.2f}, y[{}]:{:.6f}'.format(j,xi,j,yi))
        res.append(y)
        xi, yi = xi+h, y
        x.append(xi)
        j=j+1
    
    return res,x


def improved_euler(f,a=0,b=1,ya=1,h=0.1,verbose=True):
    '''改进欧拉法
    Args
    ----------
    f： callable function
        需要求解的函数
    a: float
        求解区间起始值
    b：float
        求解区间终止值
    ya：float
        起始条件，ya=y(a)
    h：float
        求解步长（区间[a,b]n等分）
    verbose：logical，default is True
        显示迭代结果
    
    Returns
    ----------
    res：list like
        返回向前欧拉发求解的结果
    '''
    res = []
    xi = a 
    yi = ya
    j = 0
    x = []
    while xi <= b: # 在求解区间范围
        yp = yi + h*f(xi, yi)
        y = yi + h/2 * (f(xi, yi) + f(xi, yp))
        if verbose:
            print('x[{}]:{:.2f}, y[{}]:{:.6f}'.format(j,xi,j,yi))
        res.append(y)
        xi, yi = xi+h, y
        x.append(xi)
        j=j+1
    
    return res,x

def adams(f,a,b,ya,h):
    res = []
    xi = a 
    yi = ya
    j = 0
    x = []
    while xi <= b:
        x1 = xi + h
        k1 = f(xi, yi)
        k2 = f(xi+h/2, yi+h*k1/2)
        k3 = f(xi+h/2, yi+h*k2/2)
        k4 = f(x1, yi+h*k3)
        y1 = yi + h * (k1 + 2* k2 + 2 * k3 + k4) / 6
        print("%.2f, %.6f" %(x1, y1))
        res.append(y1)
        xi = x1
        yi = y1
        x.append(xi)
        j=j+1
    return res,x

res1,x1 = euler_forward(f,a=0,b=1,ya=1,h=0.3,verbose=True)
res2,x2 = improved_euler(f,a=0,b=1,ya=1,h=0.3,verbose=True)
res3,x3 = adams(f,a=0,b=1,ya=1,h=0.3)

plot1 = plt.plot(x1,res1,'b',label='euler')
plot2 = plt.plot(x2,res2,'g',label='improved_euler')
plot3 = plt.plot(x3,res3,'r',label='adams')

plt.xlabel('h')
plt.ylabel('y')
plt.legend(loc=4)  #指定legend的位置
plt.title('Differential equations h=0.3')
plt.show()