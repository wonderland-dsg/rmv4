#!/usr/bin/env python

import roslib

roslib.load_manifest('kinect_test')
import sys
import rospy
import cv2
import cv
import numpy as np
import mxnet as mx
from cone_detector.msg import positionFromDetectRGB as pfdg
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError


def subDetect(img, model):
    # cv2.imshow("before resize",img)
    # cv2.waitKey(0)
    img = cv2.resize(img, (40, 30))
    # cv2.imshow("after resize",img)
    # cv2.waitKey(0)
    img = img.astype(np.float32).reshape((1, 1200)) / 255.0
    # start=time.clock()
    prob = model.predict(img)
    # finish=time.clock()
    # print "predict time",(finish-start)/10000
    # print prob[0].argmax()
    if prob[0].argmax() == 1:
        return True
    else:
        return False


def detectAndDraw(model, cascade, sourceImg, scale):
    t = cv2.getTickCount()
    colors = [(0, 0, 255),
              (0, 128, 255),
              (0, 255, 255),
              (0, 255, 0),
              (255, 128, 0),
              (255, 255, 0),
              (255, 0, 0),
              (255, 0, 255)]
    lower=np.array([0,0,100])
    upper=np.array([50,50,255])
    tempImg=cv2.inRange(sourceImg,lower,upper)
    point_x = []
    point_y = []
    '''
    cv2.imshow("binary", tempImg)
    cv2.waitKey(10)
    e = cv2.getStructuringElement(cv2.MORPH_RECT, (5, 5))
    tempImg = cv2.morphologyEx(tempImg, cv2.MORPH_OPEN, e)
    tempImg = cv2.morphologyEx(tempImg, cv2.MORPH_CLOSE, e)
    (objects, _) = cv2.findContours(tempImg, cv.CV_RETR_TREE, cv.CV_CHAIN_APPROX_SIMPLE)
    i = 0

    # img=sourceImg
    for object in objects:
        peri = cv2.arcLength(object, True)
        approx = cv2.approxPolyDP(object, 0.02 * peri, True)
        if (len(approx) == 4):
            screencut = approx
            p = sum(approx) / 4.0
            point_x.append(p[0])
            point_y.append(p[1])
            cv2.drawContours(sourceImg, [screencut], -1, (0, 255, 0), 3)
    '''

    sourceImg = cv2.resize(sourceImg, (960, 540))
    cv2.imshow("result",sourceImg)
    cv2.waitKey(20)
    t = cv2.getTickCount() - t
    print "detection time = \n", t / cv2.getTickFrequency() * 1000.0, " ms"

    return sourceImg, point_x, point_y


class image_converter:
    def __init__(self):
        self.imagetopic = "/kinect2/qhd/image_color_rect"
        self.depthtopic = "/kinect2/qhd/image_depth_rect"
        self.bridge = CvBridge()
        self.image_color_sub = rospy.Subscriber(self.imagetopic, Image, self.image_callback)
        self.image_depth_sub = rospy.Subscriber(self.depthtopic, Image, self.depth_callback)
        self.cascade = cv2.CascadeClassifier("/home/huanghe/rmv4/src/cone_detector/src/model/xml/xml.xml")
        self.prefix = "/home/huanghe/rmv4/src/cone_detector/src/model/model_use_samples_2V2.0"
        self.num_round = 200
        self.model = mx.model.FeedForward.load(self.prefix, self.num_round, ctx=mx.cpu(), numpy_batch_size=1)
        # roslib.load_manifest('cone_detector')
        # rospy.init_node('detectVideo2')
        self.pub = rospy.Publisher('positionOfRGB', pfdg)

    def image_callback(self, data):
        try:
            image_color = self.bridge.imgmsg_to_cv2(data, "bgr8")
            scale = 1.5
            res, x, y = detectAndDraw(self.model, self.cascade, image_color, scale)
            cv2.imshow("result", res)
            for i in range(0, len(x)):
                px = x[i]
                py = y[i]
                p = pfdg()
                p.who = -1
                p.x = px
                p.y = py
                p.z = -1
                p.flag = -1
                #self.pub.publish(p)
        except CvBridgeError as e:
            print(e)
        cv2.imshow("Image window", image_color)
        cv2.waitKey(20)

    def depth_callback(self, data):
        try:
            depth_color = self.bridge.imgmsg_to_cv2(data, "16UC1")
        except CvBridgeError as e:
            print(e)
        cv2.imshow("Depth window", depth_color)
        cv2.waitKey(20)


if __name__ == "__main__":
    print("reciving......")
    rospy.init_node('image_converter', anonymous=True)
    ic = image_converter()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()
