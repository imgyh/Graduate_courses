import matplotlib; matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import numpy as np
import math
from math import log


def Norm(r):
    sum = 0
    for i in r:
        sum += i*i
    norm_r = '%.15f' % math.sqrt(sum)
    print('norm',norm_r)
    return norm_r

def Gradient_Descent(ri,di,A,xi,b):
    print('---------------------------------------------------------')
    print('d',di)
    print('r',ri)
    global d
    d = ri # no need beta
    print('d',d)
    global a
    a = np.dot(ri.T,d) / np.dot(d.T,np.dot(A,d))
    print('a',a)
    global x
    x = xi + a*d
    print('x',x)
    global r
    r = b - np.dot(A,x)
    print('r',r)
    # 计算r的2-范数
    return Norm(r)


if __name__ == '__main__':
    # 生成矩阵A
    A = 1. / (np.arange(1, 17) + np.arange(0, 16)[:, np.newaxis])
    print('A',A)
    # 生成矩阵b
    b = np.array([2877/851,3491/1431,816/409,2035/1187,2155/1423,538/395,1587/1279,573/502,947/895,1669/1691,1589/1717,414/475,337/409,905/1158,1272/1711,173/244])
    print('b',b)
    # 设置初始值
    global x
    x = np.zeros(16)
    # 第一次迭代
    global r
    r = b - np.dot(A,x)
    print('r',r)
    global d
    d = r
    global a
    a = np.dot(r.T,d) / np.dot(d.T,np.dot(A,d))
    print('a',a)
    x = x + a*d
    print('x',x)
    r = b - np.dot(A,x)
    print('r',r)
    global norm_r
    norm_r = Norm(r)
    log_norm = log(float(norm_r), 10)  # 画图 以10为底取对数
    list_norm = []  # 画图
    list_norm.append(log_norm)  # 画图 加入第一次计算的对数范数
    # 设置误差上限alpha
    alpha = 1e-4
    count = 1 # 迭代次数
    list_count = []  # 画图
    list_count.append(count)  # 画图 加入第一次迭代计数
    while float(norm_r) >= alpha:
        # 第2~N次迭代
        count += 1
        norm_r = Gradient_Descent(r,d,A,x,b)
        log_norm = log(float(norm_r), 10)  # 画图 以10为底取对数
        list_norm.append(log_norm)  # 画图 加入后续的对数范数
        list_count.append(count)  # 画图
        # print(norm_r)
        # print('r',r)
        # print('d',d)
        # print('x',x)
        print('x*',x)
        print('count',count)
    plt.plot(list_count, list_norm)
    plt.show()
