# -*- coding: utf-8 -*-
import numpy as np
from scipy.optimize import leastsq
import pylab as pl

def func(x, p):
    """
    数据拟合所用的函数: A*sin(2*pi*k*x + theta)
    """
    A, k, theta = p
    return A*np.sin(2*np.pi*k*x+theta)

def residuals(p, y, x):
    """
    实验数据x, y和拟合函数之间的差，p为拟合需要找到的系数
    """
    return y - func(x, p)

def func2(x,p):
     a, b, c,d = p
     return a*x*x*x+b*x*x+c*x+d

def residuals2(p, y, x):
    """
    实验数据x, y和拟合函数之间的差，p为拟合需要找到的系数
    """
    return y - func2(x, p)

#x = np.linspace(0, -2*np.pi, 4)
#a, b, c,d = 1,10, 0.34, 3 # 真实数据的函数参数
#y0 = func2(x, [a, b, c,d]) # 真实数据
#y1 = y0 + 2 * np.random.randn(len(x)) # 加入噪声之后的实验数据

p0 = [0, 0, 0,1] # 第一次猜测的函数拟合参数



# 调用leastsq进行数据拟合
# residuals为计算误差的函数
# p0为拟合参数的初始值
# args为需要拟合的实验数据
#y1=[1,2,3,4,5,6,7]
#x=[1,2,3,4,5,6,7]
y1=np.array([1235,1700,2215,2940,3930,4960,5525,6410])
x=np.array([950,1270,1500,1860,2100,2350,2530,2790])

plsq = leastsq(residuals2, p0, args=(y1, x))


#print u"true acc:", [a, b, c,d]
print u"result acc", plsq[0] # 实验数据拟合后的参数
x_t=np.linspace(800,3000,220)
#y_t=func2(x_t,plsq[0])
pl.show()
pl.plot(x, y1, label=u"source")
#pl.plot(x, y_t, label=u"target")
pl.plot(x, func2(x, plsq[0]), label=u"result")
pl.legend()
pl.show()