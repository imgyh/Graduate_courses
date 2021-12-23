import numpy as np

def Hilbert(n):
    sq = np.zeros((n, n))
    for i in range(n):
        for j in range(n):
            sq[i][j] = 1 / (i + j + 1)
    return sq

# Gauss-Seidel法
def GaussSeidel(x0, A, B):
    # x0 = np.zeros(A.shape[1])
    x = np.zeros(A.shape[1])
    cnt = 0
    while True:
        for i in range(A.shape[1]):
            temp = 0
            temps = x0.copy()
            for j in range(A.shape[1]):
                if i != j:
                    temp += x0[j] * A[i][j]
            x[i] = (B[i] - temp) / A[i][i]
            x0[i] = x[i].copy()
        Temp = max(abs(x - temps))
        cnt += 1
        if Temp < TOL:
            print('最终迭代方程根为', x)
            return None
        else:
            print('第', cnt, '次迭代方程根为', x)
            x0 = x.copy()

# 共轭梯度法
def cg(x0, A, b):
    r0 = np.dot(A, x0) - b
    p0 = -r0
    rk = r0
    pk = p0
    xk = x0
    t = 0  # 记录迭代次数
    while np.linalg.norm(rk) >= TOL:
        rr = np.dot(rk.T, rk)
        ak = rr / np.dot(np.dot(pk.T, A), pk)
        xk = xk + ak * pk
        rk = rk + ak * np.dot(A, pk)
        bk = np.dot(rk.T, rk) / rr
        pk = -rk + bk * pk
        t += 1
        print('第', t, '次迭代方程根为', xk)

if __name__ == '__main__':
    # 方程阶数
    n = 16
    # TOL为迭代误差
    TOL = 1e-4
    # 方程系数矩阵为A 阶数为 A.shape[1]
    A = Hilbert(n)
    # 方程右边的列向量为B
    B = np.array(
        [2877 / 851, 3491 / 1431, 816 / 409, 2035 / 1187, 2155 / 1423, 538 / 395, 1587 / 1279, 573 / 502, 947 / 895,
         1669 / 1691, 1589 / 1717, 414 / 475, 337 / 409, 905 / 1158, 1272 / 1711, 173 / 244])
    # 初始值
    x0 = np.zeros(A.shape[1])

    print('Gauss-Seidel法结果:')
    GaussSeidel(x0,A,B)

    print('共轭梯度法结果:')
    cg(x0,A,B)
