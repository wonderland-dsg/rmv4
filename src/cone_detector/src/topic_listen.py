#!/usr/bin/env python
import roslib
roslib.load_manifest('cone_detector')
import rospy
from cone_detector.msg import positionFromDetectRGB as pfdg

def callback(data):
    rospy.loginfo(rospy.get_caller_id()+"I heard (%d,%f,%f,%f,%d)",data.who,data.x,data.y,data.z,data.flag)

def listener():
    rospy.init_node('topic_listen',anonymous=True)
    rospy.Subscriber('positionOfRGB',pfdg,callback)
    rospy.spin()

if __name__ =='__main__':
    listener()
