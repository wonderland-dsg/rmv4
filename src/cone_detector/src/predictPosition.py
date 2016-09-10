import numpy as np
from scipy.optimize import leastsq
import pylab as pl

def subtract(v1,v2):
    v = list(map(lambda x: x[0]-x[1], zip(v2, v1)))
    return v

class predictPosition:
    def __init__(self,timebase):
        self.positionHistory=[[None for i in range(10)] for i in range(4)]
        self.preModel=[[0,0,1,0]for i in range(3)]
        self.numSamples=0
        self.loseObj=0
        self.timebase=timebase

    def doLoseObj(self):
        self.positionHistory=[[None for i in range(10)] for i in range(4)]
        self.preModel=[[0,0,1,0]for i in range(3)]
        self.numSamples=0

    def calculatePos(self,preModel,t):
        if type(preModel) is list:
            a,b,c,d=preModel
        elif type(preModel) is np.ndarray:
            #px=list(self.preModel)
            #px=list(px[0][0:4])
            try:
                px=preModel.tolist()
                #print "calculatePos:",px,t
                a,b,c,d=px
            except ValueError as e:
                px=list(self.preModel)
                #print "exception  calculatePos:",px
                px=list(px[0])
                #print "exception  calculatePos after:",px
                a,b,c,d=px

        if type(t) is np.ndarray:
            x=t
        else:
            x=np.array(t)
        return a*x*x*x+b*x*x+c*x+d
        #result=[a*x*x*x+b*x*x+c*x+d for x in t]
        #return result

    def residuals(self, preModel,y, x):
        temp=self.calculatePos(preModel,x)
        #print "residuals:",temp,y
        return y-temp
        #return subtract(y,temp)

    def getPositionxy(self,t):
        if self.numSamples<=3:
            return None,None
        else:
            t=t-self.timebase
            #t=[t]
            '''px=list(self.preModel[0])
            px=list(px[0][0:4])
            py=list(self.preModel[1])
            py=list(py[0][0:4])'''
            target_x=np.array(self.positionHistory[0],dtype=np.float32)
            t=np.array([t],dtype=np.float32)
            t=(t-target_x[0])/100.0#/target_x[-1]
            px=self.preModel[0][0:4]
            py=self.preModel[1][0:4]
            #print "preModel:",px,py
            return self.calculatePos(px,t),self.calculatePos(py,t)

    def subPredict(self,p0,target_y,target_x,size):
        target_y=np.array(target_y,dtype=np.float32)/size
        target_x=np.array(target_x,dtype=np.float32)
        target_x=(target_x-target_x[0])
        target_x=target_x/100.0#/target_x[-1]

        plsq = leastsq(self.residuals, p0, args=(target_y, target_x))
        plsq=plsq[0]
        return plsq

    def insertSample(self,p):
        x,y,z,t=p
        if x is None:
            self.loseObj=self.loseObj+1
            if self.loseObj>3:
                self.doLoseObj()
        else:
            self.loseObj=0
            if self.numSamples<10:
                self.positionHistory[0][self.numSamples]=t-self.timebase
                self.positionHistory[1][self.numSamples]=x
                self.positionHistory[2][self.numSamples]=y
                self.numSamples=self.numSamples+1
            else:
                i=0
                while i<9:
                    self.positionHistory[0][i]=self.positionHistory[0][i+1]
                    self.positionHistory[1][i]=self.positionHistory[1][i+1]
                    i=i+1
                self.positionHistory[0][i]=t-self.timebase
                self.positionHistory[1][i]=x
                self.positionHistory[2][i]=y
            if self.numSamples>=4:
                #print "acc pre model 0:",self.preModel[0][0:4]
                #print "data x:",self.positionHistory[1][0:self.numSamples]
                #print "time t:",self.positionHistory[0][0:self.numSamples]
                #self.preModel=[[0,0,1,0]for i in range(3)]
                #self.positionHistory[0]=[self.positionHistory[0][i]-self.positionHistory[0][0] for i in range(0,self.numSamples)]
                self.preModel[0]=self.subPredict(self.preModel[0][0:4],
                                             self.positionHistory[1][0:self.numSamples],
                                             self.positionHistory[0][0:self.numSamples],1920) #train x
                self.preModel[1]=self.subPredict(self.preModel[1][0:4],
                                             self.positionHistory[2][0:self.numSamples],
                                             self.positionHistory[0][0:self.numSamples],1080) #train y


    def drawPlot(self):
        x=np.array(self.positionHistory[0][0:self.numSamples])
        y_x_s=np.array(self.positionHistory[0][0:self.numSamples])
        pl.plot(x, y_x_s, label=u"x_s")
        #pl.plot(x, y1, label=u"target")
        pl.plot(x, self.calculatePos(self.preModel[0],x), label=u"x_result")
        pl.legend()
        pl.show()

    def getPositonPlot(self):
        x=np.array(self.positionHistory[0][0:self.numSamples],dtype=np.float32)
        y_x_s=np.array(self.positionHistory[1][0:self.numSamples])
        y_x_s=y_x_s/1920.0
        t=x
        t=(t-t[0])/100.0
        px=self.preModel[0][0:4]
        py=self.preModel[1][0:4]
        #print "preModel:",px,py
        y_x_r=self.calculatePos(px,t)
        return t,y_x_s,y_x_r

    def setTimebase(self,timeBase):
        self.timebase=timeBase
        self.positionHistory=[[None for i in range(10)] for i in range(4)]
        self.preModel=[[0,0,1,0]for i in range(3)]
        self.numSamples=0
        self.loseObj=0


