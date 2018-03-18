#include <ros.h>
#include <std_msgs/UInt16.h>
#include <std_msgs/Float32.h>
#include <sensor_msgs/JointState.h>
#include <Servo.h>
Servo myservo;
Servo myservo2;
Servo myservo3;
Servo myservo4;
Servo myservo5;
Servo myservo6;
Servo myservo7;
Servo myservo8;
Servo myservo9;
Servo myservo10;

ros::NodeHandle nh;

#define VELOCITY 0.1

int angle0;
int angle2;
int angle3;
int angle4;
int angle5;
int angle6;
int angle7;
int angle8;
int angle9;
int angle10;
//sensor_msgs::JointState data;
//std_msgs::Float32 state_msg;
//ros::Publisher pub("angle_state_publisher", &state_msg);
void servo_cb(const sensor_msgs::JointState &msg)
{
    
     angle0 =(int)msg.position[0];  
     myservo.write(angle0);
     
     angle2 =(int)msg.position[1];  
     myservo2.write(angle2);
     
     angle3 =(int)msg.position[2];  
     myservo3.write(angle3);
     
     angle4 =(int)msg.position[3];  
     myservo4.write(angle4); 
     
     angle5 =(int)msg.position[4];  
     myservo5.write(angle5);
     
     angle6 =(int)msg.position[5];  
     myservo6.write(angle6);
      
     angle7 =(int)msg.position[6];  
     myservo7.write(angle7);
     
     angle8 =(int)msg.position[7];  
     myservo8.write(angle8); 
     
     angle9 =(int)msg.position[8];  
     myservo9.write(angle9);
     
     angle10 =(int)msg.position[9];  
     myservo10.write(angle10);
    

         

}

ros::Subscriber<sensor_msgs::JointState> sub("/JointState", servo_cb);


void setup()
{
  pinMode(13, OUTPUT);
   
  nh.getHardware()->setBaud(115200);
  nh.initNode();
  nh.subscribe(sub);
//  nh.advertise(pub);
  myservo.attach(2);
  myservo2.attach(3);
  myservo3.attach(4);
  myservo4.attach(5);
  myservo5.attach(6);
  myservo6.attach(7);
  myservo7.attach(8);
  myservo8.attach(9);
  myservo9.attach(10);
  myservo10.attach(11);   

}

void loop()
{
// state_msg.data=angle_rad;
// pub.publish( &state_msg);
 //myservo.write(angle_rad[2]);
 nh.spinOnce();
 delay(1)  ;
}




