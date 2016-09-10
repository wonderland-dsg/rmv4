#!/usr/bin/env python

import roslib
roslib.load_manifest('kinect_test')
import rospy
import cv2
import mxnet as mx
from cone_detector.msg import positionFromDetectRGB as pfdg
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import threading
from Queue import Queue
import predictPosition as pp
import pylab as pl


predict_lock=threading.Semaphore(1)
count_lock=threading.Semaphore(1)
depth_lock=threading.Semaphore(1)

detectOrNot=True
finishDetect=True
res=None
count=0
sp=None

def draw(p):
    global count

    while 1:

        if count>=10:
            print "draw..."
            x,y_s,y_r=p.drawData()
            pl.plot(x, y_s, label=u"x_s")
            #pl.plot(x, y1, label=u"target")
            pl.plot(x, y_r, label=u"x_result")
            pl.legend()
            pl.show()
            count_lock.acquire()
            count=0
            count_lock.release()


def subDetect(img,model):
    #cv2.imshow("before resize",img)
    #cv2.waitKey(0)
    img = cv2.resize(img, (40,30))
    #cv2.imshow("after resize",img)
    # cv2.waitKey(0)
    img = img.astype(np.float32).reshape((1, 1200))/255.0
    #start=time.clock()
    prob=model.predict(img)
    #finish=time.clock()
    #print "predict time",(finish-start)/10000
    #print prob[0].argmax()
    if prob[0].argmax() == 1:
        return True
    else:
        return False

def detectAndDraw(model,cascade,sourceImg,scale,depthImg):
    #t=cv2.getTickCount()
    colors=[(0, 0, 255),
		    (0, 128, 255),
		    (0, 255, 255),
		    (0, 255, 0),
		    (255, 128, 0),
		    (255, 255, 0),
		    (255, 0, 0),
		    (255, 0, 255)]
    gray=cv2.cvtColor(sourceImg,cv2.COLOR_BGR2GRAY)
    #print "gray:",gray.shape
    rows,cols = gray.shape[:2]
    smallImg=cv2.resize(gray,
                         (int(cols/scale),int(rows/scale))
                         )
    #print "smallImg ",smallImg.shape
    cv2.equalizeHist(smallImg,smallImg)
    #|cv.CV_HAAR_SCALE_IMAGE,
    #t1=cv2.getTickCount()
    objects=cascade.detectMultiScale(smallImg,
                                     1.6,3,0,
                                     (10,10),(120,120))
    #t1=cv2.getTickCount()-t1
    #print "~~~~~~~~~~~~~~~~cascade mode detection time = \n", t1 / cv2.getTickFrequency()*1000.0," ms"
    i=0
    point_x=[]

    point_y=[]
    point_z=[]
    mymax=None
    max_sum=-1
    #img=sourceImg
    t2=cv2.getTickCount()
    for object in objects:
        i=i+1
        x,y,w,h=object
        s_x,s_y,s_w,s_h=int(x*scale),int(y*scale),int((w)*scale),int((h)*scale)
        color=colors[i%8]
        roi_smallImg = sourceImg[s_y:s_y+s_h, s_x:s_x+s_w]

        #cv2.rectangle(sourceImg,(s_x,s_y),
                      #(s_x+s_w,s_y+s_h) ,(0,0,0) , 4, 8)

        b=float(np.sum(roi_smallImg[:,:,2]))#red
        a=float(np.sum(roi_smallImg[:,:,0]))#blue

        if (b-a)>max_sum:
            mymax=[s_x,s_y,s_w,s_h]
            max_sum=b-a

        '''if subDetect(roi_smallImg,model):
            obj_x,obj_y=int(x*scale),int(y*scale)
            obj_w,obj_h=int(w*scale),int(h*scale)
            cv2.rectangle(sourceImg,(obj_x,obj_y),
                      (obj_x+obj_w,obj_y+obj_h),color , 1, 8)
            ox=int((x+w*0.5)*scale)
            oy=int((y+h*0.5)*scale)
            oz=np.average(depthImg[obj_x:obj_x+obj_w,obj_y:obj_y+obj_h])
            #print "color shape:",sourceImg.shape," depth shape:",depthImg.shape," oz:",oz
            point_z.append(oz)
            point_x.append(ox)
            point_y.append(oy)
            #print "color:",sourceImg.shape
            #print "depth:",depthImg.shape
            #ox=int(ox*depthImg.shape[0]/sourceImg.shape[0])
            #oy=int(oy*depthImg.shape[1]/sourceImg.shape[1])
            #point_z.append(depthImg[oy][ox])'''
    if mymax!=None and mymax>0:
        x,y,w,h=mymax
        color=colors[i%8]
        ox=x
        oy=y
        print "a-b",max_sum
        point_x.append(ox)
        point_y.append(oy)
        oz=np.average(depthImg[x:x+w,y:y+h])
        point_z.append(oz)
        cv2.rectangle(sourceImg,(x,y),
            (x+w, y+h),(255,255,255) , 4, 8)
    #t2=cv2.getTickCount()-t2
    #print "----------mxnet mode detection time = \n", t2 / cv2.getTickFrequency()*1000.0," ms"
    #sourceImg=cv2.resize(sourceImg,(960,540))
    #t=cv2.getTickCount()-t
    #print "mode detection time = \n", t / cv2.getTickFrequency()*1000.0," ms"

    return sourceImg,point_x,point_y,point_z



