#!/usr/bin/env python
import roslib
import rospy
from std_msgs.msg import Int32
from cone_detector.msg import positionFromDetectRGB as pfdg

roslib.load_manifest('detect')
rospy.init_node('topic_publisher')
pub = rospy.Publisher('counter', pfdg)
rate = rospy.Rate(2)
count = 0
while not rospy.is_shutdown():
    p=pfdg()
    p.x=count
    p.y=count
    p.who=count%20
    pub.publish(p)
    count += 1
    rate.sleep()
