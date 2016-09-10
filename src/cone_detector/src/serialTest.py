import serial
from ctypes import *
import time
import struct
port = serial.Serial('/dev/ttyUSB0',115200)

datas=(c_ubyte*5)()
#datas.append(0XAA)
datas[0]=0xaa
x=129
y=0
step=1
while 1:
    t=int(x)
    datas[1]=t>>8
    datas[2]=t&0x00ff
    #datas.append(t>>8)
    #datas.append(t&0X00FF)
    t=int(y)
    datas[3]=t>>8
    datas[4]=t&0x00ff
    #datas.append(t>>8)
    #datas.append(t&0X00FF)
    #datas=np.array(datas, dtype=np.int8)
    port.write(datas)
    readbuff=port.read(5)
    a=struct.unpack("bbbbb",readbuff)
    b=(int(a[0])<<8)|int(a[1])
    c=int(a[2])<<8|int(a[3])
    print b,c
    time.sleep(0.5)
