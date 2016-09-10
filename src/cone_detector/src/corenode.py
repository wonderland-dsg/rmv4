#!/usr/bin/env python
import roslib
import math
import rospy
import numpy as np


from cone_detector.msg import positionFromDetectRGB as pfdg

def transtorm1(a,L,x): #ouput rad
    temp=math.tan((a/(180.0))*math.pi)
    return math.atan(temp*(x-L/2)/(L/2))

def transform2(r,beta,alpha):
    source_obj_x,source_obj_z,source_obj_y=r*np.cos(beta)*np.sin(alpha),r*np.cos(beta)*np.cos(alpha),r*np.sin(beta)
    print "camera position xyz: ",source_obj_x,source_obj_y,source_obj_z
    gembal_obj_x,gembal_obj_y,gembal_obj_z=source_obj_x+102.75,source_obj_y-289,source_obj_z+130.2
    gembal_x=np.arcsin(gembal_obj_x/(np.sqrt(gembal_obj_x**2+gembal_obj_z**2)))*180/np.pi
    gembal_y=np.arcsin(gembal_obj_y/(np.sqrt(gembal_obj_y**2+gembal_obj_z**2)))*180/np.pi
    return gembal_x,gembal_y

def positionCameraToGembal(a1,L1,x1,a2,L2,x2,r):
    alpha=transtorm1(a1,L1,x1)
    beta=transtorm1(a2,L2,x2)
    gx,gy=transform2(r,beta,alpha)
    gx,gy=gx+6,gy+21
    print "length:",
    print "position of camera:",alpha*180/np.pi,beta*180/np.pi
    print "poeition of gembal:",gx,gy
    return gx,gy

def image_filter(px):   #
    if 1920*0.15 <= px <= 1920*0.85:
        return True
    else:
        return False


class corenode:
    def __init__(self,pub):
        self.pub=pub
    def callback(self,data):
        
        p=pfdg()
        p.who=data.who
        #p.x=int(100*120*(data.x-960*0.5)/(1920.0*0.5))
        #p.y=int(100*100*(data.y-540*0.5)/(1080.0*0.5))
        #p.x=int(85*(data.x-960)/(1920.0))
        #p.x=transtorm1(42.63,1920,data.x)
        #p.y=int(53*(data.y-540)/(1080.0))
        #p.y=transtorm1(26.57,1080,data.y)

        #if image_filter(data.x) is not True:
        #    return

        p.x,p.y=positionCameraToGembal(41.68,1920,data.x,26.25,1080,data.y,data.z)

        #p.y=data.y
        p.z=data.z

        p.flag=p.flag
        self.pub.publish(p)
        rospy.loginfo(rospy.get_caller_id()+"coreNode heard (%d,P.x:%f,p.y:%f,%f,%d)",data.who,p.x,p.y,data.z,data.flag)

    def listener(self):
        rospy.Subscriber('positionOfRGB',pfdg,self.callback)
        rospy.spin()

if __name__ =='__main__':
    roslib.load_manifest('cone_detector')
    rospy.init_node('corenode',anonymous=True)
    pub = rospy.Publisher('positionOfGimbal', pfdg)
    core=corenode(pub)
    core.listener()
