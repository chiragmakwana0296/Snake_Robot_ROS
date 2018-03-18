function sysCall_init()

    robotHandle=sim.getObjectAssociatedWithScript(sim.handle_self)
    axis_1=sim.getObjectHandle("Servo_H_1")
    axis_2=sim.getObjectHandle("Servo_V_2")
    axis_3=sim.getObjectHandle("Servo_H_3") -- Handle
    axis_4=sim.getObjectHandle("Servo_V_4")
    axis_5=sim.getObjectHandle("Servo_H_5") -- Handle
    axis_6=sim.getObjectHandle("Servo_V_6")
    axis_7=sim.getObjectHandle("Servo_H_7")
    axis_8=sim.getObjectHandle("Servo_V_8") -- Handle
    axis_9=sim.getObjectHandle("Servo_H_9")
    axis_10=sim.getObjectHandle("Servo_V_10")
    --target = sim.getObjectHandle("Target")
    --tip = sim.getObjectHandle("Tip")
-- Check if the required ROS plugin is there:
    moduleName=0
    moduleVersion=0
    index=0
    pluginNotFound=true
    while moduleName do
        moduleName,moduleVersion=sim.getModuleName(index)
        if (moduleName=='RosInterface') then
            pluginNotFound=false
        end
        index=index+1
    end
    -- Add a banner:
    if (pluginNotFound) then
        bannerText="ROS Not Connected"
    else
        bannerText="ROS Connected"
    end
    black={0,0,0,0,0,0,0,0,0,0,0,0}
    red={1,0.2,0.2,0,0,0,0,0,0,1,0.2,0.2}
    sim.addBanner(bannerText,0,sim.banner_bitmapfont+sim.banner_overlay,nil,sim.getObjectAssociatedWithScript(sim.handle_self),black,red)
    -- Ok now launch the ROS client application:
    if (not pluginNotFound) then
        local sysTime=sim.getSystemTimeInMs(-1)
        local JointsTopicName = 'JointIK'..sysTime
        local simulationTimeTopicName='simTime'..sysTime -- we add a random component so that we can have several instances of this robot running

    -- Prepare the sensor publisher and the motor speed subscribers:
        jointStatePub = simROS.advertise('/JointState','sensor_msgs/JointState')
        --publisher=simROS.advertise('/simulationTime','std_msgs/Float32')
        --simTimePub=simROS.advertise('/'..simulationTimeTopicName,'std_msgs/Float32')
        -- Now we start the client application:
        --result=sim.launchExecutable('rosRobotIK',JointsTopicName.." "..simulationTimeTopicName,0)
    end

end
--
function map(value,xmin,xmax,ymin,ymax)

out= ( ((value-xmin)*(ymax-ymin))/(xmax-xmin) )+ymin

return out
end
--
function getTransformStamped(objHandle,name,relTo,relToName)
    t=sim.getSystemTime()
    p=sim.getObjectPosition(objHandle,relTo)
    o=sim.getObjectQuaternion(objHandle,relTo)
    return {
        header={
            stamp=t,
            frame_id=relToName
                },

        child_frame_id=name,

        transform={
            translation={x=p[1],y=p[2],z=p[3]},
            rotation={x=o[1],y=o[2],z=o[3],w=o[4]}
                  }
            }
end

function sendJointStates()
 Xmin = -90
 Xmax =  90
 Ymin =  0
 Ymax =  180
 t= sim.getSystemTime()
 axis_1=sim.getObjectHandle("Servo_H_1")
 axis_2=sim.getObjectHandle("Servo_V_2")
 axis_3=sim.getObjectHandle("Servo_H_3") -- Handle
 axis_4=sim.getObjectHandle("Servo_V_4")
 axis_5=sim.getObjectHandle("Servo_H_5") -- Handle
 axis_6=sim.getObjectHandle("Servo_V_6")
 axis_7=sim.getObjectHandle("Servo_H_7")
 axis_8=sim.getObjectHandle("Servo_V_8") -- Handle
 axis_9=sim.getObjectHandle("Servo_H_9")
 axis_10=sim.getObjectHandle("Servo_V_10")

 J1r = sim.getJointTargetPosition(axis_1)
 J1d = math.deg(J1r)
