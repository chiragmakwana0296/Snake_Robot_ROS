## Task 1.2 - Path Planning in V-REP ##
# Import modules
import vrep
from vrep import *
import vrepConst
import sys
import time
import math

'''
==================================Parameter===========================================
'''
counter = 0  #Loop counter variable
lag = math.pi/4 # Phase lag between segments
frequency_v = 1 # Oscillation frequency of segments.
frequency_h = 1
frequency =1
amplitude_H =40  # Amplitude of the serpentine motion of the snake
amplitude_V =40
i=0
j=360
'''
================================== Function ===========================================
'''
def set_angle(handle,angle):     #
    angle = angle*math.pi/180
    simxSetJointTargetPosition(clientID,handle,angle,simx_opmode_oneshot)
#============================================================================================
def forword():
    for counter in range(0,360):
        time.sleep(0.005)
        S = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+0*lag))
        set_angle(s1_joint,S)
        S0 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+1*lag))
        set_angle(s2_joint,S0)
        S1 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+2*lag))
        set_angle(s3_joint,S1)
        S2 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+3*lag))
        set_angle(s4_joint,S2)
        S3 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+4*lag))
        set_angle(s5_joint,S3)
        S4 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+5*lag))
        set_angle(s6_joint,S4)
        S5 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+6*lag))
        set_angle(s7_joint,S5)
        S6 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+7*lag))
        set_angle(s8_joint,S6)
        S7 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+8*lag))
        set_angle(s9_joint,S7)
        S8 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+9*lag))
        set_angle(s10_joint,S8)
#============================================================================================
def backword():
    for counter in range(360,0,-1):
        time.sleep(0.005)
        S = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+0*lag))
        set_angle(s1_joint,S)
        S0 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+1*lag))
        set_angle(s2_joint,S0)
        S1 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+2*lag))
        set_angle(s3_joint,S1)
        S2 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+3*lag))
        set_angle(s4_joint,S2)
        S3 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+4*lag))
        set_angle(s5_joint,S3)
        S4 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+5*lag))
        set_angle(s6_joint,S4)
        S5 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+6*lag))
        set_angle(s7_joint,S5)
        S6 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+7*lag))
        set_angle(s8_joint,S6)
        S7 = (amplitude_H*math.sin(frequency_h*counter*3.14159/180+8*lag))
        set_angle(s9_joint,S7)
        S8 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+9*lag))
        set_angle(s10_joint,S8)
#============================================================================================
def side_winding_left():
    lag=2
    for counter in range(0,360):
        time.sleep(0.005)
        S = (amplitude_H*math.cos(frequency*counter*3.14159/180-0*lag))
        set_angle(s1_joint,S)
        S1 = (amplitude_H*math.cos(frequency*counter*3.14159/180-1*lag))
        set_angle(s3_joint,S1)
        S3 = (amplitude_H*math.cos(frequency*counter*3.14159/180-2*lag))
        set_angle(s5_joint,S3)
        S5 = (amplitude_H*math.cos(frequency*counter*3.14159/180-3*lag))
        set_angle(s7_joint,S5)
        S7 = (amplitude_H*math.cos(frequency*counter*3.14159/180-4*lag))
        set_angle(s9_joint,S7)

        S0 = (amplitude_V*math.cos(frequency*counter*3.14159/180-0*lag))
        set_angle(s2_joint,S0)
        S2 = (amplitude_V*math.cos(frequency*counter*3.14159/180-1*lag))
        set_angle(s4_joint,S2)
        S4 = (amplitude_V*math.cos(frequency*counter*3.14159/180-2*lag))
        set_angle(s6_joint,S4)
        S6 = (amplitude_V*math.cos(frequency*counter*3.14159/180-3*lag))
        set_angle(s8_joint,S6)
        S8 = (amplitude_V*math.cos(frequency*counter*3.14159/180-4*lag))
        set_angle(s10_joint,S8)
