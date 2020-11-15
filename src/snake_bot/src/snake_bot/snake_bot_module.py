#!/usr/bin/env python
import rospy
import threading
import vrep
import time
from sensor_msgs.msg import Joy
from sensor_msgs.msg import JointState

class SnakeRobot():
    def __init__(self,connectionAddress='127.0.0.1' , connectionPort= 19997, waitUntilConnected=True, doNotReconnectOnceDisconnected=True, timeOutInMs=5000, commThreadCycleInMs=5):
                
        rospy.init_node('snake_bot_node')
        self.clientID = None

        self.connectionAddress = connectionAddress 
        self.connectionPort = connectionPort
        self.waitUntilConnected = waitUntilConnected
        self.doNotReconnectOnceDisconnected = doNotReconnectOnceDisconnected
        self.timeOutInMs = timeOutInMs
        self.commThreadCycleInMs = commThreadCycleInMs

        t1 = threading.Thread(target=self.subscriber_thread)
        t1.start()
        self.joint_state_pub = rospy.Publisher("/JointStates",JointState,queue_size=1)


    def get_object_handle(self):
        returnCode,self.servo_handle[0] = vrep.simxGetObjectHandle(self.clientID,'Servo_H_1',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[1] = vrep.simxGetObjectHandle(self.clientID,'Servo_V_2',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[2] = vrep.simxGetObjectHandle(self.clientID,'Servo_H_3',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[3] = vrep.simxGetObjectHandle(self.clientID,'Servo_V_4',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[4] = vrep.simxGetObjectHandle(self.clientID,'Servo_H_5',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[5] = vrep.simxGetObjectHandle(self.clientID,'Servo_V_6',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[6] = vrep.simxGetObjectHandle(self.clientID,'Servo_H_7',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[7] = vrep.simxGetObjectHandle(self.clientID,'Servo_V_8',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[8] = vrep.simxGetObjectHandle(self.clientID,'Servo_H_9',vrep.simx_opmode_oneshot_wait)
        returnCode,self.servo_handle[9] = vrep.simxGetObjectHandle(self.clientID,'Servo_V_10',vrep.simx_opmode_oneshot_wait)
        return servo_handle


    def pub_joint_states(self):
        joint_position = []
        Xmin = -90
        Xmax = 90
        Ymin =  0
        Ymax =  180
        joints = self.get_object_handle()
        for joint in joints:
            joint_position = vrep.simxGetJointPosition(self.clientID, joint, vrep.simx_opmode_oneshot_wait)
            joint_position.append(map_joint_angle(joint_position,Xmin,Xmax,Ymin,Ymax))
        joint_state_msg = JointState()
        joint_state_msg.header.stamp = rospy.time()
        joint_state_msg.header.frame_id = "Robot_frame"
        joint_state_msg.position = joint_position
        self.joint_state_pub.publish(joint_state_msg)


    def map_joint_angle(self,value,xmin,xmax,ymin,ymax):
        out= ( ((value-xmin)*(ymax-ymin))/(xmax-xmin) )+ymin
        return out


    def connect(self):
        vrep.simxFinish(-1) #close all opened connections

        self.clientID=vrep.simxStart(self.connectionAddress, self.connectionPort, self.waitUntilConnected, self.doNotReconnectOnceDisconnected, self.timeOutInMs, self.commThreadCycleInMs) # Connect to V-REP
        if self.clientID!=-1:
            print ('Connected to remote API server')
            while True:
                try:
                    pub_joint_states()
                except rospy.ROSInterruptException:
                    pass        
        else:
            rospy.loginfo("Failed connecting to remote API server")


"""
if __name__ == "__main__":
    R = Robot()
    R.connect()

"""


