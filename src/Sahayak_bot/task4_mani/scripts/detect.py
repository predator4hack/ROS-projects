#!/usr/bin/env python
import rospy
from object_msgs.msg import ObjectPose
import tf
from tf import TransformListener
import tf2_ros
import sys
import moveit_commander
import geometry_msgs.msg

def topicPublisher():

    moveit_commander.roscpp_initialize(sys.argv)
    robot = moveit_commander.RobotCommander()

    # Put the arm in the start position
    arm_group = moveit_commander.MoveGroupCommander("eyantra_arm")
    arm_group.set_named_target("camera_ready")
    plan1 = arm_group.go()

    rospy.sleep(5)

    pos_pub = rospy.Publisher('/detection_info', ObjectPose, queue_size=1)
    rospy.init_node('pose_pub_node', anonymous=True)
    obj_pose1 = ObjectPose()
    obj_pose2 = ObjectPose()
    obj_pose3 = ObjectPose()
    tf2_buffer = tf2_ros.Buffer()
    t = TransformListener(tf2_buffer)

    rate = rospy.Rate(10.0)

    while not rospy.is_shutdown():
        try:
            # t.waitForTransform("/base_link", "/object_63", rospy.Time(), rospy.Duration(10.0))
            trans1 = t.lookupTransform("/base_link", "/object_63", rospy.Time())
            # t.waitForTransform("/base_link", "/object_64", rospy.Time(), rospy.Duration(10.0))
            trans2 = t.lookupTransform("base_link", "object_64", rospy.Time())
            # t.waitForTransform("/base_link", "/object_65", rospy.Time(), rospy.Duration(10.0))
            trans3 = t.lookupTransform("base_link", "object_66", rospy.Time())
        except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
            rate.sleep()
            continue

        obj_pose1.name = "Coke_can"
        obj_pose1.pose.header.frame_id = "object_63"
        obj_pose1.pose.header.stamp = rospy.Time.now()
        obj_pose1.pose.pose.position.x = trans1[0][0]
        obj_pose1.pose.pose.position.y = trans1[0][1]
        obj_pose1.pose.pose.position.z = trans1[0][2]

        obj_pose2.name = "Battery"
        obj_pose2.pose.header.frame_id = "object_64"
        obj_pose2.pose.header.stamp = rospy.Time.now()
        obj_pose2.pose.pose.position.x = trans2[0][0]
        obj_pose2.pose.pose.position.y = trans2[0][1]
        obj_pose2.pose.pose.position.z = trans2[0][2]

        obj_pose3.name = "Glue_box"
        obj_pose3.pose.header.frame_id = "object_66"
        obj_pose3.pose.header.stamp = rospy.Time.now()
        obj_pose3.pose.pose.position.x = trans3[0][0]
        obj_pose3.pose.pose.position.y = trans3[0][1]
        obj_pose3.pose.pose.position.z = trans3[0][2]

        rate.sleep()

        if obj_pose1 and obj_pose2 and obj_pose3:
            break

    pos_pub.publish(obj_pose1)
    rospy.sleep(1)
    pos_pub.publish(obj_pose2)
    rospy.sleep(1)
    pos_pub.publish(obj_pose3)

    hand_group = moveit_commander.MoveGroupCommander("eyantra_hand")
    # Open the gripper
    hand_group.set_named_target("open")
    plan2 = hand_group.go()

    print(obj_pose1)

    # put the arm at the 1st grasping position
    pose_target = geometry_msgs.msg.Pose()
    pose_target.orientation.w = 0.5
    pose_target.orientation.x = -0.5
    pose_target.orientation.y = 0.5
    pose_target.orientation.z = -0.5
    pose_target.position.x = obj_pose1.pose.pose.position.x
    pose_target.position.y = obj_pose1.pose.pose.position.y
    pose_target.position.z = obj_pose1.pose.pose.position.z
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

    rospy.sleep(1)


if __name__ == "__main__":
    try:
        topicPublisher()
    except rospy.ROSInterruptException:
        pass