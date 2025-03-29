#!/usr/bin/env python3
import rospy
from nav_msgs.msg import Odometry

def stop_callback(data):
    rospy.signal_shutdown("")

def odom_callback(msg):
    x = msg.pose.pose.position.x
    y = msg.pose.pose.position.y
    rospy.loginfo(f"Robot Position: x={x:.2f}, y={y:.2f}")

rospy.init_node("odometry_listener")
rospy.Timer(rospy.Duration(20), stop_callback)
rospy.Subscriber("/odom", Odometry, odom_callback)
rospy.spin()
