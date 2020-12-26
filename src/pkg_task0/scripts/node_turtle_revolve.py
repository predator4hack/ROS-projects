#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose
import sys
import numpy as np

pose_msg = Pose()
def callback(data):
	#Initializing Variables
	T_period = 10;			#Time period in seconds
	radius = 1;			#Radius in metres
	
	if data.theta<0:
		data.theta = data.theta+2*np.pi
	velocity_publisher = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
	vel_msg = Twist()
	#setting linear and angular velocity values based on theta values 
	if not(data.theta>6.27):
		# Linear velocity in the x-axis.
		vel_msg.linear.x = radius*2*np.pi/T_period
		vel_msg.linear.y = 0
		vel_msg.linear.z = 0

		# Angular velocity in the z-axis.
		vel_msg.angular.x = 0
		vel_msg.angular.y = 0
		vel_msg.angular.z = 2*np.pi/T_period

		# Publishing our vel_msg
		velocity_publisher.publish(vel_msg)
		rospy.loginfo("Moving in a circle\n"+format( data.theta))
	else:
		# Linear velocity in the x-axis.
		vel_msg.linear.x = 0
		vel_msg.linear.y = 0
		vel_msg.linear.z = 0

		# Angular velocity in the z-axis.
		vel_msg.angular.x = 0
		vel_msg.angular.y = 0
		vel_msg.angular.z = 0

		# Publishing our vel_msg
		velocity_publisher.publish(vel_msg)
		rospy.loginfo("goal reached")
		rospy.signal_shutdown('')
		
def node_turtle_revolve():
	rospy.init_node('node_turtle_revolve', anonymous = True) #setting up the node
	rospy.Subscriber("/turtle1/pose", Pose, callback) 
	
	rospy.spin()
if __name__ == '__main__':
    try:
       node_turtle_revolve()
    except rospy.ROSInterruptException:
        pass