#============================================================================================
def side_winding_right():
    lag=2
    for counter in range(360,0,-1):
        time.sleep(0.005)
        S = (amplitude_H*math.cos(frequency*counter*3.14159/180-0*lag))
        set_angle(s1_joint,S)
        S1 = (amplitude_H*math.cos(frequency*counter*3.14159/180-1*lag))
        set_angle(s3_joint,S1)
        S3 = (amplitude_H*math.cos(frequency*counter*3.14159/180-2*lag))
        set_angle(s5_joint,S3)
        S5 = (amplitude_H*math.cos(frequency*counter*3.14159/180-3*lag))
        set_angle(s7_joint,S5)
        S7 = (amplitude_H*math.cos(frequency*counter*3.14159/180-4*lag))
        set_angle(s9_joint,S7)

        S0 = (amplitude_V*math.cos(frequency*counter*3.14159/180-0*lag))
        set_angle(s2_joint,S0)
        S2 = (amplitude_V*math.cos(frequency*counter*3.14159/180-1*lag))
        set_angle(s4_joint,S2)
        S4 = (amplitude_V*math.cos(frequency*counter*3.14159/180-2*lag))
        set_angle(s6_joint,S4)
        S6 = (amplitude_V*math.cos(frequency*counter*3.14159/180-3*lag))
        set_angle(s8_joint,S6)
        S8 = (amplitude_V*math.cos(frequency*counter*3.14159/180-4*lag))
        set_angle(s10_joint,S8)
#============================================================================================
def Rotate_CCW():
    for counter in range (360,0,-1):
        time.sleep(0.005)
        S = (amplitude_H*math.cos(frequency*counter*3.14159/180+4*lag))
        set_angle(s1_joint,S)

        S0 = (amplitude_V*math.sin(frequency*counter*3.14159/180+3*(360-lag)))
        set_angle(s2_joint,S0)
        S1 = (amplitude_H*math.cos(frequency*counter*3.14159/180+2*lag))
        set_angle(s3_joint,S1)
        S2 = (amplitude_V*math.sin(frequency*counter*3.14159/180+1*(360-lag)))
        set_angle(s4_joint,S2)
        S3 = (amplitude_H*math.cos(frequency*counter*3.14159/180+0*lag))
        set_angle(s5_joint,S3)
        S4 = (amplitude_V*math.sin(frequency*counter*3.14159/180-1*(360-lag)))
        set_angle(s6_joint,S4)
        S5 = (amplitude_H*math.cos(frequency*counter*3.14159/180-2*lag))
        set_angle(s7_joint,S5)
        S6 = (amplitude_V*math.sin(frequency*counter*3.14159/180-3*(360-lag)))
        set_angle(s8_joint,S6)
        S7 = (amplitude_H*math.cos(frequency*counter*3.14159/180-4*lag))
        set_angle(s9_joint,S7)
        S8 = (amplitude_V*math.sin(frequency*counter*3.14159/180-5*(360-lag)))
        set_angle(s10_joint,S8)
