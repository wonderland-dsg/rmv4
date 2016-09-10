'''
import numpy as np
data.x=454.667
data.y=75.566
datas[0]=0XAA
t=data.x
datas[1]=(t>>8)
datas[2]=(t&0X00FF)
t=data.y
datas[3]=(t>>8)
datas[4]=(t&0X00FF)
datas=np.array(datas, dtype=np.int8)'''
import time
import cv2

video=cv2.VideoCapture(0)

time.sleep(0.25)
success,frame=video.read()
while success:
    cv2.imshow("goper",frame)
    a=cv2.waitKey(30)
    if a==ord('q'):
        break
    success,frame=video.read()
cv2.destoryAllWindows()
video.release()