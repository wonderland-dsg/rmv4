#!/usr/bin/env python

import serial
import threading
import numpy as np
import roslib
import rospy
import struct
from ctypes import * 
from cone_detector.msg import positionFromDetectRGB as pfdg

import Tkinter




class sendPsotionThread(threading.Thread):
    def __init__(self,port):
        threading.Thread.__init__(self)
        self.port=port
    def run(self):
        rospy.Subscriber('positionOfGimbal',pfdg,self.callback)
        rospy.spin()

    def callback(self,data):
        x=data.x
        y=data.y
        print "receive: ",x," ",y
        z=data.z
        datas=(c_ubyte*10)()
        #datas.append(0XAA)
        if x<-100:
            x=-100
        if x>100:
            x=100
        if y<-50:
            x=-50
        if x>50:
            x=50
        datas[0]=0xaa
        datas[1]=0xbb
        datas[2]=0xcc
        t=int((x+100)*100)
        datas[3]=t>>8
        datas[4]=t&0x00ff
        #datas.append(t>>8)
        #datas.append(t&0X00FF)
        t=int((y+50)*100)
        datas[5]=t>>8
        datas[6]=t&0x00ff
        datas[7]=0x01
        datas[8]=0x00
        datas[9]=0x00
        for i in range(3,8,1):
            datas[9]=(datas[9]+datas[i])&0x00ff
        #datas.append(t>>8)
        #datas.append(t&0X00FF)
        #datas=np.array(datas, dtype=np.int8)
        self.port.write(datas)
        #rospy.loginfo(rospy.get_caller_id()+"I heard (%d,%f,%f,%f,%d)",data.who,data.x,data.y,data.z,data.flag)
        #a=(int(datas[1])<<8|int(datas[2]))*0.01-100
        #rospy.loginfo("send data x:%d",a)

class readInfoThread(threading.Thread):
    def __init__(self,port):
        threading.Thread.__init__(self)
        self.port=port
    def readPosition(self):
        #
        try:
            r1=self.port.read()#need to change
            r2=self.port.read()
            r3=self.port.read()
            while 1:
                if r1==0xaa and r2==0xaa and r3==0xaa:
                    break
                r1=r2
                r2=r3
                r3=self.port.read()
            readbuff=self.port.read(16)
            return True,readbuff
        except:
            return False,None

    def run(self):
        pub = rospy.Publisher('inforFrominfintry', pfdg)
        while 1:
            buff=self.readPosition()
            pub.publish(buff)


if __name__ =='__main__':
    roslib.load_manifest('cone_detector')
    rospy.init_node('serial_node',anonymous=True)
    port = serial.Serial('/dev/ttyUSB0',115200)

    sendThread=sendPsotionThread(port)
    readThread=readInfoThread(port)
    sendThread.start()
    readThread.start()

