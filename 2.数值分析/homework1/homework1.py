from sympy import *
import numpy as np

x=symbols('x')
y=symbols('y')
f=sin(x*x+y*y)*exp(-0.1*(x*x+y*y+x*y+2*x))

# 求一阶导
f1=diff(f,x)
f2=diff(f,y)
# 求二阶导
f11=diff(f,x,2)
f12=diff(f1,y)
f21=diff(f2,x)
f22=diff(f,y,2)

# Hessian矩阵的逆中的各个元素
a,b,c,d=[x/(f11*f22-f12*f21) for x in [f22,-f12,-f21,f11]]

# 初值
F0 = np.array([[-0.5],[0]])
er=1
k=0
while er>1e-16:
    # 将值代入
    a1,b1,c1,d1=a.evalf(subs ={'x':F0[0][0],'y':F0[1][0]}),b.evalf(subs ={'x':F0[0][0],'y':F0[1][0]}),c.evalf(subs ={'x':F0[0][0],'y':F0[1][0]}),d.evalf(subs ={'x':F0[0][0],'y':F0[1][0]})
    ff1,ff2=f1.evalf(subs ={'x':F0[0][0],'y':F0[1][0]}),f2.evalf(subs ={'x':F0[0][0],'y':F0[1][0]})
    # F一阶导数列向量,F_Hessian矩阵的逆
    F=np.array([[ff1],[ff2]],dtype = 'float')
    F_=np.array([[a1,b1],[c1,d1]],dtype = 'float')
    # 牛顿迭代法
    F=F0-np.dot(F_,F)
    k=k+1
    er=np.linalg.norm(F0-F,1)
    F0=F
    print('迭代次数',"{0:.0f}".format(k),', 方程根的近似值为x=',F0[0][0],', y=',F0[1][0])
    print('误差er=',er)