
-- Function to set the joints to particular angle in degrees
set_angle = function(handle, angle)
    sim.setJointTargetPosition(handle, angle*math.pi/180)
end

-- Put some initialization code here
s1_joint = sim.getObjectHandle('Servo_H_1')
s2_joint = sim.getObjectHandle('Servo_V_2')
s3_joint = sim.getObjectHandle('Servo_H_3')
s4_joint = sim.getObjectHandle('Servo_V_4')
s5_joint = sim.getObjectHandle('Servo_H_5')
s6_joint = sim.getObjectHandle('Servo_V_6')
s7_joint = sim.getObjectHandle('Servo_H_7')
s8_joint = sim.getObjectHandle('Servo_V_8')
s9_joint = sim.getObjectHandle('Servo_H_9')
s10_joint = sim.getObjectHandle('Servo_V_10')


counter = 0-- // Loop counter variable
lag = math.pi/4 --; // Phase lag between segments
frequency_v = 1--; // Oscillation frequency of segments.
frequency_h = 1
frequency =1
amplitude_H =40--; // Amplitude of the serpentine motion of the snake
amplitude_V =40
i=0
j=360
forword = function()

        for counter=i,j,1 do
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
end
end
--
Rotate_CW = function()
    for counter=0,360,1 do

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
    end
end
---
side_winding_left = function()
lag=2
    for counter=0,360,1 do
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
end
end
--
side_winding_right = function()
lag=2
    for counter=360,0,-1 do
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
end
end
--
Rotate_CCW = function()
    for counter=360,0,-1 do

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
    end
end

forword_left = function()
    ro = 15
    f = 0.1
    lo = -15
 --(0.1*counter*ro)+
  for counter=0,10,1 do
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
end
     for counter=11,350,1 do
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
end
  for counter=350,360,1 do
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
end
end
--





-- Put your main loop here
while sim.getSimulationState()~=sim.simulation_advancing_abouttostop do
   -- Rotate_CW()
   -- Rotate_CCW()
   -- side_winding_left()
   -- side_winding_right()
      forword()
    --  forword_left()
end

-- Put some clean-up code here



-- ADDITIONAL DETAILS:
-- -------------------------------------------------------------------------
-- If you wish to synchronize a threaded loop with each simulation pass,
-- enable the explicit thread switching with
--
--sim.setThreadAutomaticSwitch(true)
--
-- then use
--
-- sim.switchThread()
--
-- When you want to resume execution in next simulation step (i.e. at t=t+dt)
--
-- sim.switchThread() can also be used normally, in order to not waste too much
-- computation time in a given simulation step
-- ----------------------------------------------------------------------------