class image_converter:



    def __init__(self):
        self.imagetopic = "/kinect2/hd/image_color_rect"
        self.depthtopic = "/kinect2/hd/image_depth_rect"
        self.bridge = CvBridge()
        self.image_color_sub = rospy.Subscriber(self.imagetopic, Image, self.image_callback)
        self.image_depth_sub = rospy.Subscriber(self.depthtopic, Image, self.depth_callback)
        self.cascade=cv2.CascadeClassifier("/home/scuak/rmv4/src/cone_detector/src/model/xml/xml.xml")
        self.prefix = "/home/scuak/rmv4/src/cone_detector/src/model/model_use_samples_2V2.0"
        self.num_round = 200
        self.model = mx.model.FeedForward.load(self.prefix, self.num_round, ctx=mx.cpu(), numpy_batch_size=1)
        #roslib.load_manifest('cone_detector')
	    #rospy.init_node('detectVideo2')
        self.pub = rospy.Publisher('positionOfRGB', pfdg)
        self.depth_color=None
        timeNow=cv2.getTickCount()/cv2.getTickFrequency()*1000.0
        self.predictPos=pp.predictPosition(timeNow)

        t1= threading.Thread(target=draw,args=(self,))
        t1.setDaemon(True)
        t1.start()
        global sp
        sp=threading.Timer(0.01,self.send_position,args=())
        #sp.start()

    def sub_send_position(self):
        p=pfdg()
        p.who=-1
        predict_lock.acquire()
        timeNow=cv2.getTickCount()/cv2.getTickFrequency()*1000.0
        tx,ty=self.predictPos.getPositionxy(timeNow)
        predict_lock.release()
        if tx is not None:
            tx=tx*1920
            ty=ty*1080
            if tx<0:
                tx=0
            if tx>1920 or tx==np.NaN:
                tx=1920
            if ty<0:
                ty=0
            if ty>1080 or ty==np.NaN:
                ty=1080
            p.x=tx
            p.y=ty
            p.z=-1
            p.flag=-1
            self.pub.publish(p)
            print "position to send:",tx,ty

    def send_position(self):
        self.sub_send_position()
        global sp
        sp=threading.Timer(0.01,self.send_position)
        sp.start()

    def detect(self,image_color):
        t=cv2.getTickCount()
        global finishDetect
        global res
        global count
        finishDetect=False
        try:
            scale=4.0
            tx=None
            ty=None
            depth_lock.acquire()
            res,x,y,z=detectAndDraw(self.model,self.cascade,image_color,scale,self.depth_color)
            depth_lock.release()
            res=cv2.resize(res,(480,270))
            cv2.imshow("res",res)
            cv2.waitKey(30)
            if len(x) is not 0:
                timeNow=cv2.getTickCount()/cv2.getTickFrequency()*1000.0
                '''
                predict_lock.acquire()
                tx,ty=self.predictPos.getPositionxy(timeNow)
                predict_lock.release()

                if tx is None:
                    tx=x[0]
                    ty=y[0]
                else:
                    tx=tx*1920
                    ty=ty*1080
                    if tx<0:
                        tx=0
                    if tx>1920 or tx==np.NaN:
                        tx=1920
                    if ty<0:
                        ty=0
                    if ty>1080 or ty==np.NaN:
                        ty=1080
                print "find objects:",len(x)
                numx=0
                numy=0
                count_=0
                for i in range(0,len(x),1):
                    if (abs(x[i]-tx)+abs(y[i]-ty))<200:
                        numx=numx+x[i]
                        numy=numy+y[i]
                        count_=count_+1

                if count_==0:
                    tx=x[0]
                    ty=y[0]
                else:
                    tx=numx/count_
                    ty=numy/count_
                timeNow=cv2.getTickCount()/cv2.getTickFrequency()*1000.0
                predict_lock.acquire()
                self.predictPos.insertSample([tx,ty,0,timeNow])
                predict_lock.release()
                count_lock.acquire()
                count=count+1
                count_lock.release()'''

                #print "send position to predict:",tx,ty,"   x[0], y[0]",x[0],y[0]
                p=pfdg()
                p.who=-1
                p.x=x[0]
                p.y=y[0]
                p.z=z[0]
                p.flag=-1
                self.pub.publish(p)
                print "send:",x[0],y[0],z[0]

            else:
                predict_lock.acquire()
                self.predictPos.insertSample([None,None,0,0])
                predict_lock.release()
            t=cv2.getTickCount()-t

            print "All detection time = \n ", t / cv2.getTickFrequency()*1000.0," ms"
            print "count:",count



        except CvBridgeError as e:
            print(e)
            res=None
        finishDetect=True


    def image_callback(self, data):
        global finishDetect
        global res

        try:
            image_color = self.bridge.imgmsg_to_cv2(data, "bgr8")
            if finishDetect:
                t= threading.Thread(target=self.detect,args=(image_color,))
                t.setDaemon(True)
                t.start()
            #else:
                #if res is not None:
                #    cv2.imshow("Result window", res)
                #    cv2.waitKey(30)
        except CvBridgeError as e:
            print(e)






    def drawData(self):
        return self.predictPos.getPositonPlot()

    
    def depth_callback(self, data):
        try:
            depth_lock.acquire()
            self.depth_color = self.bridge.imgmsg_to_cv2(data, "16UC1")
            depth_lock.release()
        except CvBridgeError as e:
            print(e)
        #color_lock.release()
        #cv2.imshow("Depth window", self.depth_color)
        #cv2.waitKey(30)
        '''
        if depth_lock.acquire():
            cv2.imshow("Depth window", self.depth_color)
            depth_lock.release()
            cv2.waitKey(30)'''




if __name__ == "__main__":
    print("reciving......")
    rospy.init_node('image_converter', anonymous=True)
    ic = image_converter()
    try:
        rospy.spin()

    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

