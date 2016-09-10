#!/usr/bin/env python


import roslib
roslib.load_manifest('kinect_test')
import rospy
import sys
import cv2
import threading
import numpy as np
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


global myImage

predict_lock=threading.Semaphore(1)

class image_converter:

    def __init__(self):

        self.imagetopic = "/kinect2/qhd/image_color_rect"
        self.depthtopic = "/kinect2/qhd/image_depth_rect"
        self.bridge = CvBridge()
        self.image_color_sub = rospy.Subscriber(self.imagetopic, Image, self.image_callback)
        self.image_depth_sub = rospy.Subscriber(self.depthtopic, Image, self.depth_callback)
        t1= threading.Thread(target=saveROI,args=())
        t1.setDaemon(True)
        t1.start()
        
        
    def image_callback(self, data):
        global  myImage
        try:
            image_color = self.bridge.imgmsg_to_cv2(data, "bgr8")
            predict_lock.acquire()
            myImage=image_color.copy()
            predict_lock.release()
            cv2.imshow("Image window", image_color)
            cv2.waitKey(30)
        except CvBridgeError as e:
            print(e)


    
    
    def depth_callback(self, data):
        try:
            depth_color = self.bridge.imgmsg_to_cv2(data, "16UC1")
            cv2.imshow("Depth window", depth_color)
            cv2.waitKey()
        except CvBridgeError as e:
            print(e)


def saveROI():
    global myImage
    global next
    global rec
    global name
    global drawBox
    global image
    drawBox=False
    name =1
    rec={"x":0,"y":0,"w":0,"h":0}
    while True:

        next=False
        try:
            predict_lock.acquire()
            image=myImage.copy()
            predict_lock.release()
        except:
            predict_lock.release()
            continue
        if image.shape[0]<=0:
            continue
        cv2.namedWindow("DrawBox!!!")
        cv2.setMouseCallback("DrawBox!!!",on_mouseHandle,image)
        while not next:

            #cv2.rectangle()
            cv2.imshow("DrawBox!!!",image)
            k=cv2.waitKey()
            print "you press is    ",int(k)
            if k==ord('n'):
                print "you press n"
                break
            if k==99:
                print "you press c"
                x=rec["x"]
                y=rec["y"]
                w=rec["w"]
                h=rec["h"]
                roiImg=image[y:y+h,x:x+w]
                print "save as: ",str(name)+"0_0_"+str(rec["w"])+str(rec["h"])+".jpg"
                cv2.imwrite(str(name)+"0_0_"+str(rec["w"])+str(rec["h"])+".jpg",roiImg)
                name=name+1
                break


def on_mouseHandle(event,x,y,flags,param):
    global rec
    global drawBox
    global image
    if event==cv2.EVENT_MOUSEMOVE:
        if(drawBox==True):
            rec["w"]=x-rec["x"]
            rec["h"]=y-rec["y"]
    elif event==cv2.EVENT_LBUTTONDOWN:
        drawBox=True
        rec["x"]=x
        rec["y"]=y
        rec["w"]=0
        rec["h"]=0
    elif event==cv2.EVENT_LBUTTONUP:
        drawBox=False
        if rec["w"]<0:
            rec["x"]=rec["x"]+rec["w"]
            rec["w"]=0-rec["w"]
        if rec["h"]<0:
            rec["y"]=rec["y"]+rec["y"]
            rec["h"]=0-rec["h"]
        cv2.rectangle(image,(rec["x"],rec["y"]),(rec["x"]+rec["w"],rec["y"]+rec["h"]),(255,255,0), 1, 8)




if __name__ == "__main__":
    print("reciving......")
    rospy.init_node('image_converter', anonymous=True)

    ic = image_converter()

    try:
        rospy.spin()

    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()
    
        
        
