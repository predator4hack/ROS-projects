#!/usr/bin/env python
import sys
import rospy
import moveit_commander
import geometry_msgs.msg
from tf import TransformListener
import tf2_ros
from object_msgs.msg import ObjectPose

moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('move_group_python_interface_tutorial', anonymous=True)
robot = moveit_commander.RobotCommander()


# Put the arm in the start position
arm_group = moveit_commander.MoveGroupCommander("eyantra_arm")
arm_group.set_named_target("camera_ready")
plan1 = arm_group.go()

hand_group = moveit_commander.MoveGroupCommander("eyantra_hand")
# Open the gripper
hand_group.set_named_target("open")
plan2 = hand_group.go()

rate = rospy.Rate(10.0)

rospy.init_node('listner', anonymous=True)
sus = rospy.Subscriber("/detection_info", ObjectPose)

if obj.name == "Battery":
    
    # put the arm at the 1st grasping position
    pose_target = geometry_msgs.msg.Pose()
    pose_target.orientation.w = 0.5
    pose_target.orientation.x = -0.5
    pose_target.orientation.y = 0.5
    pose_target.orientation.z = -0.5
    pose_target.position.x = obj.pose.pose.position.x
    pose_target.position.y = obj.pose.pose.position.y
    pose_target.position.z = obj.pose.pose.position.z - 0.15
    arm_group.set_pose_target(pose_target)
    plan1 = arm_group.go()

    # put the arm at the 2nd grasping position
    pose_target.position.z += 0.15
    arm_group.set_pose_target(pose_target)
    plan1 = arm_group.go()

    # close the gripper
    hand_group.set_named_target("close")
    plan2 = hand_group.go()

    # put the arm at the 3rd grasping position
    pose_target.position.z = 1.5
    arm_group.set_pose_target(pose_target)
    plan1 = arm_group.go()


rate.sleep()
moveit_commander.roscpp_shutdown()