J1 = map(J1d,Xmin,Xmax,Ymin,Ymax)

 J2r = sim.getJointTargetPosition(axis_2)
 J2d = math.deg(J2r)
J2 = map(J2d,Xmin,Xmax,Ymin,Ymax)

 J3r = sim.getJointTargetPosition(axis_3)
J3d = math.deg(J3r)
J3 = map(J3d,Xmin,Xmax,Ymin,Ymax)

 J4r = sim.getJointTargetPosition(axis_4)
J4d = math.deg(J4r)
J4 = map(J4d,Xmin,Xmax,Ymin,Ymax)

 J5r = sim.getJointTargetPosition(axis_5)
J5d = math.deg(J5r)
J5 = map(J5d,Xmin,Xmax,Ymin,Ymax)

 J6r = sim.getJointTargetPosition(axis_6)
J6d = math.deg(J6r)
J6 = map(J6d,Xmin,Xmax,Ymin,Ymax)

 J7r = sim.getJointTargetPosition(axis_7)
J7d = math.deg(J7r)
J7 = map(J7d,Xmin,Xmax,Ymin,Ymax)

 J8r = sim.getJointTargetPosition(axis_8)
J8d = math.deg(J8r)
J8 = map(J8d,Xmin,Xmax,Ymin,Ymax)

 J9r = sim.getJointTargetPosition(axis_9)
J9d = math.deg(J9r)
J9 = map(J9d,Xmin,Xmax,Ymin,Ymax)

 J10r = sim.getJointTargetPosition(axis_10)
J10d = math.deg(J10r)
J10 = map(J10d,Xmin,Xmax,Ymin,Ymax)

joint_state = {J1,J2,J3,J4,J5,J6,J7,J8,J9,J10}
--
 F1 = sim.getJointForce(axis_1)
 F2 = sim.getJointForce(axis_2)
 F3 = sim.getJointForce(axis_3)
 F4 = sim.getJointForce(axis_4)
 F5 = sim.getJointForce(axis_5)
 F6 = sim.getJointForce(axis_6)
 F7 = sim.getJointForce(axis_7)
 F8 = sim.getJointForce(axis_8)
 F9 = sim.getJointForce(axis_9)
 F10 = sim.getJointForce(axis_10)
torque = {F1,F2,F3,F4,F5,F6}
--
V1=sim.getJointTargetVelocity(axis_1)
V2=sim.getJointTargetVelocity(axis_2)
V3=sim.getJointTargetVelocity(axis_3)
V4=sim.getJointTargetVelocity(axis_4)
V5=sim.getJointTargetVelocity(axis_5)
V6=sim.getJointTargetVelocity(axis_6)
V7=sim.getJointTargetVelocity(axis_7)
V8=sim.getJointTargetVelocity(axis_8)
V9=sim.getJointTargetVelocity(axis_9)
V10=sim.getJointTargetVelocity(axis_10)
Velocity = {V1,V2,V3,V4,V5,V6,V7,V8,V9,V10}
        return {
                header={
                        stamp = t,
                        frame_id='world'
                       },
                name={'j1','j2','j3','j4','j5','j6','j7','j8','j9','j10'},
                position=joint_state,
                velocity=Velocity,
                effort=torque,
           }
end
--


function sysCall_actuation()
    -- Send an updated sensor and simulation time message, and send the transform of the robot:
    if not pluginNotFound then
        --simROS.publish(simTimePub,{data=sim.getSimulationTime()})
        simROS.publish(jointStatePub,sendJointStates())
        -- Send the robot's transform:
        --simROS.sendTransform(getTransformStamped(tip,'EndEffector',-1,'world'))
        -- To send several transforms at once, use simROS.sendTransforms instead
    end
end

function sysCall_cleanup()
    if not pluginNotFound then
        -- Following not really needed in a simulation script (i.e. automatically shut down at simulation end):
        --simROS.shutdownPublisher(jointStatePub)

    end
end
