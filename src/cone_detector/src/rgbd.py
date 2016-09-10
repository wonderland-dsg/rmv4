#!/usr/bin/env python
#coding: utf-8

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

global count
count_lock=threading.Semaphore(1)
class image_converter:

    def __init__(self):
    #三种清晰度，hd qhd sd，想获取不同的清晰度直接改下面的topic中的hd
        self.imagetopic = "/kinect2/qhd/image_color_rect"
        self.depthtopic = "/kinect2/qhd/image_depth_rect"
        self.bridge = CvBridge()
        self.image_color_sub = rospy.Subscriber(self.imagetopic, Image, self.image_callback)
        #self.image_depth_sub = rospy.Subscriber(self.depthtopic, Image, self.depth_callback)
        global count
        count=3000
        
        
    def image_callback(self, data):
        global count
        try:
            image_color = self.bridge.imgmsg_to_cv2(data, "bgr8")
            cv2.imshow("Image window", image_color)
            count_lock.acquire()
            #cv2.imwrite("/home/scuak/PycharmProjects/data/base_photo/"+str(count)+".jpg",image_color)
            print "/home/scuak/PycharmProjects/data/base_photo/"+str(count)+".jpg"
            count=count+1
            count_lock.release()
            cv2.waitKey(100)
        except CvBridgeError as e:
            print(e)

        #cv2.destroyWindow("Image window")
    
    def depth_callback(self, data):
        try:
            #depth_color = self.bridge.imgmsg_to_cv2(data, "16UC1")
            #cv2.imshow("Depth window", depth_color)
            cv2.waitKey(100)
        except CvBridgeError as e:
            print(e)

        cv2.destroyWindow("Depth window")


if __name__ == "__main__":
    print("reciving......")
    rospy.init_node('image_converter', anonymous=True)
    ic = image_converter()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()
    
        
        