#============================================================================================
def forword_left():
    ro = 15
    f = 0.1
    lo = -15
    for counter in range(0,10,1):
        time.sleep(0.005)
        S = ((f*counter*ro)+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+0*lag))
        set_angle(s1_joint,S)
        S0 =(amplitude_V*math.cos(frequency_v*counter*3.14159/180+1*lag))
        set_angle(s2_joint,S0)
        S1 =((f*counter*ro)+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+2*lag))
        set_angle(s3_joint,S1)
        S2 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+3*lag))
        set_angle(s4_joint,S2)
        S3 = ((f*counter*ro)+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+4*lag))
        set_angle(s5_joint,S3)
        S4 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+5*lag))
        set_angle(s6_joint,S4)
        S5 = ((f*counter*ro)+amplitude_H*math.sin(frequency_h*counter*3.14159/180+6*lag))
        set_angle(s7_joint,S5)
        S6 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+7*lag))
        set_angle(s8_joint,S6)
        S7 = ((f*counter*ro)+amplitude_H*math.sin(frequency_h*counter*3.14159/180+8*lag))
        set_angle(s9_joint,S7)
        S8 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+9*lag))
        set_angle(s10_joint,S8)
    for counter in range (11,350):
        time.sleep(0.005)
        S = (ro+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+0*lag))
        set_angle(s1_joint,S)
        S0 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+1*lag))
        set_angle(s2_joint,S0)
        S1 = (ro+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+2*lag))
        set_angle(s3_joint,S1)
        S2 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+3*lag))
        set_angle(s4_joint,S2)
        S3 = (ro+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+4*lag))
        set_angle(s5_joint,S3)
        S4 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+5*lag))
        set_angle(s6_joint,S4)
        S5 = (ro+amplitude_H*math.sin(frequency_h*counter*3.14159/180+6*lag))
        set_angle(s7_joint,S5)
        S6 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+7*lag))
        set_angle(s8_joint,S6)
        S7 = (ro+amplitude_H*math.sin(frequency_h*counter*3.14159/180+8*lag))
        set_angle(s9_joint,S7)
        S8 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+9*lag))
        set_angle(s10_joint,S8)
    for counter in range(350,360):
        time.sleep(0.005)
        S = ((f*(360-counter)*ro)+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+0*lag))
        set_angle(s1_joint,S)
        S0 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+1*lag))
        set_angle(s2_joint,S0)
        S1 = ((f*(360-counter)*ro)+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+2*lag))
        set_angle(s3_joint,S1)
        S2 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+3*lag))
        set_angle(s4_joint,S2)
        S3 = ((f*(360-counter)*ro)+10+amplitude_H*math.sin(frequency_h*counter*3.14159/180+4*lag))
        set_angle(s5_joint,S3)
        S4 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+5*lag))
        set_angle(s6_joint,S4)
        S5 = ((f*(360-counter)*ro)+amplitude_H*math.sin(frequency_h*counter*3.14159/180+6*lag))
        set_angle(s7_joint,S5)
        S6 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+7*lag))
        set_angle(s8_joint,S6)
        S7 = ((f*(360-counter)*ro)+amplitude_H*math.sin(frequency_h*counter*3.14159/180+8*lag))
        set_angle(s9_joint,S7)
        S8 = (amplitude_V*math.cos(frequency_v*counter*3.14159/180+9*lag))
        set_angle(s10_joint,S8)
#============================================================================================

#============================================================================================
#============================================================================================
'''
==================================/ Function-End /===========================================
'''

################ Initialization of handles. Do not change the following section ###################################
vrep.simxFinish(-1)
clientID=vrep.simxStart('127.0.0.1',19997,True,True,5000,5)
if clientID!=-1:
	print "connected to remote api server"
else:
	print 'connection not successful'
	sys.exit("could not connect")
'''
---------------------------------------Handles--------------------------------------
'''
returnCode,s1_joint=vrep.simxGetObjectHandle(clientID,'Servo_H_1',vrep.simx_opmode_oneshot_wait )
returnCode,s2_joint=vrep.simxGetObjectHandle(clientID,'Servo_V_2',vrep.simx_opmode_oneshot_wait )
returnCode,s3_joint=vrep.simxGetObjectHandle(clientID,'Servo_H_3',vrep.simx_opmode_oneshot_wait )
returnCode,s4_joint=vrep.simxGetObjectHandle(clientID,'Servo_V_4',vrep.simx_opmode_oneshot_wait )
returnCode,s5_joint=vrep.simxGetObjectHandle(clientID,'Servo_H_5',vrep.simx_opmode_oneshot_wait )
returnCode,s6_joint=vrep.simxGetObjectHandle(clientID,'Servo_V_6',vrep.simx_opmode_oneshot_wait )
returnCode,s7_joint=vrep.simxGetObjectHandle(clientID,'Servo_H_7',vrep.simx_opmode_oneshot_wait )
returnCode,s8_joint=vrep.simxGetObjectHandle(clientID,'Servo_V_8',vrep.simx_opmode_oneshot_wait )
returnCode,s9_joint=vrep.simxGetObjectHandle(clientID,'Servo_H_9',vrep.simx_opmode_oneshot_wait )
returnCode,s10_joint=vrep.simxGetObjectHandle(clientID,'Servo_V_10',vrep.simx_opmode_oneshot_wait )
#joint_handles=[joint_h1,joint_v2,joint_h3,joint_v4,joint_h5,joint_v6,joint_h7,joint_v8,joint_h9,joint_v10]
#####################################################################################################################
vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot_wait)
# Write your code here
while True:
    #forword()
    #backword()
    #forword_left()
    #Rotate_CCW()
    #side_winding_right()
    side_winding_left()
################     Do not change after this #####################
#end of simulation
vrep.simxStopSimulation(clientID,vrep.simx_opmode_oneshot)
